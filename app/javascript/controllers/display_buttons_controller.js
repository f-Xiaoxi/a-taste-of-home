import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['initial', 'buttons']

  connect() {
    console.log("Hello from Stimulus controller")
  }

  display() {
    this.initialTarget.classList.add('d-none');
    this.buttonsTarget.classList.remove('d-none');
  }
}
