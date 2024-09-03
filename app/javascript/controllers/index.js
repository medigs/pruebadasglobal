// Import and register all your controllers from the importmap under controllers/*

import { application } from "./application"


import HelloController from "./hello_controller"
application.register("hello", HelloController)

import Select2Controller from "./select2_controller"
application.register("select2", Select2Controller)

import SweetalertController from "./sweetalert_controller"
application.register("sweetalert", SweetalertController)

import TagifyController from "./tagify_controller"
application.register("tagify", TagifyController)

import ToastController from "./toast_controller"
application.register("toast", ToastController)

import DatatableController from "./datatable_controller"
application.register("datatable", DatatableController)