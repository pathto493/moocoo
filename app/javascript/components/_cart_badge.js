const addToCart = () => {

  const badge = document.querySelector(".cart-badge");
  let cartQty = 0;

  fetch("/cart.json")
    .then(response => response.json())
    .then((data) => {
      var i;
      for (i=0; i < data.orders.length; i++) {
        cartQty += data.orders[i].quantity;
        badge.innerText = cartQty;
      }
    })
  };

export { addToCart };
