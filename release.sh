#!/bin/bash
set -x #echo on

##################################################
#### Verify

if [ "$#" -ne 3 ]; then
    echo "Usage ./release.sh {release_version} {api4kp_version} {next_version}"
    exit 2
fi

# Ensure to be on the develop branch
git checkout develop

##################################################
#### Release

# Prepare release branch
git checkout -b "rel_$1"

# Apply all necesssary version changes/fixtures
mvn versions:set -DnewVersion=$1
mvn versions:set-property -Dproperty=api4kp.version -DnewVersion=$2
mvn versions:set-property -Dproperty=kmdp.impl.version -DnewVersion=$1
mvn versions:set-property -Dproperty=kmdp.standards.version -DnewVersion=$1
mvn versions:set-property -Dproperty=kmdp.archetype.version -DnewVersion=$1

# Ensure it builds!
mvn clean install -Prelease #-Dmaven.local.repo=../repo
if [[ "$?" -ne 0 ]] ; then
  mvn versions:revert
  git checkout develop
  git branch -d "rel_$1"
  echo 'release failed';
  exit -1
fi

# Commit changes
git commit -am "Candidate release $1"

##################################################
#### Rebase

# Rebase to ensure continuity
git checkout develop
git rebase "rel_$1"

##################################################
#### Move on

# Revert all necesssary version changes/fixtures
mvn versions:set -DnewVersion=$3
mvn versions:set-property -Dproperty=api4kp.version -DnewVersion="[$2,)"
mvn versions:set-property -Dproperty=kmdp.impl.version -DnewVersion="[$1,)"
mvn versions:set-property -Dproperty=kmdp.standards.version -DnewVersion="[$1,)"
mvn versions:set-property -Dproperty=kmdp.archetype.version -DnewVersion="[$1,)"

# Commit changes
git commit -am "Start version $3+"