module.exports = (grunt) ->

  grunt.initConfig
    coffee:
      ext:
        files: 'bootstrap-windows.js': 'bootstrap-windows.coffee'
        options: bare: false

    uglify:
      options:
        mangle: false
      target:
        files:
          "bootstrap-windows.min.js": "bootstrap-windows.js"

    less: 
      lib: 
        files:
          'bootstrap-windows.min.css': 'bootstrap-windows.less'
        options:
          compress: true

    watch: 
      files: ['*.less', '*.coffee']
      tasks: 'default'

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-uglify'

  grunt.registerTask 'default', ['coffee', 'uglify', 'less']
