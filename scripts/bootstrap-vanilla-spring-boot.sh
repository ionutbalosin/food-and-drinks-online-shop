#!/usr/bin/env bash

. ../properties.sh

# Start Vanilla Spring Boot
echo ">>> START VANILLA SPRING BOOT <<<"
java $JMC_ARGS"vanilla-spring-boot.jfr" -Dserver.port=8082 -jar vanilla-spring-boot/build/libs/vanilla-spring-boot-0.0.1-SNAPSHOT.jar
