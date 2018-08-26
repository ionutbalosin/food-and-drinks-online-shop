package org.ib.spring.eurekaservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class ServiceDiscoveryProvider {

	public static void main(String[] args) {
		SpringApplication.run(ServiceDiscoveryProvider.class, args);
	}
}
