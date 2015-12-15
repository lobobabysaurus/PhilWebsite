clean = require 'gulp-rimraf'
coffeeify = require 'gulp-coffeeify'
coffeelint = require 'gulp-coffeelint'
gulp = require 'gulp'
less = require 'gulp-less'
recess = require 'gulp-recess'
runSequence = require 'run-sequence'
uglify = require 'gulp-uglify'
uglifycss = require 'gulp-uglifycss'

paths =
  build: 'build/'
  coffee: 'src/**/*.coffee'
  css: 'build/philStyle.css'
  js: 'build/index.js'
  less: 'style/**/*.less'
  static: 'static/*'


gulp.task 'default', ['build']

gulp.task 'build', ->
  return runSequence 'clean', ['build-less', 'build-coffee', 'static']

gulp.task 'build-coffee', ->
  return runSequence 'lint-coffee', 'coffee', 'minify-js'

gulp.task 'build-less', ->
  return runSequence 'lint-less', 'less', 'minify-css'

gulp.task 'clean', ->
  return gulp.src(paths.build, read: false)
    .pipe(clean())

gulp.task 'coffee', ->
  return gulp.src(paths.coffee)
      .pipe(coffeeify())
      .pipe(gulp.dest(paths.build))

gulp.task 'less', ->
  return gulp.src(paths.less)
    .pipe(less())
    .pipe(gulp.dest(paths.build))

gulp.task 'lint-coffee', ->
  return gulp.src(paths.coffee)
    .pipe(coffeelint())
    .pipe(coffeelint.reporter('default'))

gulp.task 'lint-less', ->
  return gulp.src(paths.less)
    .pipe(recess())
    .pipe(recess.reporter())

gulp.task 'minify-css', ->
  return gulp.src(paths.css)
    .pipe(uglifycss())
    .pipe(gulp.dest(paths.build))

gulp.task 'minify-js', ->
  return gulp.src(paths.js)
    .pipe(uglify())
    .pipe(gulp.dest(paths.build))

gulp.task 'static', ->
  return gulp.src(paths.static)
    .pipe(gulp.dest(paths.build))
