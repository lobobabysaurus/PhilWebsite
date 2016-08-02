coffee = require 'gulp-coffee'
coffeelint = require 'gulp-coffeelint'
gulp = require 'gulp'
gutil = require 'gulp-util'
runSequence = require 'run-sequence'

paths =
  build: 'build/'
  src: 'src/**/*.coffee'

gulp.task 'default', ['build']

gulp.task 'build', ->
  return runSequence 'lint-coffee', 'coffee'

gulp.task 'coffee', ->
  return gulp.src(paths.src)
    .pipe(coffee(bare: true).on('error', gutil.log))
    .pipe(gulp.dest(paths.build))

gulp.task 'lint-coffee', ->
  return gulp.src(paths.src)
    .pipe(coffeelint())
    .pipe(coffeelint.reporter('default'))