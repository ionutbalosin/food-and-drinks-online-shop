#!/usr/bin/env bash

. ../properties.sh

# Start ZUUL
echo ">>> START ZUUL GATEWAY <<<"
java $JMC_ARGS"zuul-gateway.jfr" -jar zuul-gateway/build/libs/zuul-gateway-0.0.1-SNAPSHOT.jar
