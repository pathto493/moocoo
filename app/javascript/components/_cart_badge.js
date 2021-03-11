const addToCart = () => {

  const badge = document.querySelector(".cart-badge");
  let cartQty = 0;

  fetch("/cart.json")
    .then(response => response.json())
    .then((data) => {
      var i;
      for (i=0; i < data.length; i++) {
        cartQty += data[i].quantity;
        badge.innerText = cartQty;
      }
    })
  };

export { addToCart };
