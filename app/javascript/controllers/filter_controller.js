import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "videoresult", "productresult", "brandresult" ]

  connect() {

  }

  change(e) {
    const filterType = e.currentTarget.getAttribute('name');

    if(filterType === 'video'){
      // show the video results tag
      // hide the product results tag
      this.videoresultTarget.style.display = 'block';
      this.productresultTarget.style.display = 'none';
      this.brandresultTarget.style.display = 'none';
    } else if(filterType === 'product'){
      // the opposite
      this.videoresultTarget.style.display = 'none';
      this.productresultTarget.style.display = 'block';
      this.brandresultTarget.style.display = 'none';
    } else if(filterType === 'brand'){
      this.videoresultTarget.style.display = 'none';
      this.productresultTarget.style.display = 'none';
      this.brandresultTarget.style.display = 'block';
    }
  }
}
