import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["field"];

  remove(event) {
    event.preventDefault();

    this.fieldTarget.remove();
  }
}