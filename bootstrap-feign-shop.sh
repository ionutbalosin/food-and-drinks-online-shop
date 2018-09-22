#!/usr/bin/env bash

JMC_ARGS="-XX:+UnlockDiagnosticVMOptions -XX:+DebugNonSafepoints -XX:+UnlockCommercialFeatures -XX:+FlightRecorder -XX:StartFlightRecording=delay=1s,duration=99999s,disk=true,filename="

# Start Feign Client Client
echo ">>> START FEIGN SHOP <<<"
java $JMC_ARGS"feign-shop.jfr" -Dserver.port=9091 -jar feign-shop/build/libs/feign-shop-0.0.1-SNAPSHOT.jar
