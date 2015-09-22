'use strict';

var gulp = require('gulp'),
    $ = require('gulp-load-plugins')(),
    browserSync = require('browser-sync').create();

gulp.task('serve', ['build', 'watch'], function () {
    browserSync.init(
        [
            PATHS.FILES.HTML,
            PATHS.FILES.INJECT
        ],
        {
            server: {
                baseDir: PATHS.DIR.HTML
            },
            open: false
        }
    );

    gulp.watch([PATHS.FILES.HTML], browserSync.reload);
});