package org.ib.spring.pizzaserviceprovider;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.Collection;
import java.util.concurrent.ThreadLocalRandom;

@RestController
public class PizzaProviderController {

    @RequestMapping(value="/providePizza", method = RequestMethod.GET)
    String orderPizza() {
        return String.format("[%s][ResponseId-%d]-%s", Thread.currentThread().getName(), ThreadLocalRandom.current().nextInt(Integer.MAX_VALUE), "Capricciosa");
    }

    @RequestMapping(value="/pizzaMenu", method = RequestMethod.GET)
    Collection<Pizza> getPizzaMenu() {
        return Arrays.asList(new Pizza("Pepperonni", "8 Euro"), new Pizza("Quatro Stagioni", "8 Euro"));
    }
}
