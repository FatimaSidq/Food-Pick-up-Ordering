-- Drop and recreate Users table (Example)
CREATE DATABASE template1;
\c template1;

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  phone VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  password VARCHAR(100) NOT NULL,
  is_customer BOOLEAN NOT NULL,    -- optional
  user_since TIMESTAMP NOT NULL DEFAULT Now()
);
