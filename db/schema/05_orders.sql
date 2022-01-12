DROP TABLE IF EXISTS orders CASCADE;

CREATE TABLE orders (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  amount INTEGER NOT NULL,
  when_ordered TIMESTAMP NOT NULL DEFAULT now(),
  when_completed TIMESTAMP,
  sms_customer BOOLEAN DEFAULT false,
  is_paid BOOLEAN DEFAULT false,
  when_pickedUp TIMESTAMP,
  special_instructions TEXT
);

