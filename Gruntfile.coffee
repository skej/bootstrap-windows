module.exports = (grunt) ->

  grunt.initConfig
    coffee:
      ext:
        files: 'panels.js': 'panels.coffee'
        options: bare: false

    uglify:
      options:
        mangle: false
      target:
        files:
          "panels.min.js": "panels.js"

    less: 
      lib: 
        files:
          'panels.css': 'panels.less'
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
