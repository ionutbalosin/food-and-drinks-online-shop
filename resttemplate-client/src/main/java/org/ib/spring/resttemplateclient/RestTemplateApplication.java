package org.ib.spring.resttemplateclient;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
@EnableEurekaClient
@EnableCircuitBreaker
public class RestTemplateApplication {

	public static void main(String[] args) {
        SpringApplication.run(RestTemplateApplication.class, args);
	}

	// NB: Use @LoadBalanced annotation if you rely on Eureka service discovery! Otherwise it does not work!
    @Bean
    @LoadBalanced
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }

    @Bean
    public HomePageHelp getHomePageHelp(){
        return new HomePageHelp();
    }
}
