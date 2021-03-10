import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ "eyeresult", "foundationresult" ]

  show(e) {
    console.log('hello');
    const filterType = e.currentTarget.getAttribute('name');

    if(filterType === 'eye'){

      this.eyeresultTarget.style.display = 'block';
    }
    else if(filterType === 'foundation'){
      this.foundationresultTarget.style.display = "block";
    }
  }
}
