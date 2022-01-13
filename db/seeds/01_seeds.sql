-- employees table seeds
INSERT INTO employees (firstName, lastName, address, phone, email, password)
VALUES ('labber', 'labber','Lighthouse Labs','123-456-7890','l@l.com', 'labber'),
('Fatima', 'Siddique','Lighthouse Labs','519-123-4567','f@f.com', '123'),
('Osman', 'Shakib', 'Lighthouse Labs','213-123-7890','o@o.com','123'),
('Stellaris', 'Cano', 'Lighthouse Labs','416-108-8888','s@m.com','123');

-- users table seeds
INSERT INTO users (firstName, lastName, address, phone, email, password, is_employee)
VALUES
('labber', 'labber','Lighthouse Labs','123-456-7890','l@l.com', 'labber', true),
('Fatima', 'Siddique','Lighthouse Labs','519-123-4567','f@f.com', '123', true),
('Osman', 'Shakib', 'Lighthouse Labs','213-123-7890','o@o.com','123', true),
('Stellaris', 'Cano', 'Lighthouse Labs','416-108-8888','s@m.com','123', true),
('Test', 'User', '','111-222-3333','t@t.com','123', false);

-- categories table seeds
INSERT INTO categories (name, description, is_active)
VALUES
('wraps-sandwiches', 'Hot and cold sandwiches and wraps', true),
('salads', 'For healthier option', true),
('pastries-desserts', 'Treats you will love to indulge', true),
('soups', 'Comfort yourself with hot soups made with fresh, organic ingredients', true),
('appetizers', 'Guarantees to stimulate your appetite', true),
('beverages', 'Hot and cold beverages for everyones delight', true);



-- foods table seeds
-- foods table seeds - wraps and burritos
INSERT INTO foods (name, description, image_location, price, category_id, preparation_time, is_active)
VALUES
  (
    'Veggie Wrap',
    'A colourful Veggie Wrap packed with fresh organic veggies of your choice wrapped in lettuce.',
    'assets/menu/wraps-rawVeggies.png',
    8,
    1,
    10,
    true
  ),
  (
    'Vegan Breakfast Burritos',
    'Kidney beans, Sweet potatoes, avocados and beets wrapped in a tortilla',
    'assets/menu/burritos-veggie_breakfast.png',
    6,
    1,
    10,
    true
  );

-- foods table seeds - salad
INSERT INTO foods (name, description, image_location, price, category_id, preparation_time, is_active)
VALUES
  ( 'Raw Mixed Veggie Platter',
    'Corn, Cherry tomatoes, Chickpeas, Radishes, Coconut Bacon on a bed of Romaine lettuce topped with avocados',
    'assets/menu/salad-raw_mixed_veg.png',
    8,
    2,
    15,
    true
  ),
   ( 'Veggie Salad in Marinate',
    'Brocoli, cucumber, tomatoes, sweet corn, zuchini, walnuts and celery',
    'assets/menu/salad-mixedVeggie.jpg',
    6,
    2,
    15,
    true
  );


-- foods table seeds - pastries-desserts
INSERT INTO foods (name, description, image_location, price, category_id, preparation_time, is_active)
VALUES
('Buttery French Croissants','Light fluffy French Croissants baked fresh every few hours served with strawberries and blueberries.','assets/menu/croissants_buttery_french_blueberry-strawberry.jpeg', 3, 3, 30, true),
('Vegan Blueberry-licious Muffins','100% Vegan, created with premium ingredients and void of artificial fillers. Perfect for the health-minded dessert lover, allows you to feel at ease eating them daily with a cup of coffee and friends, or casually munching away on these tasty treats with your family.','assets/menu/muffins-veganBlueberry-licious.jpeg', 2, 3, 30, true),
('Carrot Heart Muffins','Toddlers love these little muffins. These are definitely savoury muffins, but because cooked carrot is quite sweet tasting, and the added ingredient of orange juice is sweet, they are sweeter than you would imagine.','assets/menu/muffins-toddlerHearts_Carrot.jpeg', 1, 3, 30, true),
('Decadent Chocolate Chunk Vegan Cookies',' Have chewy, chocolaty, chunky cookies anytime you want','assets/menu/cookies-chewy_chocolate_chunk.png', 2, 3, 30, true);

-- foods table seeds - soups
INSERT INTO foods (name, description, image_location, price, category_id, preparation_time, is_active)
VALUES
('Creamy Vegan Minestrone Soup','A delicious creamy twist on the classic soup that is full of fresh vegetables, is a hearty meal that is ready in about 30 minutes, perfect for busy weeknights!','assets/menu/soup-creamyVeganMinestrone.jpeg', 8, 4, 25, true);

-- foods table seeds - appetizers
INSERT INTO foods (name, description, image_location, price, category_id, preparation_time, is_active)
VALUES
  ('Vegan Quinoa Sushi',
    'Vegan quinoa sushi is seriously going to be your new favorite go-to healthy meal! Quinoa has more nutritional benefits than right as it is filled with fiber, all of the essential amino acids, magnesium, calcium, iron and potassium.  Can be rolled with three (3) veggies of your choice: cucumber, avocado, purple cabbage, shredded carrots, spinach, peppers and mango.',
    'assets/menu/appetizer-quinoa-vegan-sushi.jpeg',
    10,
    5,
    25,
    true
  ),
  ( 'Rainbow Veggie Platter',
    'This Rainbow Veggie Platter is the ultimate vegetable appetizer! It is healthy, vegan, aesthetically pleasing, and so delicious.',
    'assets/menu/appetizer-rainbowVeggiePlatter.webp',
    12,
    5,
    25,
    true
  );

-- foods table seeds - beverage - HOT
INSERT INTO foods (name, description, image_location, price, category_id, preparation_time, is_active)
VALUES

('Coffee','Enjoy one of our light, medium, dark, decaffeinated, or flavored brews of the day, brewed from only the top 1% of Arabica beans in the world.','assets/menu/coffee.png', 2, 6, 5, true),
('Jasmine Pearls Green Tea','Aromatic organic jasmine blossoms are used for scenting the most tender organic green tea leaves and buds then hand-rolled into small pearls. Exquisite in flavor and aroma, and reputed to increase circulation, ease tension and reduce cholesterol.','assets/menu/hotTea-greenTea-lemon-jasminePearls.png', 2, 6, 3, true);

-- foods table seeds - beverage - COLD
INSERT INTO foods (name, description, image_location, price, category_id, preparation_time, is_active)
VALUES
('Mocha Chai Bubble Tea','A creamy, sweet, bubbly delight! Full of those chewy, satisfying, delightful little mouthfuls with plenty of cane sugar and deliciously decadent mixture of cacao, either oat milk or coconut milk and espresso. Typically served warm as a “mocha latte,” this delicious blend of rich, sweet chocolate and strong coffee is enough to wake anyone up.
.','assets/menu/bubbleTea_mochaChai.jpeg', 6, 6, 7, true),
('Green Bubble Tea','This delicious drink brings all the health benefits of Japanese-style green tea with the texture of bubble tea. Matcha is yet another Asian flavor that has climbed its way up in popularity around the world. It’s a powerful and herbal tea flavor that will please even the most distinguished palate.','assets/menu/bubbleTea-greanTea.png', 6, 6, 7, true);
