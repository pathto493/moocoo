const sortFunction = () => {
  const filter_btn = document.querySelectorAll(".btn-filter");
  const all = document.querySelectorAll(".all");
  const creator = document.querySelectorAll(".creator");
  const likes = document.querySelectorAll(".likes");
  const views = document.querySelectorAll(".views");
  const price = document.querySelectorAll(".price");
  const filter = document.querySelectorAll(".filter");

  filter_btn.forEach((btn) => {
    btn.addEventListener("click", (event) => {

      filter_btn.forEach((btn) => {
        btn.checked = false;
      })

      event.currentTarget.checked = true;



      const btnVal = btn.getAttribute("data-tabs");

      filter.forEach((item)=>{
        item.style.display = "none";
      })

      if(btnVal === "creator"){
        creator.forEach((creator1)=>{
          creator1.style.display = "block";
        })
      }
      else if(btnVal === "likes"){
        likes.forEach((like)=>{
          like.style.display = "block";
        })
      }
      else if(btnVal === "views"){
        views.forEach((view)=>{
          view.style.display = "block";
        })
      }
      else if(btnVal === "all"){
        all.forEach((item)=>{
          item.style.display = "block";
        })
      }
      else if(btnVal === "price"){
        price.forEach((price)=>{
          price.style.display = "block";
        })
      }
      else{
        filter.forEach((item)=>{
          item.style.display = "block";
        })
      }
    })
  })
};

export { sortFunction };
