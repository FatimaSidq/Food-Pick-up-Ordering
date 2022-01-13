-- foods table seeds here
-- foods table seeds - wraps and burritos
INSERT INTO foods (name, description, image_location, price, category_id, preparation_time, is_active)
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

-- foods table seeds - salad
INSERT INTO foods (name, description, image_location, price, category_id, preparation_time, is_active)
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

-- foods table seeds - pastries-desserts
INSERT INTO foods (name, description, image_location, price, category_id, preparation_time, is_active)
VALUES
('Buttery French Croissants','Light fluffy French Croissants baked fresh every few hours.','https://lh3.googleusercontent.com/proxy/jHEAqqUv0Vd0M_Elb1emTD4pKcVfH2UTNdV2lFxMtHDBqFFoDRoVAow_v5BKsl-uqQLq0Nmnli0fiyUClqprpN7MtXzOzr35aNMzYClP_O07td1XbtLNuG-vy2U6HmBLcDvz=w1200-h630-p-k-no-nu', 3, 3, 30, true),
('Vegan Blueberry-licious Muffins','100% Vegan, created with premium ingredients and void of artificial fillers. Perfect for the health-minded dessert lover, allows you to feel at ease eating them daily with a cup of coffee and friends, or casually munching away on these tasty treats with your family.','https://milkadamia.com/wp-content/uploads/2019/09/shutterstock_747182440.jpg', 2, 3, 30, true),
('Carrot Heart Muffins','Toddlers love these little muffins. These are definitely savoury muffins, but because cooked carrot is quite sweet tasting, and the added ingredient of orange juice is sweet, they are sweeter than you would imagine.','https://toddlerandme.co.uk/wp-content/uploads/2015/10/Carrot-Muffins-11.jpg', 1, 3, 30, true),
('Decadent Chocolate Chunk Vegan Cookies',' Have chewy, chocolaty, chunky cookies anytime you want','https://www.fodmapeveryday.com/wp-content/uploads/2019/12/vertical-image-of-low-FODMAP-vegan-chocolate-chunks-cookies-one-of-them-sprinkled-with-salt.jpg', 2, 3, 30, true);

-- foods table seeds - soups
INSERT INTO foods (name, description, image_location, price, category_id, preparation_time, is_active)
VALUES
('Creamy Vegan Minestrone Soup','A delicious creamy twist on the classic soup that is full of fresh vegetables, is a hearty meal that is ready in about 30 minutes, perfect for busy weeknights!','https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.PAn1VKdoW3_dYnX1t6to6wHaE8%26pid%3DApi&f=1', 10, 4, 30, true),


-- foods table seeds - beverage
INSERT INTO foods (name, description, image_location, price, category_id, preparation_time, is_active)
VALUES

('Coffee','Enjoy one of our light, medium, dark, decaffeinated, or flavored brews of the day, brewed from only the top 1% of Arabica beans in the world.','https://brewminate.com/wp-content/uploads/2016/06/CoffeeCan01.jpg', 2, 5, 5, true),
('Jasmine Pearls Green Tea','Aromatic organic jasmine blossoms are used for scenting the most tender organic green tea leaves and buds then hand-rolled into small pearls. Exquisite in flavor and aroma, and reputed to increase circulation, ease tension and reduce cholesterol.','https://pngimg.com/uploads/tea/tea_PNG16893.png', 2, 5, 3, true),
('Bubble Tea','A creamy, sweet, bubbly delight! Full of those chewy, satisfying, delightful little mouthfuls with plenty of cane sugar and either oat milk or coconut milk.','https://guestlist.net/uploads/articles/9/504_medium.jpg', 6, 5, 7, true);

