import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="auto-submit"
export default class extends Controller {
  connect() {
    console.log('Connected to auto submit controller')
  }

  submit() {
    console.log(event)
    this.element.submit()
  }
}
