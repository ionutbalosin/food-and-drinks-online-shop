## Food And Drinks Online Shop

### Description

This project is supposed to be a network of Clients (i.e. food and drinks Consumers) and Producers (i.e. food and drinks Producers), where Clients ask for pizza and beer and the orders are provided by the Producers.
The entire communication is based on REST calls.

### Technical Details

Service Discovery for loosely coupling the Clients and Producers
Load Balancing for properly dispatching the Clients' orders to Producers

### Technology Stack

Spring Cloud (Eureka, FeignClient, Ribbon)
Spring Boot (RestTemplate)
Gradle
