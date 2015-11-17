clean = require 'gulp-clean'
coffeeify = require 'gulp-coffeeify'
coffeelint = require 'gulp-coffeelint'
gulp = require 'gulp'
less = require 'gulp-less'
recess = require 'gulp-recess'
runSequence = require 'run-sequence'
uglify = require 'gulp-uglify'
uglifycss = require 'gulp-uglifycss'


gulp.task 'build', ->
  return runSequence 'clean', ['build-less', 'build-coffee', 'static']

gulp.task 'build-coffee', ->
  return runSequence 'lint-coffee', 'coffee', 'minify-js'

gulp.task 'build-less', ->
  return runSequence 'lint-less', 'less', 'minify-css'

gulp.task 'clean', ->
  return gulp.src('build/', read: false)
    .pipe(clean())

gulp.task 'coffee', ->
  return gulp.src('src/index.coffee')
      .pipe(coffeeify())
      .pipe(gulp.dest('./build'))

gulp.task 'less', ->
  return gulp.src("style/philStyle.less")
    .pipe(less())
    .pipe(gulp.dest('build/'))

gulp.task 'lint-coffee', ->
  return gulp.src('src/**/*.coffee')
    .pipe(coffeelint())
    .pipe(coffeelint.reporter('default'))

gulp.task 'lint-less', ->
  return gulp.src('style/**/*.less')
    .pipe(recess())
    .pipe(recess.reporter())

gulp.task 'minify-css', ->
  return gulp.src('build/philStyle.css')
    .pipe(uglifycss())
    .pipe(gulp.dest('build/'))

gulp.task 'minify-js', ->
  return gulp.src('build/index.js')
    .pipe(uglify())
    .pipe(gulp.dest('build/'))

gulp.task 'static', ->
  return gulp.src("static/index.html")
    .pipe(gulp.dest('build/'))
