#jshint unused: vars
define [ #deps
#invoke
  "angular"
  "controllers/main"
  "routes"
], (angular, MainCtrl, routes) ->
  "use strict"

  #angJSDeps
  angular.module("yarcApp", [
    "yarcApp.controllers.MainCtrl"
    "yarcApp.controllers.JsonCtrl"
    "ngCookies"
    "ngResource"
    "ngSanitize"
    "ngRoute"
  ])

  # get routes
  routes ngApp
