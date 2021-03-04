const btn1 = document.querySelector(".button1");
const video = document.querySelector(".main-video");

const onClick = () => {
  btn1.addEventListener("click", (event) => {
    btn1.innerText = 'Can I disappear?';
  });
};

export { onClick };
