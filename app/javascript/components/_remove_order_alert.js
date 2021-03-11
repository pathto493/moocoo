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
        <a href="/products" class="btn btn-primary">Browse for more</a>
        `);
      totalPrice.remove();
      document.querySelector(".review-order-button").remove();
    }
  };

  const centsToPrice = (cents) => {
    let priceDollar = Math.floor(cents / 100);
    let priceCents = cents % 100;
    if (priceCents < 10) {
      priceCents = `0${priceCents}`
    }
    return `${priceDollar}.${priceCents}`
  };

  const refreshTotalPrice = (totalPrice) => {
    fetch("/cart.json")
      .then(respond => respond.json())
      .then((data) => {
        totalPrice.innerHTML = `TOTAL : SGD ${centsToPrice(data.total_price.cents)}`;
      })

  }

  const cartBody = document.querySelector(".cart-body");
  const elements = document.getElementsByClassName("remove-order-from-cart");
  const totalPrice = document.querySelector(".total-price h4");

  Array.from(elements).forEach((element) => {
    const orderId = parseInt(element.getAttribute("action").split("/").slice(-1), 10);
    element.addEventListener("ajax:success", (event) => {
      renderCart(orderId);
      addRemoveOrderAlert(cartBody);
      refreshTotalPrice(totalPrice);
    });
  });

  const minusQuantity = (e) => {
    const quantityDiv = e.currentTarget.parentElement.querySelector(".card-cart-quantity");
    let orderId = parseInt(e.currentTarget.dataset.orderId, 10);
    let orderTotalPrice = document.querySelector(`#order-${orderId} .card-cart-price`);
    let orderProductPrice = parseInt(e.currentTarget.dataset.productPrice, 10);
    fetch('/cart.json')
    .then(respond => respond.json())
    .then(data => {
      let order = data.orders.find(el=>el.id === orderId);
      quantityDiv.innerText = `Quantity : ${order.quantity}`;
      orderTotalPrice.innerText = `$${centsToPrice(order.quantity * orderProductPrice)}`;
    });
  }

  const addQuantity = (e) => {
    const quantityDiv = e.currentTarget.parentElement.querySelector(".card-cart-quantity");
    let orderId = parseInt(e.currentTarget.dataset.orderId, 10);
    let orderTotalPrice = document.querySelector(`#order-${orderId} .card-cart-price`);
    let orderProductPrice = parseInt(e.currentTarget.dataset.productPrice, 10);
    fetch('/cart.json')
    .then(respond => respond.json())
    .then(data => {
      let order = data.orders.find(el=>el.id === orderId);
      quantityDiv.innerText = `Quantity : ${order.quantity}`;
      orderTotalPrice.innerText = `$${centsToPrice(order.quantity * orderProductPrice)}`;
    });
  }

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

  document.querySelectorAll(".minus-quantity").forEach((minusSign)=>{
    minusSign.addEventListener("ajax:success", (e) => {
      minusQuantity(e);
      refreshTotalPrice(totalPrice);
      addToCart();
    });
  })

  document.querySelectorAll(".add-quantity").forEach((addSign)=>{
    addSign.addEventListener("ajax:success", (e) => {
      addQuantity(e);
      refreshTotalPrice(totalPrice);
      addToCart();
    });
  })
};

export { initRemoveOrderFromCartAlert };
