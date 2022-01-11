DROP TABLE IF EXISTS users CASCADE;

DROP TABLE IF EXISTS customers CASCADE;

DROP TABLE IF EXISTS categories CASCADE;

DROP TABLE IF EXISTS foods CASCADE;

DROP TABLE IF EXISTS orders CASCADE;

DROP TABLE IF EXISTS order_details CASCADE;

DROP TABLE IF EXISTS orders CASCADE;

DROP TABLE IF EXISTS widgets CASCADE;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  phone VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  password VARCHAR(100) NOT NULL,
  is_customer BOOLEAN NOT NULL,
  -- optional
  user_since TIMESTAMP NOT NULL DEFAULT Now()
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  name VARCHAR(255) NOT NULL,
  phone VARCHAR(20) NOT NULL
);

DROP TABLE IF EXISTS categories CASCADE;

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
  url_image VARCHAR(255) NOT NULL,
  price INTEGER NOT NULL DEFAULT 0,
  category_id INTEGER REFERENCES categories(id) ON DELETE CASCADE,
  estimated_time TIME NOT NULL,
  is_active BOOLEAN DEFAULT true
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  amount INTEGER NOT NULL,
  when_ordered TIMESTAMP DEFAULT now(),
  when_completed TIMESTAMP DEFAULT now(),
  when_pickedUp TIMESTAMP DEFAULT now(),
  is_paid BOOLEAN DEFAULT false,
  is_picked_up BOOLEAN DEFAULT false,
  is_ready BOOLEAN DEFAULT false,
  special_instructions TEXT
);

CREATE TABLE order_details (
  id SERIAL PRIMARY KEY NOT NULL,
  order_id INTEGER NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
  food_id INTEGER NOT NULL REFERENCES foods(id) ON DELETE CASCADE,
  no_of_serving INTEGER NOT NULL,
  total_amount FLOAT NOT NULL
);

-- Drop and recreate Widgets table (Example)
CREATE TABLE widgets (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id),
  name VARCHAR(255) NOT NULL
);

-- Users table seeds here
INSERT INTO
  users (name, phone, email, password, is_customer)
VALUES
  (
    'labber',
    '123-456-7890',
    'l@l.com',
    'labber',
    false
  ),
  ('Fatima', '519-123-4567', 'f@f.com', '123', true),
  ('Osman', '213-123-7890', 'o@o.com', '123', true),
  (
    'Stellaris',
    '416-1111-8888',
    's@m.com',
    '123',
    true
  );

INSERT INTO
  categories (name, description, is_active)
VALUES
  (
    'Wraps and Sandwiches',
    'Hot and cold sandwiches and wraps',
    true
  ),
  ('Salads', 'For healthier option', true),
  (
    'Pastries and Desserts',
    'Treats that you will love to indulge',
    true
  ),
  (
    'Beverages',
    'Hot and cold beverages for everyone''s delight',
    true
  );

INSERT INTO
  foods (
    name,
    description,
    url_image,
    price,
    category_id,
    preparation_time,
    is_active
  )
VALUES
  (
    'Veggie Wrap',
    'A colourful Veggie Wrap packed with fresh organic veggies of your choice wrapped in lettuce.',
    'assets/menu/veggie_wraps.png',
    8,
    1,
    10,
    true
  ),
  (
    'Vegan breakfast burritos',
    'Kidney beans, Sweet potatoes, avocados and beets wrapped in a tortilla',
    'assets/menu/veggie_breakfast_burritos.png',
    8,
    1,
    10,
    true
  );

-- salad
INSERT INTO
  foods (
    name,
    description,
    url_image,
    price,
    category_id,
    preparation_time,
    is_active
  )
VALUES
  (
    'Mixed Veg Salad',
    'Corn, Cherry tomatoes, Chickpeas, Onions, Radishes, Coconut Bacon on a bed of Romaine lettuce topped with avocados',
    'assets/menu/mixed_veg_salad.png',
    8,
    2,
    10,
    true
  );

-- pastries-desserts
INSERT INTO
  foods (
    name,
    description,
    url_image,
    price,
    category_id,
    preparation_time,
    is_active
  )
VALUES
  (
    'Buttery French Croissants',
    'Light fluffy French Croissants baked fresh every few hours.',
    'assets/menu/buttery_french_croissants.png',
    3,
    3,
    30,
    true
  ),
  (
    'Blueberry Muffins',
    'Freshly picked blueberries baked into a delious soft muffin.',
    'assets/menu/blueberry_muffins.png',
    2,
    3,
    30,
    true
  ),
  (
    'Carrot Muffins',
    'Carrot Muffins with Sweet cheese cake filling',
    'assets/menu/carrot_muffins.png',
    1,
    3,
    30,
    true
  ),
  (
    'Chewy Chocolate Chunk Cookies',
    'Decadent Chocolate Chunk Vegan Cookies',
    'assets/menu/chewy_chocolate_chunk_cookies.png',
    2,
    3,
    30,
    true
  );

-- beverage
INSERT INTO
  foods (
    name,
    description,
    url_image,
    price,
    category_id,
    preparation_time,
    is_active
  )
VALUES
  (
    'Signature Brewed Coffee',
    'Enjoy one of our light, medium, dark, decaffeinated, or flavored brews of the day, brewed from only the top 1% of Arabica beans in the world.',
    'assets/menu/coffee.png',
    2,
    4,
    5,
    true
  ),
  (
    'Green Tea',
    '',
    'assets/menu/green_tea.png',
    2,
    4,
    3,
    true
  ),
  (
    'Bubble Tea',
    'A creamy, sweet, bubbly delight! Full of those chewy, satisfying, delightful little mouthfuls with plenty of sugar and either milk or coconut milk.',
    'https://guestlist.net/uploads/articles/9/504_medium.jpg',
    6,
    4,
    7,
    true
  );