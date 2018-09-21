package org.ib.spring.feignclient;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;

@FeignClient(name = "beerprovider", fallback = HystrixPizzaServiceFallback.class)
public interface BeerService {
    @RequestMapping(value = "/orderBeer")
    String orderBeer();
}