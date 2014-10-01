#!/usr/bin/env sh

# Defines some constants.
DELIM='-------------------'
MASTER="master"

echo "${DELIM}<"

# Builds the documentation using Jekyll
echo "Starting build"
rm -rf out || exit 0
mkdir out
gem install jekyll
jekyll build --destination out
echo "Finished build"

echo ">${DELIM}<"

# Deploys Jekyll build to gh-pages if Travis is on the 'master' branch.
echo "Comparing ${MASTER} to ${TRAVIS_BRANCH}"
if [ "${MASTER}" = "${TRAVIS_BRANCH}" ]; then
	echo "Starting deployment"
	cd out
	git init
	git config user.name "Travis-CI"
	git config user.email "travis@nodemeatspace.com"
	cp ../CNAME ./CNAME
	cp ../countryiso.js ./countryiso.js
	git add .
	git commit -m "Deployed to Github Pages"
	git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1
	echo "Finished deployment"
else
	echo "Not deploying"
fi

echo ">${DELIM}"
