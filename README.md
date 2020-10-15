# KMDP BOM - Bill of Materials

[![Build Status](https://travis-ci.com/API4KBs/kmdp-bom.svg?branch=master)](https://travis-ci.com/API4KBs/kmdp-bom)
[![Download](https://api.bintray.com/packages/api4kbs/API4KP-Mvn-Repo/kmdp-bom/images/download.svg)](https://bintray.com/api4kbs/API4KP-Mvn-Repo/kmdp-bom/_latestVersion)

API for Knowledge Platforms (API4KP) Reference Implementation 

Please checkout the official [Release Notes](./release-notes.md)!

## Getting Started

- **Bill of Materials** are used in a large scale projects with dozens or hundreds of dependencies, chances are multiple of them use something common internally by transitive dependencies
- Maven **Project Object Model (POM)** is an XML file that contains information and configurations (about the project) that are used by Maven to import dependencies and to build the project
- A BOM is a special kind of POM that is used to control the versions of a project’s dependencies and provide a central place to define and update those versions

## Maven Dependency Management

Please check out how Maven handles dependency management [Here](https://maven.apache.org/guides/introduction/introduction-to-dependency-mechanism.html)

> Dependency Management allows to consolidate and centralize the management of dependency versions without adding dependencies which are inherited by all children

The pom file in this project describes a lot of dependencies in dependency management section:

``` xml
<dependencyManagement>
    <dependencies>
        <dependency>
            <groupId>group-a</groupId>
            <artifactId>artifact-a</artifactId>
            <version>1.0.0-SNAPSHOT</version>
        </dependency>
        <dependency>
            <groupId>group-b</groupId>
            <artifactId>artifact-b</artifactId>
            <version>1.0.0-SNAPSHOT</version>
        </dependency>
    </dependencies>
</dependencyManagement>
```

## Release Instructions

Affected variables:
* project.version (SELF)
* properties
  * api4kp.version
  * kmdp.impl.version
  * kmdp.standards.version
  * kmdp.archetype.version

### Release Branch

1. Set all affected variables to a known semantic version 
2. Run ``` mvn validate -Prelease ``` to enforce validation rules

### Nex Develop Branch

1. Set project.version to the next minor version: V + 0.0.1 with -SNAPSHOT
