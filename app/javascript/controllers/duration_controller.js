import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["start", "end", 'annotation']

  updateTimes(e) {
    this.annotationTarget.classList.remove('d-none');
    fetch(`/duration.json?id=${e.currentTarget.value}`)
      .then(res => res.json())
      .then(data => {
        this.refreshTimeInputs(data.duration)
      });
  }

  changeStart(e) {
    const endtime = e.target.value
    this.endTarget.min = endtime
    this.writeLabel();
  }

  changeEnd(e) {
    const endtime = e.target.value
    this.endTarget.val = endtime
    this.writeLabel();
  }

  writeLabel() {
    const timeStartLabel = this.startTarget.parentElement.querySelector('label')
    const timeEndLabel = this.endTarget.parentElement.querySelector('label')
    timeStartLabel.innerText = `Time starts: ${this.toReadableTime(this.startTarget.value)}`
    timeEndLabel.innerText = `Time ends: ${this.toReadableTime(this.endTarget.value)}`
  }

  refreshTimeInputs(duration) {
    this.startTarget.max = duration;
    this.endTarget.max = duration;
  }

  toReadableTime(s) {
    let minutes = parseInt(s / 60);
    let seconds = s % 60;
    return `${this.str_pad_left(minutes, '0', 2)}:${this.str_pad_left(seconds, '0', 2)}`
  }

  str_pad_left(string, pad, length) {
    return (new Array(length + 1).join(pad) + string).slice(-length);
  }
}
