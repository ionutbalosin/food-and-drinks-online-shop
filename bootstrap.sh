#!/usr/bin/env bash

### 2. BOOTSTRAP-ING ###

./bootstrap-eureka.sh
# Wait for Eureka Service Discovery to properly start
sleep 15s
./bootstrap-zuul.sh
./bootstrap-pizza-service-provider.sh
./bootstrap-beer-service-provider.sh
./bootstrap-feign-shop.sh
./bootstrap-resttemplate-shop.sh

### 2. TEST-ING ###
$ ./ab.exe -n 1000 -c 10 -l http://localhost:9091/orderPizza

$ ./ab.exe -n 1000 -c 10 -l http://localhost:9091/orderBeer

