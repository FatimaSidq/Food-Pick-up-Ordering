-- Drop and recreate Widgets table
DROP TABLE IF EXISTS widgets CASCADE;
CREATE TABLE widgets (
  id SERIAL PRIMARY KEY NOT NULL,
  employee_id INTEGER REFERENCES employees(id),
  name VARCHAR(255) NOT NULL
);
