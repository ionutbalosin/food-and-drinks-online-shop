#!/usr/bin/env bash

. ../properties.sh

### 2. BOOTSTRAP-ING ALL JVMs ###

bootstrap-eureka-service-discovery.sh &
# Wait for Eureka Service Discovery to properly start
sleep 15s

bootstrap-zuul-gateway.sh &
bootstrap-pizza-service-provider.sh &
bootstrap-beer-service-provider.sh &
bootstrap-feign-shop.sh &
bootstrap-resttemplate-shop.sh &
bootstrap-vanilla-java.sh &
bootstrap-vanilla-spring-boot.sh &

### 2. TEST-ING ###
$ ./ab.exe -n 10000 -c 10 -l http://localhost:8771/feignshop/orderPizza/
$ ./ab.exe -n 10000 -c 10 -l http://localhost:8771/feignshop/orderBeer/

$ ./ab.exe -n 10000 -c 10 -l http://localhost:8771/resttemplateshop/orderPizza/
$ ./ab.exe -n 10000 -c 10 -l http://localhost:8771/resttemplateshop/orderBeer/

### POSSIBLE REQUESTS TYPES ###

### ZUUL -> FEIGN SHOP -> PIZZA/BEER PROVIDER SERVICE
### http://localhost:8771/feignshop/orderPizza/
### http://localhost:8771/feignshop/orderBeer/

### ZUUL -> REST TEMPLATE SHOP -> PIZZA/BEER PROVIDER SERVICE
### http://localhost:8771/resttemplateshop/orderPizza/
### http://localhost:8771/resttemplateshop/orderBeer/

### FEIGN SHOP -> PIZZA/BEER PROVIDER SERVICE
### http://localhost:9091/orderPizza
### http://localhost:9091/orderBeer

### REST TEMPLATE SHOP -> PIZZA/BEER PROVIDER SERVICE
### http://localhost:9092/orderPizza
### http://localhost:9092/orderBeer

### ZUUL -> PIZZA/BEER PROVIDER SERVICE (bypassing the shops)
### http://localhost:8771/pizzaprovider/orderPizza/
### http://localhost:8771/beerprovider/orderBeer/
