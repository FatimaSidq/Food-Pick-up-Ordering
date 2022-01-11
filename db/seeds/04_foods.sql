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