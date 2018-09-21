package org.ib.spring.feignclient;

public class HystrixBeerServiceFallback implements BeerService {

    @Override
    public String orderBeer() {
        return "Beer service is not available. Please check again later :(";
    }
}
