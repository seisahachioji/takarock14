#!/bin/bash
if [ $TRAVIS_BRANCH != "master" ] ; then
  export DEPLOY_BRANCH="gh-pages-preview"
  export MM_ENV="development"
fi
git clone --quiet --branch $DEPLOY_BRANCH "https://github.com/seisahachioji/takarock14.git" build/
pushd build/
git rm -rf ./*
popd
