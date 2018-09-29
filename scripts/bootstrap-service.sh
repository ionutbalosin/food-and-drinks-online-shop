#!/usr/bin/env bash

if [[ "$#" -lt 2 ]] ; then
    echo "Usage: ./bootstrap-service.sh GROUP_ID VERSION PORT [useJMC]"
    echo "  Examples:"
    echo "     ./bootstrap-service.sh eureka-service-discovery 0.0.1-SNAPSHOT 8761 [true||false]"
    echo "     ./bootstrap-service.sh zuul-gateway 0.0.1-SNAPSHOT 8771 [true||false]"
    echo "     ./bootstrap-service.sh pizza-service-provider 0.0.1-SNAPSHOT 9081 [true||false]"
    echo "     ./bootstrap-service.sh beer-service-provider 0.0.1-SNAPSHOT 9082 [true||false]"
    echo "     ./bootstrap-service.sh feign-shop 0.0.1-SNAPSHOT 9091 [true||false]"
    echo "     ./bootstrap-service.sh resttemplate-shop 0.0.1-SNAPSHOT 9092 [true||false]"
    return
fi

GROUP_ID=$1
VERSION=$2
PORT=$3

if [[ "$4" ==  "true" ]] ; then
     timestamp=`date "+%Y%m%d-%H%M%S"`
     JMC_ARGS="-XX:+UnlockDiagnosticVMOptions -XX:+DebugNonSafepoints -XX:+UnlockCommercialFeatures -XX:+FlightRecorder -XX:FlightRecorderOptions=stackdepth=1024 -XX:StartFlightRecording=delay=1s,duration=99999s,disk=true,filename="$GROUP_ID"-$timestamp.jfr"
 else
     JMC_ARGS=""
 fi

echo "*************************************"
echo "GROUP_ID = "$GROUP_ID
echo "VERSION = "$VERSION
echo "PORT = "$PORT
echo "JMC_ARGS = "$JMC_ARGS
echo "JAVA_HOME = "$JAVA_HOME
echo "*************************************"

echo ">>> START $GROUP_ID:$VERSION SERVICE <<<"
java $JMC_ARGS -Dserver.port=$PORT -jar ../$GROUP_ID/build/libs/$GROUP_ID-$VERSION.jar