#!/bin/bash -xe
APP=$1
ROOT=$(pwd)

cd "$APP"

./gradlew clean
./gradlew build
./gradlew build --write-versions
APP_VERSION=$(./gradlew properties -q | grep "version:" | awk '{print $2}')
./gradlew build --write-versions

git add build.gradle
git commit -m "cicd: bump version ${APP}:${APP_VERSION}"

cd "$ROOT"
TAG=$APP_VERSION docker compose build --no-cache "$APP"

docker images "dio/${APP}"
