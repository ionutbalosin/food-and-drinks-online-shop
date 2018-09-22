package org.ib.spring.resttemplateshop;

import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class BeerService {

    @Autowired
    private RestTemplate restTemplate;

    @HystrixCommand(fallbackMethod = "beerFallback")
    public String orderBeer() {
        String results = restTemplate.getForObject("http://beerprovider/orderBeer/", String.class);
        return results;
    }

    public String beerFallback() {
        return "Beer service is not available. Please check again later :(";
    }
}