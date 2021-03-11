const addToCart = () => {

  const badge = document.querySelector(".cart-badge");
  let cartQty = 0;

  fetch("/cart.json")
    .then(response => response.json())
    .then((data) => {
      const orders = data.orders;
      var i;
      for (i=0; i < orders.length; i++) {
        cartQty += orders[i].quantity;
        badge.innerText = cartQty;
      }
    })
  };

export { addToCart };
