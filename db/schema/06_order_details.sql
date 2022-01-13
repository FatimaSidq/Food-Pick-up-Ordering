-- order details stores the detailed employee orders
DROP TABLE IF EXISTS order_details CASCADE;

CREATE TABLE order_details (
  id SERIAL PRIMARY KEY NOT NULL,
  order_id INTEGER NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
  food_id INTEGER NOT NULL REFERENCES foods(id) ON DELETE CASCADE,
  no_of_serving INTEGER NOT NULL,
  total_amount FLOAT NOT NULL, -- no_of_serving * foods.price of the foods table per foods.id
  prepared_by INTEGER REFERENCES employees(id) ON DELETE CASCADE
);

