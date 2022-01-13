window.onload = () => {
    if (cart) {
        $(".sidebar").append(`
<h1>Order Details</h1>
<form class="user-info" action="/order" method="POST">
    <label for="first">First Name <span class="required-asterisk">*</span></label>
    <input type="text" id="first" name="first" aria-required>
    <label for="last">Last Name <span class="required-asterisk">*</span></label>
    <input type="text" id="last" name="last" aria-required>
    <label for="phone">Phone Number <span class="required-asterisk">*</span></label>
    <input type="tel" id="phone" name="phone" aria-required>
    <div class="bottom">
        <button type="submit" class="checkout">Checkout</button>
    </div>
</form>`)
        let total = 0;
        for (let item of cart) {
            total += item.price;
            $("#items").append(`
<div class="item">
    <div class="image">
        <img src="${item.url_image}" alt="${item.name}">
    </div>
    <div class="info">
        <h3>${item.name}</h3>
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
        $(".bottom").prepend(`<h3 id="total">Order Total: $${total}</h3>`)
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
        $("#total").html(`Order Total: $${total}`)
    })
}