package org.ib.spring.resttemplateclient;

import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class PizzaService {

    @Autowired
    private RestTemplate restTemplate;

    @HystrixCommand(fallbackMethod = "reliable")
    public String orderPizza() {
        String results = restTemplate.getForObject("http://pizzaprovider/orderPizza/", String.class);
        return results;
    }

    public String reliable() {
        return "Pizza service is not available. Please check again later :(";
    }
}