/*
 * All routes for Menu are defined here
 * Since this file is loaded in server.js into api/users,
 *   these routes are mounted onto /users
 * See: https://expressjs.com/en/guide/using-middleware.html#middleware.router
 */

const express = require("express");
const router = express.Router();

module.exports = (db) => {
  router.get("/", async (req, res) => {
    let error, user_name, estimated_time, amount, phone;

    if (!req.cookies.id) {
      error = "Please login!";
    } else if (!req.cookies.cart) {
      error = "Your cart is empty.";
    } else if (typeof req.cookies.cart === "undefined" || !req.cookies.cart || !JSON.parse(req.cookies.cart)) {
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
          const cart = [];
          for (let id of split_cart) {
            if (isNaN(parseInt(id, 10))) {
              error = "One of your items is not a number!";
              break;
            }

            estimated_time = 0;
            amount = 0;
            await db.query(`SELECT * FROM foods WHERE id = $1`, [id]).then((food) => {
              const item = food.rows[0];
              if (item && item.is_active) {
                estimated_time += item.preparation_time;
                amount += item.price;
              }
            });
          }
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
