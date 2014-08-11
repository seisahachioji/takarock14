#!/bin/bash
pushd build/
git add -A
git commit -m Update
git push --quiet "git@github.com:seisahachioji/takarock14.git" $DEPLOY_BRANCH
popd
