'use strict';

var gulp = require('gulp'),
    $ = require('gulp-load-plugins')(),
    PATHS = require('./paths.js');

gulp.task('watch', function () {
    gulp.watch([PATHS.FILES.LESS], ['less']);
    gulp.watch(PATHS.FILES.INJECT, ['inject']);

    gulp.watch('bower.json', ['wiredep']);
});