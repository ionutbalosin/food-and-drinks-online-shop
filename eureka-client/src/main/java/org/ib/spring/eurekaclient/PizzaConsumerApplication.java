package org.ib.spring.eurekaclient;

import com.netflix.appinfo.InstanceInfo;
import com.netflix.discovery.EurekaClient;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.stream.Stream;

@SpringBootApplication
@EnableEurekaClient
public class PizzaConsumerApplication {

	public static void main(String[] args) {
        SpringApplication.run(PizzaConsumerApplication.class, args);
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

@Component
class DiscoveryClientExample implements CommandLineRunner {

    @Autowired
    private DiscoveryClient discoveryClient;

    private static final Log logger = LogFactory.getLog(DiscoveryClientExample.class);

    @Override
    public void run(String... strings) throws Exception {
        logger.info("Providers list :");
        discoveryClient.getInstances("pizzaprovider").forEach((ServiceInstance s) -> {
            logger.info(ToStringBuilder.reflectionToString(s));
        });
    }
}

@Component
class EurekaClientExample implements CommandLineRunner {

    private EurekaClient eurekaClient;

    private static final Log logger = LogFactory.getLog(DiscoveryClientExample.class);

    public EurekaClientExample(EurekaClient eurekaClient) {
        this.eurekaClient = eurekaClient;
    }

    @Override
    public void run(String... strings) {
        logger.info("Providers list :");
        Stream.of(eurekaClient.getNextServerFromEureka("pizzaprovider", false)).forEach( (InstanceInfo i) -> {
            logger.info(i.getHomePageUrl());
        });
    }
}