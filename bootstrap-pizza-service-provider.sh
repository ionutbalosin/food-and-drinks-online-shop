#!/usr/bin/env bash

JMC_ARGS="-XX:+UnlockDiagnosticVMOptions -XX:+DebugNonSafepoints -XX:+UnlockCommercialFeatures -XX:+FlightRecorder -XX:StartFlightRecording=delay=1s,duration=99999s,disk=true,filename="

# Start Pizza Service Provider
echo ">>> START PIZZA SERVICE PROVIDER <<<"
java $JMC_ARGS"pizza-service-provider.jfr" -Dserver.port=9081 -jar pizza-service-provider/build/libs/pizza-service-provider-0.0.1-SNAPSHOT.jar
