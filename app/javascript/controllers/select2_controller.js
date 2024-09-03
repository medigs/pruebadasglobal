import { Controller } from "@hotwired/stimulus"
import $ from 'jquery';
import Select2 from "select2"


// Connects to data-controller="select2"
export default class extends Controller {
  connect() {
    console.log("connect select2");
    Select2();
    $('.content-search').select2({
      theme: 'bootstrap-5'
    });

  }
}