// load .env data into process.env
require("dotenv").config();

// Web server config
const PORT = process.env.PORT || 8080;
const sassMiddleware = require("./lib/sass-middleware");
const express = require("express");
const cookieParser = require('cookie-parser')
const app = express();
const morgan = require("morgan");

// PG database client/connection setup
const { Pool } = require("pg");
const dbParams = require("./lib/db.js");
const db = new Pool(dbParams);
db.connect();

// Load the logger first so all (static) HTTP requests are logged to STDOUT
// 'dev' = Concise output colored by response status for development use.
//         The :status token will be colored red for server error codes, yellow for client error codes, cyan for redirection codes, and uncolored for all other codes.
app.use(morgan("dev"));

app.use(cookieParser());

app.set("view engine", "ejs");
app.use(express.urlencoded({ extended: true }));

app.use(
  "/styles",
  sassMiddleware({
    source: __dirname + "/styles",
    destination: __dirname + "/public/styles",
    isSass: false, // false => scss, true => sass
  })
);

app.use(express.static("public"));

// Separated Routes for each Resource
// Note: Feel free to replace the example routes below with your own
const menuRoutes = require("./routes/menu");
const cartRoutes = require("./routes/cart");
const orderRoutes = require("./routes/order");

// Mount all resource routes
app.use("/menu", menuRoutes(db));
app.use("/cart", cartRoutes(db));
app.use("/order", orderRoutes(db));

// Home page
app.get("/", (req, res) => {
  res.render("index");
});

app.get("/login/:id", (req, res) => {
  res.cookie("id", req.params.id);
  res.redirect("/menu");
});

app.listen(PORT);
