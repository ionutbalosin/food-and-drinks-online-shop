#!/usr/bin/env bash

JMC_ARGS="-XX:+UnlockDiagnosticVMOptions -XX:+DebugNonSafepoints -XX:+UnlockCommercialFeatures -XX:+FlightRecorder -XX:StartFlightRecording=delay=1s,duration=99999s,disk=true,filename="

# Start Beer Service Provider
echo ">>> START BEER SERVICE PROVIDER <<<"
java $JMC_ARGS"beer-service-provider.jfr" -Dserver.port=9082 -jar beer-service-provider/build/libs/beer-service-provider-0.0.1-SNAPSHOT.jar
