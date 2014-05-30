# Generated on 2014-05-29 using generator-angular-require 0.1.13
"use strict"

# # Globbing
# for performance reasons we're only matching one level down:
# 'test/spec/{,*/}*.js'
# use this if you want to recursively match all subfolders:
# 'test/spec/**/*.js'
module.exports = (grunt) ->

  # Load grunt tasks automatically
  require("load-grunt-tasks") grunt

  # Time how long tasks take. Can help when optimizing build times
  require("time-grunt") grunt

  # Define the configuration for all the tasks
  grunt.initConfig

    # Project settings
    project:

      # configurable paths
      app: require("./bower.json").appPath or "app"
      dist: "dist"
      src: "src"


    # Watches files for changes and runs tasks based on the changed files
    watch:
      js:
        files: ["<%= project.app %>/scripts/{,*/}*.js"]
        # tasks: ["newer:jshint:all"]
        options:
          livereload: true

      jsTest:
        files: ["test/spec/{,*/}*.js"]
        tasks: [
          # "newer:jshint:test"
          "karma"
        ]

      coffee:
        files: ["<%= project.src %>/coffee/**/*.coffee"]
        tasks: ["newer:coffee"]

      jade:
        files: ["<%= project.src %>/jade/**/*.jade"]
        tasks: ["newer:jade:html"]

      less:
        files: ["<%= project.app %>/less/**/*.less"]
        task: ["newer:less"]

      styles:
        files: ["<%= project.app %>/styles/{,*/}*.css"]
        tasks: [
          "newer:copy:styles"
          "autoprefixer"
        ]

      bower:
        files: ["./bower.json"]
        tasks: ["bower"]


      gruntfile:
        files: ["Gruntfile.coffee"]

      livereload:
        options:
          livereload: "<%= connect.options.livereload %>"

        files: [
          "<%= project.app %>/{,*/}*.html"
          "<%= project.src %>/less/{,*/}*.less"
          ".tmp/styles/{,*/}*.css"
          "<%= project.app %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}"
          "./package.json"
          "./Gruntfile.coffee"
        ]


    # The actual grunt server settings
    connect:
      options:
        port: 9000

        # Change this to '0.0.0.0' to access the server from outside.
        hostname: "localhost"
        livereload: 35729

      livereload:
        options:
          open: true
          base: [
            ".tmp"
            "<%= project.app %>"
          ]

      test:
        options:
          port: 9001
          base: [
            ".tmp"
            "test"
            "<%= project.app %>"
          ]

      dist:
        options:
          base: "<%= project.dist %>"

    # Coffeescript
    coffee:
      dist:
        expand: true
        flatten: false
        cwd: "<%= project.src %>/coffee/"
        src: ["**/*.coffee"]
        dest: "./"
        ext: ".js"

    # Jade HTML
    jade:
      html:
        options:
          pretty: true
          client: false
          basePath: "<%= project.src %>/jade"
        files:
          "./": ["<%= project.src %>/jade/**/*.jade"]

    # Less.css
    less:
      development:
        options:
          paths: ["<%= project.src %>/less"]
        files: "<%= project.app %>/styles/main.css": "<%= project.src %>/less/main.less"

    # Make sure code styles are up to par and there are no obvious mistakes
    jshint:
      options:
        jshintrc: ".jshintrc"
        reporter: require("jshint-stylish")

      all: [
        "Gruntfile.js"
        "<%= project.app %>/scripts/{,*/}*.js"
      ]
      test:
        options:
          jshintrc: "test/.jshintrc"

        src: ["test/spec/{,*/}*.js"]


    # Empties folders to start fresh
    clean:
      dev:
        files: [
          dot: true
          src: [
            ".tmp"
            "<%= project.app %>/**.html"
            "<%= project.app %>/scripts/"
            "<%= project.app %>/views/"
            "<%= project.app %>/styles/"
            "<%= project.app %>/test/"
            "!<%= project.dist %>/.git*"
          ]
        ]
      test:
        files: [
          dot: true
          src: [
            ".tmp"
            "./*.js"
            "!<%= project.dist %>/.git*"
          ]
        ]
      dist:
        files: [
          dot: true
          src: [
            ".tmp"
            "<%= project.dist %>/*"
            "!<%= project.dist %>/.git*"
          ]
        ]

      server: ".tmp"


    # Add vendor prefixed styles
    autoprefixer:
      options:
        browsers: ["last 1 version"]

      dist:
        files: [
          expand: true
          cwd: ".tmp/styles/"
          src: "{,*/}*.css"
          dest: ".tmp/styles/"
        ]


    # Automatically inject Bower components into the app
    # version ~0.7.0
    "bower-install":
      app:
        html:"<%= project.app %>/index.html"
        ignorePath: "<%= project.app %>/"


    # Renames files for browser caching purposes
    rev:
      dist:
        files:
          src: [
            "<%= project.dist %>/scripts/{,*/}*.js"
            "<%= project.dist %>/styles/{,*/}*.css"
            "<%= project.dist %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}"
            "<%= project.dist %>/styles/fonts/*"
          ]


    # Reads HTML for usemin blocks to enable smart builds that automatically
    # concat, minify and revision files. Creates configurations in memory so
    # additional tasks can operate on them
    useminPrepare:
      html: "<%= project.app %>/index.html"
      options:
        dest: "<%= project.dist %>"


    # Performs rewrites based on rev and the useminPrepare configuration
    usemin:
      html: ["<%= project.dist %>/{,*/}*.html"]
      css: ["<%= project.dist %>/styles/{,*/}*.css"]
      options:
        assetsDirs: ["<%= project.dist %>"]


    # The following *-min tasks produce minified files in the dist folder
    imagemin:
      dist:
        files: [
          expand: true
          cwd: "<%= project.app %>/images"
          src: "{,*/}*.{png,jpg,jpeg,gif}"
          dest: "<%= project.dist %>/images"
        ]

    svgmin:
      dist:
        files: [
          expand: true
          cwd: "<%= project.app %>/images"
          src: "{,*/}*.svg"
          dest: "<%= project.dist %>/images"
        ]

    htmlmin:
      dist:
        options:
          collapseWhitespace: true
          collapseBooleanAttributes: true
          removeCommentsFromCDATA: true
          removeOptionalTags: true

        files: [
          expand: true
          cwd: "<%= project.dist %>"
          src: [
            "*.html"
            "views/{,*/}*.html"
          ]
          dest: "<%= project.dist %>"
        ]


    # Allow the use of non-minsafe AngularJS files. Automatically makes it
    # minsafe compatible so Uglify does not destroy the ng references
    ngmin:
      dist:
        files: [
          expand: true
          cwd: ".tmp/concat/scripts"
          src: "*.js"
          dest: ".tmp/concat/scripts"
        ]


    # Replace Google CDN references
    cdnify:
      dist:
        html: ["<%= project.dist %>/*.html"]


    # Copies remaining files to places other tasks can use
    copy:
      dist:
        files: [
          {
            expand: true
            dot: true
            cwd: "<%= project.app %>"
            dest: "<%= project.dist %>"
            src: [
              "*.{ico,png,txt}"
              ".htaccess"
              "*.html"
              "views/{,*/}*.html"
              "bower_components/**/*"
              "images/{,*/}*.{webp}"
              "fonts/*"
            ]
          }
          {
            expand: true
            cwd: ".tmp/images"
            dest: "<%= project.dist %>/images"
            src: ["generated/*"]
          }
        ]

      styles:
        expand: true
        cwd: "<%= project.app %>/styles"
        dest: ".tmp/styles/"
        src: "{,*/}*.css"


    # Run some tasks in parallel to speed up the build process
    concurrent:
      server: ["copy:styles"]
      test: ["copy:styles"]
      dist: [
        "copy:styles"
        "imagemin"
        "svgmin"
      ]


    # By default, your `index.html`'s <!-- Usemin block --> will take care of
    # minification. These next options are pre-configured if you do not wish
    # to use the Usemin blocks.
    # cssmin: {
    #   dist: {
    #     files: {
    #       '<%= project.dist %>/styles/main.css': [
    #         '.tmp/styles/{,*/}*.css',
    #         '<%= project.app %>/styles/{,*/}*.css'
    #       ]
    #     }
    #   }
    # },
    # uglify: {
    #   dist: {
    #     files: {
    #       '<%= project.dist %>/scripts/scripts.js': [
    #         '<%= project.dist %>/scripts/scripts.js'
    #       ]
    #     }
    #   }
    # },
    # concat: {
    #   dist: {}
    # },

    # Test settings
    karma:
      unit:
        configFile: "karma.conf.js"
        singleRun: true


    # Settings for grunt-bower-requirejs
    bower:
      app:
        rjsConfig: "<%= project.app %>/scripts/main.js"
        options:
          # config: "<%= project.app %>/scripts/config.js"
          exclude: [
            "requirejs"
            "json3"
            "es5-shim"
          ]

    replace:
      test:
        src: "<%= project.app %>/../test/test-main.js"
        overwrite: true
        replacements: [
          from: /paths: {[^}]+}/
          to: ->
            require("fs").readFileSync(grunt.template.process("<%= project.app %>") + "/scripts/main.js").toString().match /paths: {[^}]+}/
        ]


    # r.js compile config
    requirejs:
      dist:
        options:
          dir: "<%= project.dist %>/scripts/"
          modules: [name: "main"]
          preserveLicenseComments: false # remove all comments
          removeCombined: true
          baseUrl: "<%= project.app %>/scripts"
          mainConfigFile: "<%= project.app %>/scripts/main.js"
          optimize: "uglify2"
          uglify2:
            mangle: false

  grunt.registerTask "serve", (target) ->
    if target is "dist"
      return grunt.task.run([
        "build"
        "connect:dist:keepalive"
      ])
    grunt.task.run [
      "clean:server"
      "clean:dev"
      "coffee"
      "jade"
      "less"
      "bower-install"
      "bower"
      "concurrent:server"
      "autoprefixer"
      "connect:livereload"
      "watch"
    ]
    return

  grunt.registerTask "server", (target) ->
    grunt.log.warn "The `server` task has been deprecated. Use `grunt serve` to start a server."
    grunt.task.run ["serve:" + target]
    return

  grunt.registerTask "test", [
    "clean:server"
    "concurrent:test"
    "autoprefixer"
    "connect:test"
    "coffee"
    "jade"
    "less"
    "bower"
    "karma"
  ]
  grunt.registerTask "build", [
    "clean:dist"
    "bower:app"
    "coffee"
    "jade"
    "less"
    "bower-install"
    "bower"
    "replace:test"
    "useminPrepare"
    "concurrent:dist"
    "autoprefixer"
    "concat"
    "ngmin"
    "copy:dist"
    "cdnify"
    "cssmin"

    # Below task commented out as r.js (via grunt-contrib-requirejs) will take care of this
    # 'uglify',
    "rev"
    "usemin"
    "requirejs:dist"
    "htmlmin"
  ]
  grunt.registerTask "default", [
    "newer:jshint"
    "test"
    "build"
  ]
  return
