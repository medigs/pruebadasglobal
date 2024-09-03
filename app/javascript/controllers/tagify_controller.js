import { Controller } from "@hotwired/stimulus"
import Tagify from "@yaireo/tagify"

// Connects to data-controller="tagify"
export default class extends Controller {
  connect() {
    new Tagify(this.element)
  }
}