const scrollNav = () => {
  let prevScrollpos = window.pageYOffset;
  window.onscroll = () => {
    const currentScrollPos = window.pageYOffset;
    if (prevScrollpos > currentScrollPos) {
      document.querySelector(".navbar").style.top = "0";
    } else {
      document.querySelector(".navbar").style.top = "-100px";
    }
    prevScrollpos = currentScrollPos;
  }
};

export { scrollNav };
