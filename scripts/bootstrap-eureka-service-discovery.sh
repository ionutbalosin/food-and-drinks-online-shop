#!/usr/bin/env bash

. ../properties.sh

# Start Eureka Service Discovery
echo ">>> START EUREKA SERVICE DISCOVERY <<<"
java $JMC_ARGS"eureka-service-discovery.jfr" -jar eureka-service-discovery/build/libs/eureka-service-discovery-0.0.1-SNAPSHOT.jar
