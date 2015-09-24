#!/usr/bin/env bash

echo "NPM Init"
npm init

echo "Installing main dependencies"
npm install --save-dev bower browser-sync gulp gulp-load-plugins gulp-inject gulp-less gulp-plumber wiredep rimraf

echo "Configuring Gulp"
mkdir gulpdir
cp ./.bootstrap/gulp/gulpfile.js .
cp ./.bootstrap/gulp/paths.js       gulpdir
cp ./.bootstrap/gulp/inject.js      gulpdir
cp ./.bootstrap/gulp/less.js        gulpdir
cp ./.bootstrap/gulp/build.js       gulpdir
cp ./.bootstrap/gulp/watch.js       gulpdir
cp ./.bootstrap/gulp/server.js      gulpdir

echo "Configuring project"
read -p "Project directory [html]: " PROJECT_DIR
if [ -z "$PROJECT_DIR" ]; then
    PROJECT_DIR="html"
fi
mkdir -p $PROJECT_DIR
sed -i "s/\\\$PROJECT_DIR\\\$/$(echo ${PROJECT_DIR} | sed -e 's/[\/&]/\\&/g')/g" "gulpdir/paths.js";
cp ./.bootstrap/index.html $PROJECT_DIR

read -p "Build directory [.tmp]: " BUILD_DIR
if [ -z "$BUILD_DIR" ]; then
    BUILD_DIR=".tmp"
fi
mkdir -p $PROJECT_DIR/$BUILD_DIR
sed -i "s/\\\$BUILD_DIR\\\$/$(echo ${BUILD_DIR} | sed -e 's/[\/&]/\\&/g')/g" "gulpdir/paths.js";

read -p "Styles directory [styles]: " STYLES_DIR
if [ -z "STYLES_DIR" ]; then
    STYLES_DIR="styles"
fi
mkdir -p $PROJECT_DIR/$STYLES_DIR
sed -i "s/\\\$STYLES_DIR\\\$/$(echo ${STYLES_DIR} | sed -e 's/[\/&]/\\&/g')/g" "gulpdir/paths.js";

read -p "Scripts directory [scripts]: " SCRIPTS_DIR
if [ -z "SCRIPTS_DIR" ]; then
    SCRIPTS_DIR="scripts"
fi
mkdir -p $PROJECT_DIR/$SCRIPTS_DIR
sed -i "s/\\\$SCRIPTS_DIR\\\$/$(echo ${SCRIPTS_DIR} | sed -e 's/[\/&]/\\&/g')/g" "gulpdir/paths.js";

echo "Configuring Bower"
bower init
read -p "Bower directory [${PROJECT_DIR}/bower_components]: " BOWER_DIRECTORY
if [ -z "BOWER_DIRECTORY" ]; then
    BOWER_DIRECTORY="${PROJECT_DIR}/bower_components"
fi
cp ./.bootstrap/.bowerrc .
sed -i "s/\\\$BOWER_DIRECTORY\\\$/$(echo ${BOWER_DIRECTORY} | sed -e 's/[\/&]/\\&/g')/g" ".bowerrc";
sed -i "s/\\\$BOWER_DIRECTORY\\\$/$(echo ${BOWER_DIRECTORY} | sed -e 's/[\/&]/\\&/g')/g" "gulpdir/inject.js";

read -n1 -p "Remove self? [y/N]: " REMOVE_SELF
if [[ $REMOVE_SELF = "y" ]]; then
    rm -rf .git
    rm -rf .bootstrap
    rm -rf bootstrap.sh
fi