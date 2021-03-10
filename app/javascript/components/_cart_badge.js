const addToCart = () => {

  const badge = document.querySelector(".cart-badge");
  const quantity = badge.innerText

    fetch('/cart')
    .then(response => response.json())

    .then(data => (data))
    console.log(data);
}

export { addToCart };
