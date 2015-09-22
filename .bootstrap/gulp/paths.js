'use strict';

var PROJECT_DIR = '$PROJECT_DIR$',
    DIR = {
        BUILD: PROJECT_DIR + '/$BUILD_DIR$',
        HTML: PROJECT_DIR,
        LESS: PROJECT_DIR + '/$STYLES_DIR$',
        LESS_BUILD: PROJECT_DIR + '/$BUILD_DIR$/$STYLES_DIR$',
        SCRIPTS: PROJECT_DIR + '/$SCRIPTS_DIR$',

        INJECT_DEST: PROJECT_DIR
    },
    FILES = {
        HTML: DIR.HTML + '/index.html',
        LESS: DIR.LESS + '/**/*.less',

        INJECT: [
            DIR.LESS_BUILD + '/*.css',
            DIR.LESS_BUILD + '/**/*.css',

            DIR.SCRIPTS + '/*.js',
            DIR.SCRIPTS + '/**/*.js'
        ]
    };

module.exports = {
    DIR: DIR,
    FILES: FILES
};