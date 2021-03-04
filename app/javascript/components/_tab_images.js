const initTabImageOnClick = () => {
  // Get the expanded image

  // Use the same src in the expanded image as the image being clicked on from the grid
  let expandImg = document.querySelector("#expanded-img");
  console.log(expandImg);
  // Get the image text
  let imgs = document.querySelectorAll(".tab-images-col img");
  console.log(imgs);

  const tabImageOnClick = (e) => {
    let imgPath = `${e.currentTarget.src}`;
    console.log("Clicked!");
    expandImg.style.backgroundImage = `url(${imgPath})`;
  }

  imgs.forEach((img) => {
    img.addEventListener('click', tabImageOnClick);
  })
}

export { initTabImageOnClick };
