package com.atreceno.it.diaulos.web;

import com.atreceno.it.diaulos.domain.Venue;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/venues")
@Controller
@RooWebScaffold(path = "venues", formBackingObject = Venue.class)
@RooWebFinder
@RooWebJson(jsonObject = Venue.class)
public class VenueController {
}
