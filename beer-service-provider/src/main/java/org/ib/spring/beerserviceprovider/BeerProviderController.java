package org.ib.spring.beerserviceprovider;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.Collection;
import java.util.concurrent.ThreadLocalRandom;

@RestController
public class BeerProviderController {

    @RequestMapping(value="/orderBeer", method = RequestMethod.GET)
    String orderBeer() {
        return String.format("[BeerProvider-%d] - %s", ThreadLocalRandom.current().nextInt(), "Heineken");
    }

    @RequestMapping(value="/beerMenu", method = RequestMethod.GET)
    Collection<Beer> getBeerMenu() {
        return Arrays.asList(new Beer("Heineken", "8 Euro"), new Beer("Stella Artois", "8 Euro"));
    }
}
