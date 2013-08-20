module.exports = (grunt) ->

  grunt.initConfig
    coffee:
      ext:
        files: 'bootstrap-panels.js': 'bootstrap-panels.coffee'
        options: bare: false

    uglify:
      options:
        mangle: false
      target:
        files:
          "bootstrap-panels.min.js": "bootstrap-panels.js"

    less: 
      lib: 
        files:
          'bootstrap-panels.css': 'bootstrap-panels.less'
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
