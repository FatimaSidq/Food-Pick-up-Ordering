const updateSummary = () => {
  let items = {};
  for (let title of $(".title")) {
    if (Object.keys(items).includes(title.textContent)) {
      items[title.textContent] += 1;
    } else {
      items[title.textContent] = 1;
    }
  }
  $(".summary").html(``);
  for (let item of Object.keys(items)) {
    $(".summary").append(`<h3>${items[item]}x ${item}</h3>`);
  }
}

window.onload = () => {
  if (cart) {
      $(".sidebar").prepend("<h1>Summary</h1>")
      $(".sidebar").append(`
<div id="bottom">
  <a href="/order"><button type="submit" class="order-button">Checkout</button></a>
</div>`)
      let total = 0;
      for (let item of cart) {
          total += item.price;
          $("#items").append(`
<div class="item">
  <div class="image">
      <img src="${item.image_location}" alt="${item.name}">
  </div>
  <div class="info">
      <h3 class="title">${item.name}</h3>
      <p>${item.description}</p>
      <div class="footer">
          <p class="price">$${item.price}</p>
          <a class="remove" id="${item.id}">
              <p>Remove</p>
          </a>
      </div>
  </div>
</div>
          `)
      }
      updateSummary();
      $("#bottom").prepend(`<h3 id="total">Order Total: $${total}</h3>`)
  } else {
      $("#items").append('<h3>Your cart is empty.</h3>')
  }


  $(".remove").click(function () {
      let cart = getCookie("cart");
      if (cart.length === 1) {
          cart = cart.replace(`${this.id}`, "");
      } else if (cart.indexOf(this.id) === 0) {
          cart = cart.replace(`${this.id}+`, "");
      } else {
          cart = cart.replace(`+${this.id}`, "");
      }
      this.closest(".item").remove();
      if (cart) {
          document.cookie = `cart=${cart}`;
      } else {
          document.cookie = 'cart=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
          $(".sidebar").html("")
          $("#items").append('<h3>Your cart is empty.</h3>')
      }

      let total = 0;
      for (let price of $(".price")) {
          total += parseInt(price.textContent.replace("$", ""), 10);
      }
      updateSummary();
      $("#total").html(`Order Total: $${total}`)
  })
}