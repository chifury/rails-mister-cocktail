import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-field-vis"
export default class extends Controller {
  static targets = ["headerFour", "paragraph", "doseAmount", "newIngredient", "selectIngredient"]

  connect() {
    console.log("connected sir")
  }

  hiddenVisibleFields(event) {
    console.group(event);
    this.headerFourTarget.removeAttribute("hidden");
    this.paragraphTarget.removeAttribute("hidden");
    this.doseAmountTarget.removeAttribute("hidden");
    this.newIngredientTarget.removeAttribute("hidden");
    this.selectIngredientTarget.removeAttribute("hidden");
  }
}
