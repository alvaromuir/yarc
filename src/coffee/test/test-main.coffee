tests = []
for file of window.__karma__.files
  
  # Removed "Spec" naming from files
  tests.push file  if /Spec\.js$/.test(file)  if window.__karma__.files.hasOwnProperty(file)
requirejs.config
  
  # Karma serves files from '/base'
  baseUrl: "/base/app/scripts"
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

  
  # ask Require.js to load these files (all our tests)
  deps: tests
  
  # start test run, once Require.js is done
  callback: window.__karma__.start

