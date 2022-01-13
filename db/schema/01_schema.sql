DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS foods CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS order_details CASCADE;
DROP TABLE IF EXISTS widgets CASCADE;

CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  firstName VARCHAR(150) NOT NULL,
  lastName VARCHAR(150) NOT NULL,
  address VARCHAR(255) NOT NULL,
  phone VARCHAR(15) NOT NULL,
  email VARCHAR(100) NOT NULL,
  password VARCHAR(100) NOT NULL,
  employee_since TIMESTAMP NOT NULL DEFAULT Now()
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  firstName VARCHAR(150) NOT NULL,
  lastName VARCHAR(150) NOT NULL,
  address VARCHAR(255) NULL,
  phone VARCHAR(15) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(100) NOT NULL,
  user_since TIMESTAMP NOT NULL DEFAULT Now(),
  is_employee BOOLEAN
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(100) UNIQUE NOT NULL,
  description TEXT,
  is_active BOOLEAN DEFAULT true
);

CREATE TABLE foods (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  image_location VARCHAR(255) NOT NULL,
  price INTEGER NOT NULL DEFAULT 0,
  category_id INTEGER REFERENCES categories(id) ON DELETE CASCADE,
  preparation_time INTEGER NOT NULL,
  is_active BOOLEAN DEFAULT true
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  amount INTEGER NOT NULL,
  when_ordered TIMESTAMP NOT NULL DEFAULT now(),
  when_completed TIMESTAMP,
  sms_lighthouseCyberCafe TIMESTAMP,
  sms_users TIMESTAMP,
  is_paid BOOLEAN DEFAULT false,
  payment_received TIMESTAMP,
  when_pickedUp TIMESTAMP,
  released_by INTEGER REFERENCES employees(id) ON DELETE CASCADE,
  special_instructions TEXT
);


-- order details stores the detailed food items the employee orders
-- no_of_serving – refers to the number of orders.
-- total_amount – total amount is equal to amount multiply by the number of serving.

CREATE TABLE order_details (
  id SERIAL PRIMARY KEY NOT NULL,
  order_id INTEGER NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
  food_id INTEGER NOT NULL REFERENCES foods(id) ON DELETE CASCADE,
  no_of_serving INTEGER NOT NULL,
  total_amount FLOAT NOT NULL, -- no_of_serving * foods.price of the foods table per foods.id
  prepared_by INTEGER REFERENCES employees(id) ON DELETE CASCADE
);

CREATE TABLE widgets (
  id SERIAL PRIMARY KEY NOT NULL,
  employee_id INTEGER REFERENCES employees(id),
  name VARCHAR(255) NOT NULL
);
