#!/usr/bin/env bash

. ./properties.sh

# Start Rest Template Client
echo ">>> START REST TEMPLATE SHOP <<<"
java $JMC_ARGS"resttemplate-shop.jfr" -Dserver.port=9092 -jar resttemplate-shop/build/libs/resttemplate-shop-0.0.1-SNAPSHOT.jar
