package com.atreceno.it.diaulos.web;

import com.atreceno.it.diaulos.domain.Sport;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/sports")
@Controller
@RooWebScaffold(path = "sports", formBackingObject = Sport.class)
@RooWebFinder
@RooWebJson(jsonObject = Sport.class)
public class SportController {
}
