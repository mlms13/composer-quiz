var gulp = require('gulp'),
    gutil = require('gulp-util'),

    // gulp plugins and utilities
    // concat = require('gulp-concat'),
    exec = require('child_process').exec,
    jade = require('gulp-jade'),
    lr = require('gulp-livereload'),
    nodemon = require('nodemon'),
    stylus = require('gulp-stylus'),
    uglify = require('gulp-uglify'),

    // configuration
    isProduction = gutil.env.prod,
    paths = {
      jade: {
        all: ['./client/index.jade'],
        dest: './public'
      },
      js: {
        all: ['./node_modules/lovefield/dist/lovefield.js', './public/js/client.js'],
        dest: './public/js'
      },
      stylus: {
        main: './client/styl/index.styl',
        all: ['./client/styl/**/*.styl'],
        dest: './public/css'
      },
      haxe: {
        all: ['./client/app/**/*.hx', './server/**/*.hx']
      }
    };

gulp.task('jade', function () {
  return gulp.src(paths.jade.all)
    .pipe(jade())
    .pipe(gulp.dest(paths.jade.dest))
    .pipe(lr());
});

gulp.task('haxe', function (cb) {
  exec('haxe build.hxml', function (err) {
    cb(err);
  });
});

gulp.task('js', ['haxe'], function () {
  return gulp.src(paths.js.all)
    // .pipe(concat('bundle.js'))
    .pipe(isProduction ? uglify() : gutil.noop())
    .pipe(gulp.dest(paths.js.dest))
    .pipe(lr());
});

gulp.task('stylus', function () {
  return gulp.src(paths.stylus.main)
    .pipe(stylus())
    .pipe(gulp.dest(paths.stylus.dest))
    .pipe(lr());
});

gulp.task('build', ['jade', 'js', 'stylus']);

gulp.task('watch', ['build'], function () {
  lr.listen();

  gulp.watch(paths.haxe.all, ['js']);
  gulp.watch(paths.jade.all, ['jade']);
  gulp.watch(paths.stylus.all, ['stylus']);
});

gulp.task('server', ['build'], function () {
  nodemon({
    'script': 'bin/server.js',
    'ignore': ['.git', 'public/**']
  });
});

gulp.task('default', ['server', 'watch']);
