#!/bin/bash -xe
APP=$1
ROOT=$(pwd)

cd "$APP"

APP_VERSION=$(./gradlew properties -q | grep "version:" | awk '{ sub("-SNAPSHOT", "", $2); print $2 }')
./gradlew clean build

git add build.gradle
git commit -m "cicd: bump version ${APP}:${APP_VERSION}"

cd "$ROOT"
TAG=$APP_VERSION docker compose build --no-cache "$APP"

docker images "dio/${APP}"
