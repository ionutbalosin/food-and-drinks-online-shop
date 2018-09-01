package org.ib.spring.feignclient;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@FeignClient(name = "feignclient", url = "http://serviceprovider")
public interface OrderPizzaController {
    @RequestMapping(method = RequestMethod.GET, value = "/orderPizza")
    String orderPizza();
}