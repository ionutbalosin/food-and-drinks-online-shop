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

### ToDo

6. Sleuth – distributed tracing via logs
7. Zipkin – distributed tracing system with request visualization.
8. KeyCloak – identity and access management
