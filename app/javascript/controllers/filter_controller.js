import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "videoresult", "productresult" ]

  connect() {

  }

  change(e) {
    const filterType = e.currentTarget.getAttribute('name');

    if(filterType === 'video'){
      // show the video results tag
      // hide the product results tag
      this.videoresultTarget.style.display = 'block';
      this.productresultTarget.style.display = 'none';
    } else {
      // the opposite
      this.videoresultTarget.style.display = 'none';
      this.productresultTarget.style.display = 'block';
    }
  }
}
