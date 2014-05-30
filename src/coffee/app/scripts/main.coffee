#jshint unused: vars
require.config
  paths: {}
  shim:
    angular:
      exports: "angular"

    "angular-route": ["angular"]
    "angular-cookies": ["angular"]
    "angular-sanitize": ["angular"]
    "angular-resource": ["angular"]
    "angular-mocks":
      deps: ["angular"]
      exports: "angular.mock"

  priority: ["angular"]


#http://code.angularjs.org/1.2.1/docs/guide/bootstrap#overview_deferred-bootstrap
window.name = "NG_DEFER_BOOTSTRAP!"
require [
  "angular"
  "app"
  "angular-route"
  "angular-cookies"
  "angular-sanitize"
  "angular-resource"
], (angular, app, ngRoutes, ngCookies, ngSanitize, ngResource) ->
  "use strict"

  # jshint ignore:start
  $html = angular.element(document.getElementsByTagName("html")[0])

  # jshint ignore:end
  angular.element().ready ->
    angular.resumeBootstrap [app.name]
    return

  return
