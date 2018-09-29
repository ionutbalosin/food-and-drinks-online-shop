#!/usr/bin/env bash

. ../properties.sh

# Start Beer Service Provider
echo ">>> START BEER SERVICE PROVIDER <<<"
java $JMC_ARGS"beer-service-provider.jfr" -Dserver.port=9082 -jar beer-service-provider/build/libs/beer-service-provider-0.0.1-SNAPSHOT.jar
