DROP TABLE IF EXISTS orders CASCADE;

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
