#!/bin/bash

if [[ $TRAVIS_BRANCH == 'gh-pages' ]] ; then
  cd _site
  rm CNAME
  touch README.md
  echo $"# 快速 setup node server\n初始化目录: \`npm init\`\n安装 http server: \`npm install http-server\`\n开启 http server: \`http-server [path] [options]\`" > README.md

  git init

  git config user.name "sayidly"
  git config user.email "herq12315@gmail.com"

  git add .
  git commit -m "Deploy"

  # We redirect any output to
  # /dev/null to hide any sensitive credential data that might otherwise be exposed.
  git push --force --quiet "https://${git_user}:${git_password}@${git_target}" master:master > /dev/null 2>&1
else
  echo 'Invalid branch. You can only deploy from gh-pages.'
  exit 1
fi