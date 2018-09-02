package org.ib.spring.serviceprovider2;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.Collection;

@RestController
public class BeerProviderController {

    @RequestMapping(value="/orderBeer", method = RequestMethod.GET)
    String orderPizza() {
        return "[BeerProvider- " + Thread.currentThread() + "] Heineken";
    }

    @RequestMapping(value="/beerMenu", method = RequestMethod.GET)
    Collection<Beer> getPizzaMenu() {
        return Arrays.asList(new Beer("Heineken", "8 Euro"), new Beer("Stella Artois", "8 Euro"));
    }
}
