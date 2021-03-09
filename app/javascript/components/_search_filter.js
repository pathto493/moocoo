
const filterSearch = () => {
  const container = document.querySelector(".search-container");
  const button = document.querySelector(".search-button");

  container.innerHTML = "";
  button.addEventListener("click", (event) => {
    console.log(event);
  });
}


export { filterSearch };
