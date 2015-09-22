'use strict';

var gulp = require('gulp'),
    $ = require('gulp-load-plugins')(),
    rimraf = require('rimraf'),
    PATHS = require('./paths.js');

gulp.task('clean', function (cb) {
    rimraf(PATHS.DIR.BUILD + '/styles/*', cb);
});

gulp.task('build', ['clean', 'less', 'inject', 'wiredep']);

gulp.task('default', ['build', 'watch']);