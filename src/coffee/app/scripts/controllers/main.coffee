define ["angular"
        "controllers/yeoman"
        "controllers/dmp"
        ], (angular, yeoman, dmp) ->
  "use strict"

  angular.module 'yarcApp.controllers.MainCtrl', []
    .controller 'MainCtrl', ($scope) ->
      yeoman $scope

  angular.module 'yarcApp.controllers.DmpCtrl', []
    .controller 'DmpCtrl', ($scope, $http) ->
      dmp $scope, $http
