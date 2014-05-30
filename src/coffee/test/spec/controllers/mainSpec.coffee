#jshint unused: vars 
define [
  "angular"
  "angular-mocks"
  "app"
], (angular, mocks, app) ->
  "use strict"
  describe "Controller: MainCtrl", ->
    
    # load the controller's module
    beforeEach module("datavizApp.controllers.MainCtrl")
    MainCtrl = undefined
    scope = undefined
    
    # Initialize the controller and a mock scope
    beforeEach inject(($controller, $rootScope) ->
      scope = $rootScope.$new()
      MainCtrl = $controller("MainCtrl",
        $scope: scope
      )
      return
    )
    it "should attach a list of awesomeThings to the scope", ->
      expect(scope.awesomeThings.length).toBe 3
      return

    return

  return

