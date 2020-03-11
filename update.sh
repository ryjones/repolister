#!/bin/bash
set -ex
./repo_list hyperledger
./repo_list hyperledger-labs
RC=`git diff HEAD | wc -l | awk '{print $1}'`
if [ "$RC" != "0" ]
then
  git add *json
  git commit -s -m "Update repos"
  git push origin master
else
  echo No Updates.
fi
