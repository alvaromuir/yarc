# Angular main routes

define [''], () ->
  'use strict'

  (ngApp) ->
    ngApp.config ($routeProvider) ->
      $routeProvider
        .when "/",
          templateUrl: "views/main.html"
          controller: "MainCtrl"
        .when "/json",
          templateUrl: "views/json.html"
          controller: "JsonCtrl"
        .otherwise redirectTo: "/"
