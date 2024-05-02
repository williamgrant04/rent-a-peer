import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-bar"
export default class extends Controller {
  static targets = ["button", "input"]

  connect() {
    if (this.inputTarget.value !== "") {
      this.buttonTarget.classList.remove("hidden")
      this.inputTarget.classList.add("focused")
    }
  }

  typeUpdate(e) {
    if (e.target.value === "") {
      // Remove search button
      this.buttonTarget.classList.add("hidden")
      this.inputTarget.classList.remove("focused")
    } else {
      // Display search button
      this.buttonTarget.classList.remove("hidden")
      this.inputTarget.classList.add("focused")
    }
  }

  focus() {
  }

  blur() {
  }
}
