module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    sass: {                              // Task
      dist: {                            // Target
        options: {                       // Target options
          style: 'expanded'
        },
        files: {                         // Dictionary of files
          'dist/css/style.css': 'src/sass/main.scss'        // 'destination': 'source'
        }
      }
    },
    copy: {
      mockups: {
        expand: true,
        cwd: 'src/mockup',
        src: ['*'],
        dest: 'dist/mockup/',
      },
      lib: {
        expand: true,
        cwd: 'src/lib/dumbledore',
        src: ['*'],
        dest: 'dist/lib/dumbledore/',
      },
      assets: {
        expand: true,
        cwd: 'src/assets',
        src: ['*'],
        dest: 'dist/assets/',
      }
    },
    watch: {
      main: {
        files: ['src/**/*'],
        tasks: ['build']
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
