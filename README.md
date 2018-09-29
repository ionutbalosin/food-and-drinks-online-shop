## Food And Drinks Online Shop

### Description

This project is supposed to be a network of Clients (i.e. food and drinks Consumers) and Producers (i.e. food and drinks Producers), where Clients ask for pizza and beer and the orders are provided by the Producers.
The entire communication is based on REST calls.

### Technical Details

1. Service Discovery for loosely coupling the Clients and Producers
2. Load Balancing for properly dispatching the Clients' orders to Producers

### Technology Stack

1. Zuul –  gateway service that provides dynamic routing, monitoring, resiliency, security, and more
2. Ribbon – client side load balancer
3. Feign – declarative REST client
4. RestTemplate – REST client
5. Eureka – service registration and discovery

### Build

```
$ ./gradlew clean build
```

### Run

```
$ cd scripts/
$ ./bootstrap-service.sh <GROUP_ID> <VERSION> <PORT> [useJMC]
$ ./bootstrap-service.sh <GROUP_ID> <VERSION> <PORT> [true||false]
```

Examples of starting all services with Java Mission Control (JMC) as optional parameter:
```
$ ./bootstrap-service.sh eureka-service-discovery 0.0.1-SNAPSHOT 8761 [true||false]"
$ ./bootstrap-service.sh zuul-gateway 0.0.1-SNAPSHOT 8771 [true||false]"
$ ./bootstrap-service.sh pizza-service-provider 0.0.1-SNAPSHOT 9081 [true||false]"
$ ./bootstrap-service.sh beer-service-provider 0.0.1-SNAPSHOT 9082 [true||false]"
$ ./bootstrap-service.sh feign-shop 0.0.1-SNAPSHOT 9091 [true||false]"
$ ./bootstrap-service.sh resttemplate-shop 0.0.1-SNAPSHOT 9092 [true||false]"
```

Please make sure the **eureka-service-discovery** is started first!

### Smoke Test

For checking the metrics, open a browser and check below URLs:
+ http://localhost:8761/actuator
    - to access eureka-service-discovery service
+ http://localhost:8771/actuator
    - to access zuul-gateway service
+ http://localhost:9081/actuator
    - to access pizza-service-provider service
+ http://localhost:9082/actuator
    - to access beer-service-provider service
+ http://localhost:9091/actuator
    - to access feign-shop service
+ http://localhost:9092/actuator
    - to access resttemplate-shop service

To send real requests across micro-services, open a browser and check below URLs:
+ http://localhost:9081/providePizza
    - request route: pizza-service-provider
+ http://localhost:9091/orderPizza
    - request route: feign-shop -> pizza-service-provider
+ http://localhost:8771/feignshop/orderPizza/
    - request route: zuul-gateway -> feign-shop -> pizza-service-provider
    
Please use analogous URLs for **beer-service-provider** and **resttemplate-shop** services!

### Load Test

#### Pre-requisites

1. please install **ab - Apache HTTP server benchmarking tool**
2. make sure all services are started!

#### WarmUp

Open a shell terminal and launch below command (i.e. 1000 total requests / 4 concurrent):
```
$ cd <ab_http_path>/bin
$ ./ab.exe -n 1000 -c 4 -l http://localhost:8771/feignshop/orderPizza/
```

#### Real Measurements

Launch below command (i.e. 5000 total requests / 4 concurrent):
```
$ ./ab.exe -n 5000 -c 4 -l http://localhost:8771/feignshop/orderPizza/
```

### ToDo

1. Docker - Docker-ize all services
2. Tracing
    - Sleuth – distributed tracing via logs
    - Zipkin – distributed tracing system with request visualization.
3. Monitoring
    - Prometheus
    - Grafana
    - Kibana
4. Security
    - KeyCloak – identity and access management
