const initYTPlayerSize = () => {
  // const tag = document.createElement('script');
  // tag.src = "https://www.youtube.com/iframe_api"; // Create source to script
  // const firstScriptTag = document.getElementsByTagName('script')[0]; // Get the first <script> on <head></head>!
  // firstScriptTag.parentNode.insertBefore(tag, firstScriptTag); // Insert the script src=youtube to <head></head> -> Calling script which you can try by opening "https://www.youtube.com/iframe_api"
  // console.log(tag);
  // console.log(firstScriptTag);
  // console.log(firstScriptTag.parentNode);
  // console.log(firstScriptTag.parentNode.insertBefore(tag, firstScriptTag));

  // var player;
  // function onYouTubeIframeAPIReady(){
  //   player = new YT.Player('player', {
  //     height: 390,
  //     width: 640,
  //     videoId: "joBfpN9eMg0",
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

export { initYTPlayerSize };
