#jshint unused: vars
define [ #deps
#invoke
  "angular"
  "controllers/main"
], (angular, MainCtrl) ->
  "use strict"

  #angJSDeps
  angular.module("yarcApp", [
    "yarcApp.controllers.MainCtrl"
    "yarcApp.controllers.JsonCtrl"
    "ngCookies"
    "ngResource"
    "ngSanitize"
    "ngRoute"
  ]).config ($routeProvider) ->
    $routeProvider
      .when "/",
        templateUrl: "views/main.html"
        controller: "MainCtrl"
      .when "/json",
        templateUrl: "views/json.html"
        controller: "JsonCtrl"
      .otherwise redirectTo: "/"
