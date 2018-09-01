package org.ib.spring.feignclient;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class OrderPizzaController {

    @Autowired
    private RestTemplate restTemplate;

    @RequestMapping(path = "/orderPizza")
    public String orderPizza() {
        String results = restTemplate.getForObject("http://serviceprovider/orderPizza/", String.class);
        return results;
    }

    @RequestMapping(path = "/orderBeer")
    public String orderBeer() {
        String results = restTemplate.getForObject("http://serviceprovider/orderPizza/", String.class);
        return results;
    }
}