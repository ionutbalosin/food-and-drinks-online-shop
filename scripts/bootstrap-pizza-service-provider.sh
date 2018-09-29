#!/usr/bin/env bash

. ../properties.sh

# Start Pizza Service Provider
echo ">>> START PIZZA SERVICE PROVIDER <<<"
java $JMC_ARGS"pizza-service-provider.jfr" -Dserver.port=9081 -jar pizza-service-provider/build/libs/pizza-service-provider-0.0.1-SNAPSHOT.jar
