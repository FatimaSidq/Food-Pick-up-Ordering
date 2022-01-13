window.onload = () => {
    if (cart) {
        for (let item of cart) {
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
        }
    })
}