package org.ib.spring.feignshop;

public class HystrixPizzaServiceFallback implements PizzaService {

    @Override
    public String providePizza() {
        return "Pizza service is not available. Please check again later :(";
    }
}
