-- Drop and recreate Users table
DROP TABLE IF EXISTS users CASCADE;

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

