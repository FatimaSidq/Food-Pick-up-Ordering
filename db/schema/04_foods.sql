DROP TABLE IF EXISTS foods CASCADE;

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

