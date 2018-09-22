#!/usr/bin/env bash

. ./properties.sh

# Start Feign Client Client
echo ">>> START FEIGN SHOP <<<"
java $JMC_ARGS"feign-shop.jfr" -Dserver.port=9091 -jar feign-shop/build/libs/feign-shop-0.0.1-SNAPSHOT.jar
