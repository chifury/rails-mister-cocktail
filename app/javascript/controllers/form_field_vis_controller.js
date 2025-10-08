import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-field-vis"
export default class extends Controller {
  static targets = ["ingredient"]

  connect() {
    console.log("ingredient controller connected")
    this.visibleCount = 1 // Show first ingredient on load. If you set it to 0 it will show no ingredients on load.
    this.updateVisibility() // Refer to this function whenever you need to check for visibility (if) conditions.
  }

  hiddenVisibleFields(event) {
    // console.group(event);
    // console.log(this.ingredientTargets)
    this.visibleCount = Math.min(this.visibleCount + 1, this.ingredientTargets.length)
    this.updateVisibility() // Refer to this function whenever you need to check for visibility (if) conditions.
  }

  updateVisibility() {
    this.ingredientTargets.forEach((element, index) => {
      // console.log(index)

      // Find the hidden input named with `_destroy` for this dose.
      const destroyInput = element.querySelector('input[name*="_destroy"]');
      console.log(destroyInput);

      // Checks for visibility (if) conditions.
      if (index < this.visibleCount) {
        element.removeAttribute("hidden");
        if (destroyInput) destroyInput.value = "0"; // Keep this dose.
      } else {
        element.setAttribute("hidden", "");
        if (destroyInput) destroyInput.value = "1"; // Mark for destruction.
      }
    })
  }
}
