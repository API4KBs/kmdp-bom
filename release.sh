#!/bin/bash

mvn versions:set -DnewVersion=$1
mvn versions:update-property -Dproperty=api4kp.version
mvn versions:update-property -Dproperty=kmdp.impl.version
mvn versions:update-property -Dproperty=kmdp.standards.version
mvn versions:update-property -Dproperty=kmdp.archetype.version

