const initTabImageOnClick = () => {
  // Get the expanded image

  // Use the same src in the expanded image as the image being clicked on from the grid
  let expandImg = document.querySelector("#expanded-img");
  // Get the image text
  let imgs = document.querySelectorAll(".tab-images-col img");

  const tabImageOnClick = (e) => {
    let imgPath = `${e.currentTarget.src}`;
    expandImg.style.backgroundImage = `url(${imgPath})`;
  }

  imgs.forEach((img) => {
    img.addEventListener('click', tabImageOnClick);
  })
}

export { initTabImageOnClick };
