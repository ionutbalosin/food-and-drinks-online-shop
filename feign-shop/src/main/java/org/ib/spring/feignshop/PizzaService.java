package org.ib.spring.feignshop;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;

@FeignClient(name = "pizzaprovider", fallback = HystrixPizzaServiceFallback.class)
public interface PizzaService {
    @RequestMapping(value = "/orderPizza")
    String orderPizza();
}