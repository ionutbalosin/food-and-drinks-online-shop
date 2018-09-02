package org.ib.spring.serviceprovider2;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient
public class BeerProviderApplication {
	public static void main(String[] args) {
        SpringApplication.run(BeerProviderApplication.class, args);
	}
}