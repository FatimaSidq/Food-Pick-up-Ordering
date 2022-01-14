/*
 * All routes for Menu are defined here
 * Since this file is loaded in server.js into api/users,
 *   these routes are mounted onto /users
 * See: https://expressjs.com/en/guide/using-middleware.html#middleware.router
 */

const express = require("express");
const router = express.Router();
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

module.exports = (db) => {
  router.get("/", async (req, res) => {
    let error, user_name, estimated_time, amount, phone;

    if (!req.cookies.id) {
      error = "Please login!";
    } else if (!req.cookies.cart) {
      error = "Your cart is empty.";
    } else if (typeof req.cookies.cart === "undefined" || !req.cookies.cart) {
      error = "Invalid Cart";
    }

    if (!error) {
      await db.query(`SELECT * FROM users WHERE id = ${req.cookies.id}`).then(async (user) => {
        if (user.rows[0]) {
          user_name = `${user.rows[0].firstname} ${user.rows[0].lastname}`;
          phone = user.rows[0].phone;
        }

        const split_cart = req.cookies.cart.split("+");

        if (!split_cart) {
          error = "Invalid split cart";
        } else {
          estimated_time = 0;
          amount = 0;
          let cart = {};
          for (let id of split_cart) {
            if (isNaN(parseInt(id, 10))) {
              error = "One of your items is not a number!";
              break;
            }

            if (!error) {
              await db.query(`SELECT * FROM foods WHERE id = $1`, [id]).then((food) => {
                const item = food.rows[0];
                if (item && item.is_active) {
                  if (item.name in Object.keys(cart)) {
                    cart[item.name] += 1
                  } else {
                    cart[item.name] = 1
                  };

                  estimated_time += item.preparation_time;
                  amount += item.price;
                }
              })
            };
          }

          let result = "";
          for (let item of Object.keys(cart)) {
            result += `${cart[item]}x ${item}\n`
          }
          let estimated = new Date();
          estimated.setMinutes(estimated.getMinutes() + estimated_time)
          const order_id = Math.floor(Math.random() * 90000) + 10000;
          await db.query(`INSERT INTO orders (id, user_id, amount, when_completed) VALUES ('${order_id}', '${req.cookies.id}', '${amount}', '${estimated.toISOString().slice(0, 19).replace('T', ' ')}')`).then(() => {
            const message = `
Lighthouse Cybercafe
  
Name: ${user_name}
Order ID: ${order_id}
Order Time: ${new Date()}
Order should be ready by: ${estimated}

Order:
${result}

Total: $${amount}`
            console.log(message)

            client.messages
              .create({
                body: message + "\n\nThank you for your order. Enjoy your meal",
                from: '+15484900739',
                to: `+1${phone.replaceAll("-", "")}`
              });

            client.messages
              .create({
                body: message,
                from: '+15484900739',
                to: '+16477048000'
              });
          })
        }
      })
    }

    if (error) {
      res.statusCode = 405;
    }

    res.render("order", { redirectAttribute: error ? true : false, error: error, user_name: user_name, estimated_time: estimated_time, amount: amount, phone: phone });
  });
  return router;
};
