/*
 * All routes for Menu are defined here
 * Since this file is loaded in server.js into api/users,
 *   these routes are mounted onto /users
 * See: https://expressjs.com/en/guide/using-middleware.html#middleware.router
 */

const express = require("express");
const router = express.Router();

module.exports = (db) => {
  router.get("/", (req, res) => {
    db.query("SELECT * FROM categories").then((data) => {
      let categories = {};
      for (let category of data.rows) {
        if (category.is_active) {
          categories[category.id] = {
            name: category.name,
            description: category.description,
            foods: [],
          };
        }
      }

      db.query("SELECT * FROM foods").then((foods) => {
        for (let food of foods.rows) {
          if (food.is_active) {
            categories[food.category_id].foods.push(food);
          }
        }

        res.render("menu", { id: req.cookies.id ? req.cookies.id : "", categories: JSON.stringify(categories) });
      });
    });
  });
  return router;
};
