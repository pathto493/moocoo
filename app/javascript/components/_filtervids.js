const filterVids = () => {
  const btn1 = document.querySelectorAll(".first");
  const btn2 = document.querySelectorAll(".second");
  const  eye = document.querySelectorAll(".eye");

  btn1.addEventListener("click", (event) => {
    eye.style.display = "block";
  });
}


export { filterVids }
