
const initAddEventListenerToVideo = () => {
  var myTime=setInterval(function () {myTimer2()}, 1000);

  const annotations = document.querySelectorAll(".annotations .annotation");
  let annotationsArray = [];

  annotations.forEach((annotation, index) => {
    let annotationHash = {
      id: index,
      annotationElement : annotation,
      timeStart: annotation.dataset.timeStart,
      timeEnd: annotation.dataset.timeEnd,
      xCoordinate: annotation.dataset.xCoordinate,
      yCoordinate: annotation.dataset.yCoordinate
    };
    annotationsArray.push(annotationHash);
    annotation.style.top = `${Math.floor(annotationHash.xCoordinate*100)}%`;
    annotation.style.left = `${Math.floor(annotationHash.yCoordinate*100)}%`;
  });

  function myTimer2() {
    console.log("Time is ticking");
    let videoCurrentTime = player.getCurrentTime();
    document.getElementById("videoNow").innerHTML =  Math.round(videoCurrentTime);
    if (videoCurrentTime >= 150 && videoCurrentTime <= 155) {
      document.getElementById("popUp").style.display = "block";
    } else {
      document.getElementById("popUp").style.display = "none";
    }
    annotationsArray.forEach((aHash)=> {
      if (videoCurrentTime >= aHash.timeStart && videoCurrentTime <= aHash.timeEnd) {
        aHash.annotationElement.style.display = "block";
      } else {
        aHash.annotationElement.style.display = "none";
      }
    })
  }

  const clickAnnotation = (e) => {
    e.preventDefault();
    console.log(e.currentTarget);
    console.log(e.currentTarget.querySelector("div"));
    e.currentTarget.querySelector("div").classList.toggle("annotation-product-block")
  }

  annotations.forEach((annotation) => {
    annotation.addEventListener('click', clickAnnotation);
  })

  const clickAnnotation = (e) => {

  }

  // 2. This code loads the IFrame Player API code asynchronously.
      // var tag = document.createElement('script');
      // console.log("test");

      // tag.src = "https://www.youtube.com/iframe_api";
      // var firstScriptTag = document.getElementsByTagName('script')[0];
      // firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

      // 3. This function creates an <iframe> (and YouTube player)
      //    after the API code downloads.
      // var player;
      // function onYouTubeIframeAPIReady() {
      //   console.log("test2")
      //   player = new YT.Player('player', {
      //     height: '390',
      //     width: '640',
      //     videoId: 'M7lc1UVf-VE',
      //     events: {
      //       'onReady': onPlayerReady,
      //       'onStateChange': onPlayerStateChange
      //     }
      //   });

      //   function onPlayerReady(event) {
      //     console.log("PLAYER READY");
      //     event.target.playVideo();
      //   }

      //   function onPlayerStateChange(event) {
      //     if(event.data == YT.PlayerState.PLAYING) {
      //     }
      //   }
      // }
}

export { initAddEventListenerToVideo };
