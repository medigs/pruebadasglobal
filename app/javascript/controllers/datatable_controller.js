import { Controller } from "@hotwired/stimulus"
import "datatables.net";
import "datatables.net-bs5";
import "datatables.net-responsive-bs5";
import "datatables.net-responsive";
import DataTable from "datatables.net-bs5";

// Connects to data-controller="datatable"
export default class extends Controller {
  static dt;
  connect() {
    console.log("Entro hasta aca");
    console.log("Connecting to data-controller=datatable");
    let table_id = this.element.id;
    console.log(table_id);
    if (!this.dt) {
      this.dt = new DataTable(`#${table_id}`,{
          "responsive": {
          "details": {
            "display": $.fn.dataTable.Responsive.display.childRowImmediate
          }
        },
        "language": {
          "url": '//cdn.datatables.net/plug-ins/1.13.6/i18n/es-ES.json'
        }
      });
    }

    var elementoExterno = document.getElementById(`${table_id}_wrapper`);
    //Validar que la variable elementoExterno no sea null
    if (elementoExterno) {
      console.log("Encontro el elemento externo");
      var elementoInterno = elementoExterno.querySelector(`#${table_id}_wrapper`);

      if (elementoInterno) {
        console.log("Encontro el elemento interno");
        var etiquetasRow = elementoExterno.querySelectorAll(".row");
        etiquetasRow[0].remove();
        etiquetasRow[1].className="";
        etiquetasRow[5].remove();
        elementoExterno.removeAttribute("id");
      }
    }
  }
}
