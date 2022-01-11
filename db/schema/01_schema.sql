-- DROP DATABASE [IF EXISTS] template1;

-- CREATE DATABASE template1
--     WITH
--     OWNER = labber
--     ENCODING = 'UTF8'
--     CONNECTION LIMIT = -1;

-- \c template1;

DROP DATABASE [IF EXISTS] food;

CREATE DATABASE food
    WITH
    OWNER = labber
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

\c food;


DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS foods CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS order_details CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS widgets CASCADE;


CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  phone VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  password VARCHAR(100) NOT NULL,
  is_customer BOOLEAN NOT NULL,    -- optional
  user_since TIMESTAMP NOT NULL DEFAULT Now()
);


CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  name VARCHAR(255) NOT NULL,
  phone VARCHAR(20) NOT NULL
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  is_active BOOLEAN DEFAULT true
);

CREATE TABLE foods (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  url_image VARCHAR(255) NOT NULL,
  price INTEGER  NOT NULL DEFAULT 0,
  category_id INTEGER REFERENCES categories(id) ON DELETE CASCADE,
  estimated_time TIME NOT NULL,
  is_active BOOLEAN DEFAULT true
);


CREATE TABLE orders (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  amount INTEGER NOT NULL,
  when_ordered TIMESTAMP DEFAULT now(),
  when_completed TIMESTAMP DEFAULT now(),
  when_pickedUp TIMESTAMP DEFAULT now(),
  is_paid BOOLEAN DEFAULT false,
  is_picked_up BOOLEAN DEFAULT false,
  is_ready BOOLEAN DEFAULT false,
  special_instructions TEXT
);


CREATE TABLE order_details (
  id SERIAL PRIMARY KEY NOT NULL,
  order_id INTEGER NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
  food_id INTEGER NOT NULL REFERENCES foods(id) ON DELETE CASCADE,
  no_of_serving int(4) NOT NULL,
  total_amount float NOT NULL,
);


-- Drop and recreate Widgets table (Example)

CREATE TABLE widgets (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id),
  name VARCHAR(255) NOT NULL
);
