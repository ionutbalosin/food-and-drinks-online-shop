package org.ib.spring.feignclient;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
@EnableEurekaClient
@EnableFeignClients
public class FeignClientApplication {

	public static void main(String[] args) {
        SpringApplication.run(FeignClientApplication.class, args);
	}

    @Bean
    public HomePageHelp getHomePageHelp(){
        return new HomePageHelp();
    }
}
