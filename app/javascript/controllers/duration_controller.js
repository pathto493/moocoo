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
      .then(data => {
        this.refreshTimeInputs(data.duration)

        const timeStart = document.getElementById('annotation_time_start');
        timeStart.addEventListener("change", (e) => {
          this.endTarget.min = e.target.value;
          const timeStartMain = document.querySelector('.annotation_time_start');
          const timeStartLabel = timeStartMain.querySelector("label");
          timeStartLabel.innerText = "Time start ";
          timeStartLabel.insertAdjacentText("beforeend", this.toReadableTime(e.target.value));

          // console.dir(timeStartMain);
          console.dir(e.target.value);
        })

        const timeEnd = document.getElementById('annotation_time_end');
        timeEnd.addEventListener("change", (e) => {
          // this.endTarget.min = this.startTarget.value;
          this.endTarget.min = 0;
          this.endTarget.max = (this.startTarget.max - this.startTarget.value)
          const timeEndMain = document.querySelector('.annotation_time_end');
          const timeEndLabel = timeEndMain.querySelector("label");
          timeEndLabel.innerText = "Time end ";
          // timeEndLabel.insertAdjacentText("beforeend", this.toReadableTime(e.target.value));

          timeEndLabel.insertAdjacentText("beforeend", this.toReadableTime(this.startTarget.max - e.target.value));
          console.dir("endTargetMin")
          console.dir(this.endTarget.min);
          // console.dir(timeEndLabel);
        })


      });
    // need to get the id of the video that was selected
    // go to my database to retrieve the duration
    // update both selects with the time
  }

  refreshTimeInputs(duration) {
    this.startTarget.max = duration;
    this.endTarget.max = duration;
  }

  toReadableTime(seconds) {
    let minutes = parseInt(seconds / 60);
    let secondsModule = seconds % 60;
    return `${minutes}:${secondsModule}`
  }

}
