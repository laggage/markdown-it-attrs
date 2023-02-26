#!/bin/bash

set -e

[ -z ${1} ] && echo "Please input version" && exit 0
version=${1}
originName="markdown-it-attrs"
scopedName="@cnblogs\/markdown-it-attrs"

sed -i "s/\"name\": \"${originName}\"/\"name\": \"${scopedName}\"/" "package.json"

npm version --no-git-tag-version ${version}
npm publish --access public

sed -i "s/\"name\": \"${scopedName}\"/\"name\": \"${originName}\"/" "package.json"
