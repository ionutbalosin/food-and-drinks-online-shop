package org.ib.spring.feignshop;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;

@FeignClient(name = "beerprovider", fallback = HystrixBeerServiceFallback.class)
public interface BeerService {
    @RequestMapping(value = "/orderBeer")
    String orderBeer();
}