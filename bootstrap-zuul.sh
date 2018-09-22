#!/usr/bin/env bash

JMC_ARGS="-XX:+UnlockDiagnosticVMOptions -XX:+DebugNonSafepoints -XX:+UnlockCommercialFeatures -XX:+FlightRecorder -XX:StartFlightRecording=delay=1s,duration=99999s,disk=true,filename="

# Start ZUUL
echo ">>> START ZUUL GATEWAY <<<"
java $JMC_ARGS"zuul-gateway.jfr" -jar zuul-gateway/build/libs/zuul-gateway-0.0.1-SNAPSHOT.jar
