package org.ib.spring.feignshop;

public class HystrixBeerServiceFallback implements BeerService {

    @Override
    public String provideBeer() {
        return "Beer service is not available. Please check again later :(";
    }
}
