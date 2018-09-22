package org.ib.spring.resttemplateshop;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class HomePageController {

    @Autowired
    HomePageHelp getHomePageHelp;

    @Autowired
    PizzaService pizzaService;

    @Autowired
    BeerService beerService;

    @RequestMapping("/")
    public String home() {
        Gson gson = new Gson();
        return gson.toJson(getHomePageHelp);
    }

    @RequestMapping("/orderPizza")
    public String orderPizza() {
        return pizzaService.orderPizza();
    }

    @RequestMapping("/orderBeer")
    public String orderBeer() {
        return beerService.orderBeer();
    }
}


class HomePageHelp {
    String description;
    List<EndpointDescription> endpoints;

    public HomePageHelp() {
        this.description = "Home Page Help";
        endpoints = new ArrayList<>();
        endpoints.add(new EndpointDescription("/orderPizza", "to order a pizza"));
        endpoints.add(new EndpointDescription("/orderBeer", "to order a beer"));
    }

}

class EndpointDescription {

    String endpoint;
    String description;

    public EndpointDescription(String endpoint, String description) {
        this.endpoint = endpoint;
        this.description = description;
    }

    public String getEndpoint() {
        return endpoint;
    }

    public String getDescription() {
        return description;
    }
}


