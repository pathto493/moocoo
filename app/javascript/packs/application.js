// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.



require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "controllers";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initTabImageOnClick } from '../components/_tab_images';

import { initAddEventListenerToVideo } from '../components/_video_state_listener';

import { vidOrderAlert } from '../components/_vidorderalert';

import { sortFunction } from '../components/_sort';

import { initVideoJump } from '../components/_init_video_jump';
import { initRemoveOrderFromCartAlert } from '../components/_remove_order_alert';

import { scrollNav } from '../components/_scrollNav';
import { addToCart } from '../components/_cart_badge';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();


  // onClick();

  // playAhead();
  initAddEventListenerToVideo();

  initTabImageOnClick();
  vidOrderAlert ();
  initVideoJump();
  initRemoveOrderFromCartAlert();
  scrollNav();
  sortFunction();
  addToCart();

  document.addEventListener('turbolinks:request-start', () => {
    const spinner = document.querySelector('#spinner');
    spinner.style.display = 'flex';
  });

  document.addEventListener('turbolinks:request-end', () => {
    const spinner = document.querySelector('#spinner');
    spinner.style.display = 'none';
  });
});

