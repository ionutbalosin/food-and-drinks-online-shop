#!/usr/bin/env bash

# Start Eureka Service Discovery
echo ">>> START EUREKA SERVICE DISCOVERY <<<"
cd eureka-service-discovery/build/libs
java -jar eureka-service-discovery-0.0.1-SNAPSHOT.jar &
cd ../../..

# Wait for Eureka to properly start
sleep 15s

# Start ZUUL
echo ">>> START ZUUL GATEWAY <<<"
cd zuul-gateway/build/libs
java -jar zuul-gateway-0.0.1-SNAPSHOT.jar &
cd ../../..

# Start Ist Service Provider
echo ">>> START PIZZA SERVICE PROVIDER <<<"
cd pizza-service-provider/build/libs
java -jar pizza-service-provider-0.0.1-SNAPSHOT.jar -Dserver.port=9081 &
#java -jar pizza-service-provider-0.0.1-SNAPSHOT.jar -Dserver.port=19081 &
cd ../../..

# Start IInd Service Provider
echo ">>> START BEER SERVICE PROVIDER <<<"
cd beer-service-provider/build/libs
java -jar beer-service-provider-0.0.1-SNAPSHOT.jar -Dserver.port=9082 &
#java -jar beer-service-provider-0.0.1-SNAPSHOT.jar -Dserver.port=19082 &
cd ../../..

# Start Feign Client Client
echo ">>> START FEIGN SHOP <<<"
cd feign-client/build/libs
java -jar feign-shop-0.0.1-SNAPSHOT.jar -Dserver.port=9091 &
cd ../../..

# Start Rest Template Client
echo ">>> START REST TEMPLATE SHOP <<<"
cd resttemplate-shop/build/libs
java -jar resttemplate-shop-0.0.1-SNAPSHOT.jar -Dserver.port=9092 &
cd ../../..
