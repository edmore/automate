#! /bin/bash

echo Initializing $1 ...
touch README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:edmore/$1.git
git push -u origin master