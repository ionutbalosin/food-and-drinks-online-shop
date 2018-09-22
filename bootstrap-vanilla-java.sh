#!/usr/bin/env bash

. ./properties.sh

# Start Vanilla Java
echo ">>> START VANILLA JAVA <<<"
java $JMC_ARGS"vanilla-java.jfr" -jar vanilla-java/build/libs/vanilla-java-0.0.1-SNAPSHOT.jar
