# DMP RESTful controller

define [''], () ->
  'use strict'

  ($scope, $http) ->
    $http.get('http://echo.jsontest.com/testing/123/holla_at/@alvaromuir').success (data, status, headers, config) ->
      $scope.json = data
