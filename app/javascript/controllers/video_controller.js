import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'filterresult', 'viewsresult', 'likesresult', 'creatorresults' ]


  show(e) {
    const filterType = e.currentTarget.getAttribute('name');

    fetch(`/search.json?q=${filterType}`)
      .then(response => response.json() )
      .then(data => {
        console.log(data);
        this.checkFilter(data);
    })


    // if(filterType === 'eyes'){
    //   fetch('/search.json?q=eyes')
    //   .then(response => response.json() )
    //   .then(data => {
    //     console.log(data);
    //     this.checkFilter(data);
    // })

    // }
    // else if(filterType === 'foundation'){
    //   fetch('/search.json?q=foundation')
    //   .then(response => response.json() )
    //   .then(data => this.checkFilter(data));
    // }
  }

  checkFilter(data) {
    this.filterresultTarget.innerHTML = '';
    this.creatorresultsTarget.innerHTML = '';
    this.likesresultTarget.innerHTML = '';
    this.viewsresultTarget.innerHTML = '';
    this.renderSearchedVideos(data.video_results, "filter");

    const filter_btn = document.querySelectorAll(".btn-filter");
    filter_btn.forEach((btn) => {
      btn.addEventListener("click", (event) => {

        filter_btn.forEach((btn) => {
          btn.checked = false;
        })

        event.currentTarget.checked = true;

        const btnVal = btn.getAttribute("data-tabs");

        if(btnVal === "creator"){
          const arrData = data.video_results;

          const sortFunc = (a, b) => {
            if (a.creator < b.creator) {
              return -1;
            }
            if (a.creator > b.creator) {
              return 1;
            }
            return 0;
          };

          const sorted = arrData.sort(sortFunc);
          this.creatorresultsTarget.innerHTML = '';
          this.renderSearchedVideos(sorted, "creator");
        } else if(btnVal === "likes"){

         const arrData = data.video_results;

         const sortFunc = (a, b) => {
          return b.likes - a.likes;
        };

        const sorted = arrData.sort(sortFunc);
        this.likesresultTarget.innerHTML = '';
        this.renderSearchedVideos(sorted, "likes");

      } else if(btnVal === "views"){
        const arrData = data.video_results;

        const sortFunc = (a, b) => {
          return b.views - a.views;
        };

        const sorted = arrData.sort(sortFunc);
        this.viewsresultTarget.innerHTML = '';
        this.renderSearchedVideos(sorted, "views");

      } else {
        const arrData = data.video_results;
        this.filterresultTarget.innerHTML = '';
        this.renderSearchedVideos(arrData, "filter");
      }
    })
    })
  }

  renderSearchedVideos(videos, value) {

    const template = document.querySelector('#card-template');

    videos.forEach((video) => {
      let newCardTemplate = template.content.cloneNode(true);
      // change the video url
      newCardTemplate.querySelector('iframe').src = video.video_url
      newCardTemplate.querySelector('a').href = `videos/${video.id}`
      newCardTemplate.querySelector('a').innerText = video.title
      newCardTemplate.querySelector('.creator').innerText = video.creator
      newCardTemplate.querySelector('.likes-count').innerText = video.likes
      newCardTemplate.querySelector('.views-count').innerText = video.views

      if (value === "creator") {
        this.creatorresultsTarget.appendChild(newCardTemplate);
      } else if (value === "likes") {
        this.likesresultTarget.appendChild(newCardTemplate);
      } else if (value === "views") {
        this.viewsresultTarget.appendChild(newCardTemplate);
      } else {
        this.filterresultTarget.appendChild(newCardTemplate);
      };

    })
  }
}
