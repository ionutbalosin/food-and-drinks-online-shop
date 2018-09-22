#!/usr/bin/env bash

JMC_ARGS="-XX:+UnlockDiagnosticVMOptions -XX:+DebugNonSafepoints -XX:+UnlockCommercialFeatures -XX:+FlightRecorder -XX:StartFlightRecording=delay=1s,duration=99999s,disk=true,filename="

# Start Eureka Service Discovery
echo ">>> START EUREKA SERVICE DISCOVERY <<<"
java $JMC_ARGS"eureka-service-discovery.jfr" -jar eureka-service-discovery/build/libs/eureka-service-discovery-0.0.1-SNAPSHOT.jar
