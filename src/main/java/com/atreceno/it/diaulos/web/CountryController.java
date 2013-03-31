package com.atreceno.it.diaulos.web;

import com.atreceno.it.diaulos.domain.Country;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/countrys")
@Controller
@RooWebScaffold(path = "countrys", formBackingObject = Country.class)
@RooWebFinder
@RooWebJson(jsonObject = Country.class)
public class CountryController {
}
