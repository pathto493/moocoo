const initVideoJump = () => {
  const jumpBtns = document.querySelectorAll('.jump-btn');
  const video = document.querySelector('.main-video');
  const playVid = (e) => {
    e.preventDefault();
    console.log("Clicked");
    console.log(e.currentTarget.dataset.url);
    const newUrl = `${e.currentTarget.dataset.url}?autoplay=1&start=${e.currentTarget.dataset.point}`;
    video.setAttribute("src", newUrl);
  };
  jumpBtns.forEach((jumpBtn)=> {
    jumpBtn.addEventListener("click", playVid);
  })
}

export { initVideoJump };
