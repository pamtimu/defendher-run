import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="biography"
export default class extends Controller {
  static targets = [ "text", "form" ]

  connect() {
  }

  modifyBiography() {
    this.formTarget.classList.toggle('d-none')
    this.textTarget.classList.toggle('d-none')
  }

  saveText() {
    // Save the text and replace the textarea with a div
    fetch(this.formTarget.action, {
      method: "PATCH", // Could be dynamic with Stimulus values
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
  }
}
