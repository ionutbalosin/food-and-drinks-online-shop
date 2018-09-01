package org.ib.spring.feignclient;

public class HystrixPizzaServiceFallback implements PizzaService {

    @Override
    public String orderPizza() {
        return "Pizza service is not available. Please check again later :(";
    }
}
