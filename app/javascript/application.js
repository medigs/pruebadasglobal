// import { Application } from "@hotwired/stimulus"
// import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers"

// window.Stimulus = Application.start()
// const context = require.context("./controllers", true, /\.js$/)
// Stimulus.load(definitionsFromContext(context))

import "./controllers"
import * as bootstrap from "bootstrap"
import "./controllers/app"

import jquery from 'jquery'

window.jQuery = jquery
window.$ = jquery
