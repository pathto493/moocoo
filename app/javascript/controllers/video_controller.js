import { Controller } from "stimulus";

export default class extends Controller {
  static target = [ "eyeresult" ];


  show(e) {
    const filterType = e.currentTarget.getAttribute('name');

    if(filterType === 'eye'){

      this.eyeresultTarget.style.display = 'block';
debugger
    }
  }
}
