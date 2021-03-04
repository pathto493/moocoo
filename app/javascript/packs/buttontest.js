const jumpbtn = document.querySelector(".jump-btn");
const video = document.querySelector(".main-video");

const playVid = () => {
  const newUrl = `${jumpbtn.dataset.url}?autoplay=1&start=${jumpbtn.dataset.point}`;
  video.setAttribute("src", newUrl);
};

const playAhead = () => {
  jumpbtn.addEventListener("click", playVid);

};

export { playAhead };
