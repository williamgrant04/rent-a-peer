import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="banner-select"
export default class extends Controller {
  showEditModal(e) {
    fetch('/banner-partial', {
      method: 'GET',
      headers: {
        'Content-Type': 'text/html',
        'X-Requested-With': 'XMLHttpRequest'
      },
    })
    .then(response => response.text())
    .then(html => {
      document.getElementById("editBannerModalRoot").innerHTML = html
      document.body.style.overflowY = "hidden"
      document.querySelector(".is-valid").classList.remove("is-valid")
      document.querySelector(".modal-wrapper").dataset.action = "click->banner-select#closeEditModal keyup.esc@document->banner-select#closeEditModal"
    })
  }

  closeEditModal(e) {
    e.preventDefault()
    document.getElementById("editBannerModalRoot").innerHTML = ""
    document.body.style.overflowY = "scroll"
  }
}
