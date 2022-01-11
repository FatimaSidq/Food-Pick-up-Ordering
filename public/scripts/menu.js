const addMenuItem = (photo, title, description, price) => {
  $("#menu").append(`
<div class="item">
  <div class="image">
    <div class="hover">  
      <h2>${price}</h2>
      ${id ? "<button>Add to cart</button>" : ""}
    </div>
    <img src="${photo}" alt="${title}">
  </div>
  <div class="info">
    <h3>${title}</h5>
    <p class="description">${description}</p>
  </div>
</div>`);
};

window.onload = function () {
  addMenuItem(
    "assets/menu/buttery_french_croissants.png",
    "Buttery French Croissants",
    "Light fluffy French Croissants baked fresh every few hours",
    "$3"
  );
  addMenuItem(
    "assets/menu/blueberry_muffins.png",
    "Blueberry Muffins",
    "Freshly picked blueberries baked into a delious soft muffin",
    "$2"
  );
  addMenuItem(
    "assets/menu/chewy_chocolate_chunk_cookies.png",
    "Chewy Chocolate Chunk Cookies ",
    "Decadent Chocolate Chunk Vegan Cookies",
    "$2"
  );
  addMenuItem(
    "assets/menu/carrot_muffins.png",
    "Carrot Muffins",
    "Carrot Muffins with Sweet cheese cake filling",
    "$2"
  );
  addMenuItem(
    "assets/menu/coffee.png",
    "Signature Brewed Coffee",
    "Freshly brewed Arabica bean coffee",
    "$2"
  );
  addMenuItem("assets/menu/green_tea.png", "Green Tea", "", "$2");
  addMenuItem(
    "assets/menu/mixed_veg_salad.png",
    "Mixed Veg Salad",
    "Corn, Cherry tomatoes, Chickpeas, Onions, Radishes, Coconut Bacon on a bed of Romaine lettuce topped with avocados",
    "$10"
  );
  addMenuItem(
    "assets/menu/veggie_breakfast_burritos.png",
    "Veggie Breakfast Burritos",
    "Kidney beans, Sweet potatoes, avocados and beets wrapped in a tortilla",
    "$12"
  );
  addMenuItem(
    "assets/menu/veggie_wraps.png",
    "Veggie Wraps",
    "A colourful Veggie Wrap packed with Veggies of your choice wrapped in lettuce",
    "$8"
  );
};
