/*
 * All routes for Cart are defined here
 * Since this file is loaded in server.js into api/users,
 *   these routes are mounted onto /users
 * See: https://expressjs.com/en/guide/using-middleware.html#middleware.router
 */

const express = require("express");
const router = express.Router();

module.exports = (db) => {
  router.get("/", async (req, res) => {
    const templateVars = { id: req.cookies.id ? req.cookies.id : "" };
    if (
      typeof req.cookies.cart === "undefined" ||
      !req.cookies.cart ||
      !req.cookies.cart.length
    ) {
      templateVars["cart"] = JSON.stringify("");
      res.render("cart", templateVars);
      return;
    }

    const split_cart = req.cookies.cart.split("+");

    if (!split_cart) {
      templateVars["cart"] = JSON.stringify("");
      res.render("cart", templateVars);
      return;
    }
    const cart = [];
    for (let id of split_cart) {
      if (isNaN(parseInt(id, 10))) {
        templateVars["cart"] = JSON.stringify("");
        res.render("cart", templateVars);
        return;
      }
      id = JSON.parse(id);
      if (id && typeof id === "number") {
        await db
          .query(`SELECT * FROM foods WHERE id = $1`, [id])
          .then((food) => {
            const item = food.rows[0];
            if (item && item.is_active) {
              cart.push(item);
            }
          });
      }
    }
    templateVars["cart"] = JSON.stringify(cart);
    res.render("cart", templateVars);
  });
  return router;
};
