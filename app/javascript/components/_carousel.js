const carousel = () => {
  document.getElementById("myBtn").addEventListener("click", () =>  {
    alert("Hello!");
  });

  document.querySelector(".carousel-inner").addEventListener("swiped-left", () => {
    alert("Hello!");
  });

  document.querySelector(".carousel-inner").addEventListener('swiped-right', () => {
    alert("Hello!");
  });

  document.querySelector(".carousel-item").addEventListener('onclick', () => {

  });
}

export { carousel };
