// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

let isDark = true;

export default class extends Controller {
  static targets = [ "dark", "switch" ]

  connect() {
    if (isDark === true) {
      this.darkTargets.forEach(e => e.classList.add("dark"))
      this.switchTarget.checked = true;
    } else {
      this.darkTargets.forEach(e => e.classList.remove("dark"))
      this.switchTarget.checked = false;
    }
  }

  switchDark() {
    this.darkTargets.forEach(e => e.classList.toggle("dark"))
    isDark = !isDark
  }
}
