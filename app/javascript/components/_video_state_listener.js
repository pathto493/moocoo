
const initAddEventListenerToVideo = () => {
  var myTime=setInterval(function () {myTimer2()}, 1000);

  const annotations = document.querySelectorAll(".annotations .annotation");
  let annotationsArray = [];

  annotations.forEach((annotation, index) => {
    let annotationHash = {
      id: index,
      annotationElement : annotation,
      timeStart: annotation.dataset.timeStart,
      timeEnd: annotation.dataset.timeEnd,
      xCoordinate: annotation.dataset.xCoordinate,
      yCoordinate: annotation.dataset.yCoordinate
    };
    annotationsArray.push(annotationHash);
    annotation.style.top = `${Math.floor(annotationHash.xCoordinate*100)}%`;
    annotation.style.left = `${Math.floor(annotationHash.yCoordinate*100)}%`;
  });

  function myTimer2() {
    console.log("Time is ticking");
    let videoCurrentTime = player.getCurrentTime();
    document.getElementById("videoNow").innerHTML =  Math.round(videoCurrentTime);
    if (videoCurrentTime >= 150 && videoCurrentTime <= 155) {
      document.getElementById("popUp").style.display = "block";
    } else {
      document.getElementById("popUp").style.display = "none";
    }
    annotationsArray.forEach((aHash)=> {
      if (videoCurrentTime >= aHash.timeStart && videoCurrentTime <= aHash.timeEnd) {
        aHash.annotationElement.querySelector(".annotation-button").style.display = "inline";
      } else {
        aHash.annotationElement.querySelector(".annotation-button").style.display = "none";
      }
    })
  }

  const clickAnnotationCircle = (e) => {
    e.preventDefault();
    e.currentTarget.parentElement.querySelector("div").classList.toggle("annotation-product-block");
  }

  annotations.forEach((annotation) => {
    annotation.querySelector(".annotation-button").addEventListener('click', clickAnnotationCircle);
  })

  const clickAddToCart = (e) => {
    e.preventDefault();
    const productId = parseInt(e.currentTarget.dataset.productId, 10);
    // console.log(e.currentTarget.parentElement.parentElement);
    // fetch url!!
    const crsfToken = document.querySelector("[name='csrf-token']").content;

    fetch("/orders", {
      method: "POST",
      headers: {
        "X-CSRF-Token": crsfToken,
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        product: {
          product_id: productId,
          quantity: 1
          }
        })
      })
      .then(response => response.json())
      .then((data) => {
        console.log(data); // Look at local_names.default
    });
    alert("Successfully added to cart!");
  };

  const annotationCarts = document.querySelectorAll(".annotations .annotation-add-to-cart")
  annotationCarts.forEach((annotationCart) => {
    annotationCart.addEventListener('click', clickAddToCart)
  })
}

export { initAddEventListenerToVideo };
