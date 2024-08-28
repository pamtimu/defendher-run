import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="loading"
export default class extends Controller {
  static targets = ["spinner"]

  connect() {
    console.log("Loading controller connected");
  }

  showSpinner() {
    this.spinnerTarget.style.display = 'block';
  }
}
