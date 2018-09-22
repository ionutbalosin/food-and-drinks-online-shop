#!/usr/bin/env bash

JMC_ARGS="-XX:+UnlockDiagnosticVMOptions -XX:+DebugNonSafepoints -XX:+UnlockCommercialFeatures -XX:+FlightRecorder -XX:StartFlightRecording=delay=1s,duration=99999s,disk=true,filename="

# Start Rest Template Client
echo ">>> START REST TEMPLATE SHOP <<<"
java $JMC_ARGS"resttemplate-shop.jfr" -Dserver.port=9092 -jar resttemplate-shop/build/libs/resttemplate-shop-0.0.1-SNAPSHOT.jar