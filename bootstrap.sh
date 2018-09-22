#!/usr/bin/env bash

JMC_ARGS="-XX:+UnlockDiagnosticVMOptions -XX:+DebugNonSafepoints -XX:+UnlockCommercialFeatures -XX:+FlightRecorder -XX:StartFlightRecording=delay=1s,duration=99999s,disk=true,filename="

# Start Eureka Service Discovery
echo ">>> START EUREKA SERVICE DISCOVERY <<<"
cd eureka-service-discovery/build/libs
java $JMC_ARGS"eureka-service-discovery.jfr" -jar eureka-service-discovery-0.0.1-SNAPSHOT.jar &
cd ../../..

# Wait for Eureka Service Discovery to properly start
sleep 15s

# Start ZUUL
echo ">>> START ZUUL GATEWAY <<<"
cd zuul-gateway/build/libs
java $JMC_ARGS"zuul-gateway.jfr" -jar zuul-gateway-0.0.1-SNAPSHOT.jar &
cd ../../..

# Start Ist Service Provider
echo ">>> START PIZZA SERVICE PROVIDER <<<"
cd pizza-service-provider/build/libs
java $JMC_ARGS"pizza-service-provider.jfr" -jar pizza-service-provider-0.0.1-SNAPSHOT.jar -Dserver.port=9081 &
#java -jar pizza-service-provider-0.0.1-SNAPSHOT.jar -Dserver.port=19081 &
cd ../../..

# Start IInd Service Provider
echo ">>> START BEER SERVICE PROVIDER <<<"
cd beer-service-provider/build/libs
java $JMC_ARGS"beer-service-provider.jfr" -jar beer-service-provider-0.0.1-SNAPSHOT.jar -Dserver.port=9082 &
#java -jar beer-service-provider-0.0.1-SNAPSHOT.jar -Dserver.port=19082 &
cd ../../..

# Start Feign Client Client
echo ">>> START FEIGN SHOP <<<"
cd feign-shop/build/libs
java $JMC_ARGS"feign-shop.jfr" -jar feign-shop-0.0.1-SNAPSHOT.jar -Dserver.port=9091 &
cd ../../..

# Start Rest Template Client
echo ">>> START REST TEMPLATE SHOP <<<"
cd resttemplate-shop/build/libs
java $JMC_ARGS"resttemplate-shop.jfr" -jar resttemplate-shop-0.0.1-SNAPSHOT.jar -Dserver.port=9092 &
cd ../../..
