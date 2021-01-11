#!/bin/bash

mvn test-compile -DskipTests=true -Dmaven.javadoc.skip=true -B -V
mvn clean test cobertura:cobertura jacoco:report coveralls:report -DserviceName="github-actions" -DserviceBuildNumber="$COVERALLS_BUILD_NUMBER"
