#jshint unused: vars 
define [ #deps
#invoke
  "angular"
  "controllers/main"
], (angular, MainCtrl) ->
  "use strict"
  
  #angJSDeps
  angular.module("datavizApp", [
    "datavizApp.controllers.MainCtrl"
    "ngCookies"
    "ngResource"
    "ngSanitize"
    "ngRoute"
  ]).config ($routeProvider) ->
    $routeProvider.when("/",
      templateUrl: "views/main.html"
      controller: "MainCtrl"
    ).otherwise redirectTo: "/"
    return


