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
    .then(html => { document.getElementById("editBannerModalRoot").innerHTML = html; })
  }

  closeEditModal(e) {
    e.preventDefault()
    document.getElementById("editBannerModalRoot").innerHTML = "";
  }
}
