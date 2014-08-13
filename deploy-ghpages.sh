#!/usr/bin/env sh

# Colours
DELIM='-------------------'

# Build
echo "${DELIM}Starting build${DELIM}"
rm -rf out || exit 0
mkdir out
gem install jekyll
jekyll build --destination out
echo "${DELIM}Finished build${DELIM}"

# Deploy if on master branch
echo "${DELIM}Starting deployment${DELIM}"
cd out
git init
git config user.name "Travis-CI"
git config user.email "travis@nodemeatspace.com"
cp ../CNAME ./CNAME
cp ../countryiso.js ./countryiso.js
git add .
git commit -m "Deployed to Github Pages"
git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1
echo "${DELIM}Finished deployment${DELIM}"
