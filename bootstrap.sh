#!/usr/bin/env bash

# Start Eureka Service Discovery
echo ">>> START EUREKA SERVICE DISCOVERY <<<"
cd eureka-service-discovery/build/libs
java -jar eureka-service-discovery-0.0.1-SNAPSHOT.jar &
cd ../../..

sleep 15s

# Start ZUUL
echo ">>> START ZUUL GATEWAY <<<"
cd zuul-gateway/build/libs
java -jar zuul-gateway-0.0.1-SNAPSHOT.jar &
cd ../../..

# Start Ist Service Provider
echo ">>> START Ist SERVICE PROVIDER <<<"
cd service-provider-1/build/libs
java -jar service-provider-1-0.0.1-SNAPSHOT.jar -Dserver.port=9081 &
#java -jar service-provider-1-0.0.1-SNAPSHOT.jar -Dserver.port=19081 &
cd ../../..

# Start IInd Service Provider
echo ">>> START IInd SERVICE PROVIDER <<<"
cd service-provider-2/build/libs
java -jar service-provider-2-0.0.1-SNAPSHOT.jar -Dserver.port=9082 &
#java -jar service-provider-2-0.0.1-SNAPSHOT.jar -Dserver.port=19082 &
cd ../../..

# Start Feign Client Client
echo ">>> START FEIGN CLIENT <<<"
cd feign-client/build/libs
java -jar feign-client-0.0.1-SNAPSHOT.jar -Dserver.port=9091 &
cd ../../..

# Start Rest Template Client
echo ">>> START REST TEMPLATE CLIENT <<<"
cd resttemplate-client/build/libs
java -jar resttemplate-client-0.0.1-SNAPSHOT.jar -Dserver.port=9092 &
cd ../../..

