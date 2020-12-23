#!/usr/bin/env bash
set -e

if [ "$#" -ne 2 ]; then
  echo "Please input your old and new application name."
  exit 1
fi

echo "=====> Changing application name from ${1} to ${2}"

if [ "$(uname)" = "Linux" ]; then
  sed -i "/^APP_NAME /s/=.*$/= ${2}/" ./Makefile
else
  sed -i '' "/^APP_NAME /s/=.*$/= ${2}/" ./Makefile
fi

mv ./cmd/"${1}" ./cmd/"${2}"
