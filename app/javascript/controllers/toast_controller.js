import { Controller } from "@hotwired/stimulus"
import * as bootstrap from "bootstrap"

// Connects to data-controller="toast"
export default class extends Controller {
  connect() {
  }

  notify(){
    console.log("Click to notify...")
    var toastTrigger = document.getElementById('liveToast')
    var toast = new bootstrap.Toast(toastTrigger);
    toast.show();
  }
}