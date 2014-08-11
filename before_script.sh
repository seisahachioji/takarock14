#!/bin/bash
git clone --quiet --branch $DEPLOY_BRANCH "https://github.com/seisahachioji/takarock14.git" build/
pushd build/
git pull --quiet -u origin $DEPLOY_BRANCH
git rm -rf ./*
popd
