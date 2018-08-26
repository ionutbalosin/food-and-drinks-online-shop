package org.ib.spring.serviceprovider;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient
public class PizzaProviderApplication {
	public static void main(String[] args) {
        SpringApplication.run(PizzaProviderApplication.class, args);
	}
}