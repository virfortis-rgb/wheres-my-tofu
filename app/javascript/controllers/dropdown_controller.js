import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  connect() {
    // Close the dropdown whenever the user taps/clicks outside of it
    this._onDocClick = (e) => {
      if (!this.element.contains(e.target)) {
        this.menuTarget.classList.remove("open")
      }
    }
    document.addEventListener("click", this._onDocClick)
  }

  disconnect() {
    document.removeEventListener("click", this._onDocClick)
  }

  toggle(e) {
    e.stopPropagation()
    this.menuTarget.classList.toggle("open")
  }
}
