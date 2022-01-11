

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
  is_customer BOOLEAN NOT NULL,    -- optional
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
  price INTEGER  NOT NULL DEFAULT 0,
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
INSERT INTO users (name, phone, email, password, is_customer)
VALUES ('labber', '123-456-7890','l@l.com', 'labber', false),
('Fatima', '519-123-4567','f@f.com', '123', true),
('Osman', '213-123-7890','o@o.com','123', true),
('Stellaris', '416-1111-8888','s@m.com','123', true);

INSERT INTO categories (name, description, is_active)
VALUES
('wraps-sandwiches', 'Hot and cold sandwiches and wraps', true),
('salads', 'For healthier option', true),
('pastries-desserts', 'Treats you will love to indulge', true),
('soups', 'Comfort yourself with hot soups made with fresh ingredients', true),
('beverages', 'Hot and cold beverages for everyones delight', true);


INSERT INTO foods (name, description, url_image, price, category_id, preparation_time, is_active)
VALUES
('Veggie Wrap', 'A colourful Veggie Wrap packed with fresh organic veggies of your choice wrapped in lettuce.', 'https://33mdrtv3gz5308bn82jcilk1-wpengine.netdna-ssl.com/wp-content/uploads/2018/07/goddess-wrap-768x768.jpg', 8, 1, 10, true),
('Vegan breakfast burritos','Kidney beans, Sweet potatoes, avocados and beets wrapped in a tortilla','https://cdn2.veganosity.com/wp-content/uploads/2014/06/2014-06-21-001-2014-06-21-015.jpg', 8, 1, 10, true);

-- salad
INSERT INTO foods (name, description, url_image, price, category_id, preparation_time, is_active)
VALUES
('Mixed Veg Salad','Cold salad of mixed raw veggies in marinate.','http://www.blimpygirl.com/bgmain/wp-content/uploads/2013/07/IMG_4467.jpg', 8, 2, 15, true);

-- pastries-desserts
INSERT INTO foods (name, description, url_image, price, category_id, preparation_time, is_active)
VALUES
('Buttery French Croissants','Light fluffy French Croissants baked fresh every few hours.','https://lh3.googleusercontent.com/proxy/jHEAqqUv0Vd0M_Elb1emTD4pKcVfH2UTNdV2lFxMtHDBqFFoDRoVAow_v5BKsl-uqQLq0Nmnli0fiyUClqprpN7MtXzOzr35aNMzYClP_O07td1XbtLNuG-vy2U6HmBLcDvz=w1200-h630-p-k-no-nu', 3, 3, 30, true),
('Banana Blueberry Muffins','Light fluffy French Croissants baked fresh every few hours.','https://theprettybee.com/wp-content/uploads/2014/06/Moist-and-delicious-blueberry-muffins-made-with-almond-meal-and-spelt-flour.-.jpg', 2, 3, 30, true),
('Carrot Muffins','Toddlers love these little muffins. These are definitely savoury muffins, but because cooked carrot is quite sweet tasting, and the added ingredient of orange juice is sweet, they are sweeter than you would imagine.','https://toddlerandme.co.uk/wp-content/uploads/2015/10/Carrot-Muffins-11.jpg', 1, 3, 30, true),
('Decadent Chocolate Chunk Vegan Cookies',' Have chewy, chocolaty, chunky cookies anytime you want','https://www.fodmapeveryday.com/wp-content/uploads/2019/12/vertical-image-of-low-FODMAP-vegan-chocolate-chunks-cookies-one-of-them-sprinkled-with-salt.jpg', 2, 3, 30, true);


-- beverage
INSERT INTO foods (name, description, url_image, price, category_id, preparation_time, is_active)
VALUES

('Coffee','Enjoy one of our light, medium, dark, decaffeinated, or flavored brews of the day, brewed from only the top 1% of Arabica beans in the world.','https://brewminate.com/wp-content/uploads/2016/06/CoffeeCan01.jpg', 2, 5, 5, true),
('Jasmine Pearls Green Tea','Aromatic organic jasmine blossoms are used for scenting the most tender organic green tea leaves and buds then hand-rolled into small pearls. Exquisite in flavor and aroma, and reputed to increase circulation, ease tension and reduce cholesterol.','https://pngimg.com/uploads/tea/tea_PNG16893.png', 2, 5, 3, true),
('Bubble Tea','A creamy, sweet, bubbly delight! Full of those chewy, satisfying, delightful little mouthfuls with plenty of sugar and either milk or coconut milk.','https://guestlist.net/uploads/articles/9/504_medium.jpg', 6, 5, 7, true);
