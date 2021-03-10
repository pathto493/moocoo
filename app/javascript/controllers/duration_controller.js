import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["start", "end"]

  connect() {
    console.log('I am connected!');
  }

  updateTimes(e) {
    console.log(e.currentTarget.value);
    fetch(`/duration.json?id=${e.currentTarget.value}`)
      .then(res => res.json())
      .then(data => this.refreshTimeInputs(data.duration));
    // need to get the id of the video that was selected
    // go to my database to retrieve the duration
    // update both selects with the time
  }

  refreshTimeInputs(duration) {
    this.startTarget.max = duration;
    this.endTarget.max = duration;
  }
}
