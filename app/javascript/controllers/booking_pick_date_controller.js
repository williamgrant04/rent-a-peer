import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="booking-pick-date"
export default class extends Controller {
  connect() {
    flatpickr(this.element)
  }
}
