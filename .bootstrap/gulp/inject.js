'use strict';

var gulp = require('gulp'),
    $ = require('gulp-load-plugins')(),
    wiredep = require('wiredep').stream,
    PATHS = require('./paths.js');

gulp.task('inject', function () {
    return gulp.src(PATHS.DIR.HTML)
        .pipe(
        $.inject(gulp.src(PATHS.FILES.INJECT, {read: false}), {relative: true})
    )
        .pipe(gulp.dest(PATHS.DIR.INJECT_DEST));
});

gulp.task('wiredep', function () {
    gulp.src(PATHS.FILES.HTML)
        .pipe(wiredep({
            directory : '$BOWER_DIRECTORY$'
        }))
        .pipe(gulp.dest(PATHS.DIR.INJECT_DEST));
});