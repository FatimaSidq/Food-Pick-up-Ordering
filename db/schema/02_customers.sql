DROP TABLE IF EXISTS customers CASCADE;

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
  -- name VARCHAR(255) NOT NULL,
  -- phone VARCHAR(20) NOT NULL
);
