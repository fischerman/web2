module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    sass: {                              // Task
      dist: {                            // Target
        options: {                       // Target options
          style: 'expanded',
          sourcemap: 'inline',
        },
        files: {                         // Dictionary of files
          'dist/static/css/style.css': 'src/sass/main.scss'        // 'destination': 'source'
        }
      }
    },
    copy: {
      app: {
        expand: true,
        dot: true,
        cwd: 'src/app',
        src: ['**'],
        dest: 'dist/',
      },
      mockups: {
        expand: true,
        cwd: 'src/mockup',
        src: ['**'],
        dest: 'dist/static/mockup/',
      },
      lib: {
        expand: true,
        cwd: 'src/lib',
        src: ['**'],
        dest: 'dist/lib/',
      },
      assets: {
        expand: true,
        cwd: 'src/assets',
        src: ['**'],
        dest: 'dist/static/assets/',
      },
      jquery: {
        expand: true,
        cwd: 'bower_components/jquery/dist/',
        src: ['jquery.min.js'],
        dest: 'dist/static/lib/',
      }
    },
    watch: {
      main: {
        files: ['src/app/**', 'src/assets/**', 'src/lib/**', 'src/mockup/**'],
        tasks: ['copy']
      },
      sass: {
        files: ['src/sass/**/*'],
        tasks: ['sass']
      },
      livereload: {
        options: {livereload: true},
        files: ['dist/**/*']
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-watch');

  grunt.registerTask('build', ['sass', 'copy']);

  // Default task(s).
  grunt.registerTask('default', ['build', 'watch']);

};
