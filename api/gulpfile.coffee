coffee      = require 'gulp-coffee'
coffeelint  = require 'gulp-coffeelint'
gulp        = require 'gulp'
mocha       = require 'gulp-mocha'
gutil       = require 'gulp-util'
runSequence = require 'run-sequence'


paths =
  build: 'build/'
  src:   'src/**/*.coffee'
  test:  'test/**/*_spec.coffee'

gulp.task 'default', ['build']

gulp.task 'build', -> runSequence 'lint-coffee', 'coffee'

gulp.task 'coffee', ->
  gulp.src paths.src
    .pipe coffee
      bare: true
    .on('error', gutil.log)
    .pipe gulp.dest(paths.build)

gulp.task 'lint-coffee', ->
  gulp.src paths.src
    .pipe coffeelint()
    .pipe coffeelint.reporter('default')

gulp.task 'lint-test', ->
  gulp.src paths.test
    .pipe coffeelint()
    .pipe coffeelint.reporter('default')

gulp.task 'test', ['lint-test'], ->
  gulp.src paths.test
    .pipe mocha
      reporter: 'nyan'
