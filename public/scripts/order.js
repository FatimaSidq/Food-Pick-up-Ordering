window.onload = () => {
    $("body").append(`<img src="assets/logo.jpg" alt="Lighthouse Cybercafe">
<h1>Name: ${user_name}<br>Your total order is $${amount}.<br>
You will receive an SMS text shortly at ${phone} for your order details.<br>
Thank you for your order.  Have a great day!</h1>`)
}