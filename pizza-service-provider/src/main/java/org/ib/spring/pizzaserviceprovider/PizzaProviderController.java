package org.ib.spring.pizzaserviceprovider;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.Collection;

@RestController
public class PizzaProviderController {

    @RequestMapping(value="/orderPizza", method = RequestMethod.GET)
    String orderPizza() {
        return "[PizzaProvider- " + Thread.currentThread() + "] Pepperonni";
    }

    @RequestMapping(value="/pizzaMenu", method = RequestMethod.GET)
    Collection<Pizza> getPizzaMenu() {
        return Arrays.asList(new Pizza("Pepperonni", "8 Euro"), new Pizza("Quatro Stagioni", "8 Euro"));
    }
}
