const initRemoveOrderFromCartAlert = () => {

  const removeRemoveOrderAlert = () => {
    if (document.getElementById("alertcart")) {
      let myobj = document.getElementById("alertcart");
      myobj.remove();
    }
  };

  const addRemoveOrderAlert = (cartBody) => {
    removeRemoveOrderAlert();
    cartBody.insertAdjacentHTML("beforeend", `<div id="alertcart" class="alert alert-warning alert-dismissible fade show m-1" role="alert">
          Successfully remove item from cart
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>`);
  }

  const renderCart = (orderId) => {
    if (document.querySelector(`#order-${orderId}`)) {
      document.querySelector(`#order-${orderId}`).remove();
    }
    if (!document.querySelector(".card-cart")) {
      cartBody.insertAdjacentHTML("beforebegin", `
        <h2 class="py-3">Oops! Your cart is empty!</h2>
        `);
      totalPrice.remove();
      document.querySelector(".review-order-button").remove();
    }
  };

  const centsToPrice = (cents) => {
    let priceDollar = Math.floor(cents / 100);
    let priceCents = cents % 100;
    return `${priceDollar}.${priceCents}`
  };

  const refreshTotalPrice = (totalPrice) => {
    fetch("/cart.json")
      .then(respond => respond.json())
      .then((data) => {
        totalPrice.innerHTML = `TOTAL PRICE : SGD ${centsToPrice(data.cents)}`;
      })

  }

  const cartBody = document.querySelector(".cart-body");
  const elements = document.getElementsByClassName("remove-order-from-cart");
  const totalPrice = document.querySelector(".total-price h3");

  Array.from(elements).forEach((element) => {
    const orderId = parseInt(element.getAttribute("action").split("/").slice(-1), 10);
    element.addEventListener("ajax:success", (event) => {
      renderCart(orderId);
      addRemoveOrderAlert(cartBody);
      refreshTotalPrice(totalPrice);
    });
  });
};

export { initRemoveOrderFromCartAlert };
