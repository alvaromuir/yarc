define ["angular"
        "controllers/yeoman"
        ], (angular, yeoman) ->
  "use strict"

  ngApp = angular.module 'datavizApp.controllers.MainCtrl', []
  ngApp.controller 'MainCtrl', ($scope) ->
    yeoman $scope
