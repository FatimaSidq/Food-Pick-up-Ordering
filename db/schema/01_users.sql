-- Drop and recreate Users table
DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  firstName VARCHAR(150) NOT NULL,
  lastName VARCHAR(150) NOT NULL,
  phone VARCHAR(15) NOT NULL,
  email VARCHAR(100) NOT NULL,
  password VARCHAR(100) NOT NULL,
  is_employee BOOLEAN NOT NULL DEFAULT false,
  user_since TIMESTAMP NOT NULL DEFAULT Now()
);

