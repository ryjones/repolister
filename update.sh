#!/bin/bash
set -ex
./repo_list hyperledger
./repo_list hyperledger-archives
./repo_list hyperledger-labs
./repo_list hyperledger-labs-archives
find . -type f -size 0 -delete
RC=`git diff HEAD hyperledger-*repos*.json | wc -l | awk '{print $1}'`
if [ "$RC" != "0" ]
then
  git add hyperledger-*repos*.json
  git commit -s -m "Update repos"
  git push origin default
else
  echo No Updates.
fi
