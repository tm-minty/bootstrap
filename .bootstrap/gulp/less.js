'use strict';

var gulp = require('gulp'),
    $ = require('gulp-load-plugins')(),
    PATHS = require('./paths.js');

gulp.task('less', function () {
    return gulp.src(PATHS.FILES.LESS)
        .pipe($.plumber())
        .pipe($.less())
        .pipe(gulp.dest(PATHS.DIR.LESS_BUILD));
});