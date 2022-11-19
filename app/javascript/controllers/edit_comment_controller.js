import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-comment"
export default class extends Controller {
  static targets = ['initial', 'field']

  connect() {
  }

  display() {
    this.initialTarget.classList.add('d-none');
    this.fieldTarget.classList.remove('d-none');
  }
}
