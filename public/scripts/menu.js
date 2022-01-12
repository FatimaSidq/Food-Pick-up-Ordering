const menu = $("#menu");

for (let category of Object.values(categories)) {
  menu.append(`<h1 class="category-name">${category.name}<br><span class="category-description">${category.description}</span></h1>`)
  for (let food of category.foods) {
    menu.append(`
    <div class="item">
      <div class="image">
        <div class="hover">  
          <h2>$${food.price}</h2>
          ${id ? `<button id="${food.id}">Add to cart</button>` : ""}
        </div>
        <img src="${food.url_image}" alt="${food.name}">
      </div>
      <div class="info">
        <h3>${food.name}</h3>
        <p class="description">${food.description}</p>
      </div>
    </div>`)
    ;
  }
}
