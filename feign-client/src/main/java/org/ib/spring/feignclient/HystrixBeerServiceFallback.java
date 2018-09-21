package org.ib.spring.feignclient;

public class HystrixBeerServiceFallback implements PizzaService {

    @Override
    public String orderPizza() {
        return "Beer service is not available. Please check again later :(";
    }
}
