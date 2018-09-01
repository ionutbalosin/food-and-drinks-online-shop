package org.ib.spring.resttemplateclient;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class OrderPizzaController {

    @Autowired
    private RestTemplate restTemplate;

    @RequestMapping("/orderPizza")
    public String orderPizza() {
        String results = restTemplate.getForObject("http://pizzaprovider/orderPizza/", String.class);
        return results;
    }
}