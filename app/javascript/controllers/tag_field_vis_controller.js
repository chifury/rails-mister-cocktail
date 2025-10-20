import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tag-field-vis"
export default class extends Controller {
static targets = ["tag"]

  connect() {
    console.log("tag controller connected")
    this.visibleCount = 1
    this.updateTagVisibility()
  }

  hiddenVisibleTags(event) {
    // console.log(event)
    this.visibleCount = Math.min(this.visibleCount + 1, this.tagTargets.length)
    this.updateTagVisibility()
  }

  updateTagVisibility() {
    // console.log(this.tagTargets)
    this.tagTargets.forEach((element, index) => {
      
      const destroyInputTag = element.querySelector('input[name*="_destroy"]');
      console.log(destroyInputTag);

      if (index < this.visibleCount) {
        element.removeAttribute("hidden");
        if (destroyInputTag) destroyInputTag.value = "0";
      } else {
        element.setAttribute("hidden", "");
        if (destroyInputTag) destroyInputTag.value = "1";
      }
    })
  }
}
