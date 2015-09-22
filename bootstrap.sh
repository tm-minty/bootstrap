#!/usr/bin/env bash

echo "NPM Init"
#npm init

echo "Installing main dependencies"
#npm install --save-dev bower browser-sync gulp gulp-load-plugins gulp-inject gulp-less gulp-plumber wiredep rimraf

echo "Configuring Bower"
bower init
echo "Bower directory: "
read BOWER_DIRECTORY
cp ./.bootstrap/.bowerrc .
sed -i "s/\\\$BOWER_DIRECTORY\\\$/${BOWER_DIRECTORY}/g" ".bowerrc";

echo "Configuring Gulp"
mkdir gulpdir
cp ./.bootstrap/gulp/gulpfile.js .
cp ./.bootstrap/gulp/paths.js       gulpdir
cp ./.bootstrap/gulp/inject.js      gulpdir
sed -i "s/\\\$BOWER_DIRECTORY\\\$/${BOWER_DIRECTORY}/g" "gulpdir/inject.js";
cp ./.bootstrap/gulp/less.js        gulpdir
cp ./.bootstrap/gulp/build.js       gulpdir
cp ./.bootstrap/gulp/watch.js       gulpdir
cp ./.bootstrap/gulp/server.js      gulpdir

echo "Configuring project"
echo "Project directory [html]:"
read PROJECT_DIR
if [ -z "$PROJECT_DIR" ]; then
    PROJECT_DIR="html"
fi
mkdir -p $PROJECT_DIR
sed -i "s/\\\$PROJECT_DIR\\\$/${PROJECT_DIR}/g" "gulpdir/paths.js";
cp ./.bootstrap/index.html $PROJECT_DIR

echo "Build directory [.tmp]:"
read BUILD_DIR
if [ -z "$BUILD_DIR" ]; then
    BUILD_DIR=".tmp"
fi
mkdir -p $PROJECT_DIR/$BUILD_DIR
sed -i "s/\\\$BUILD_DIR\\\$/${BUILD_DIR}/g" "gulpdir/paths.js";

echo "Styles directory [styles]:"
read STYLES_DIR
if [ -z "STYLES_DIR" ]; then
    STYLES_DIR="styles"
fi
mkdir -p $PROJECT_DIR/$STYLES_DIR
sed -i "s/\\\$STYLES_DIR\\\$/${STYLES_DIR}/g" "gulpdir/paths.js";

echo "Scripts directory [scripts]:"
read SCRIPTS_DIR
if [ -z "SCRIPTS_DIR" ]; then
    SCRIPTS_DIR="scripts"
fi
mkdir -p $PROJECT_DIR/$SCRIPTS_DIR
sed -i "s/\\\$SCRIPTS_DIR\\\$/${SCRIPTS_DIR}/g" "gulpdir/paths.js";