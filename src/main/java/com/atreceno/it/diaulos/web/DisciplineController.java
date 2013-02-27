package com.atreceno.it.diaulos.web;

import com.atreceno.it.diaulos.domain.Discipline;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/disciplines")
@Controller
@RooWebScaffold(path = "disciplines", formBackingObject = Discipline.class)
@RooWebFinder
@RooWebJson(jsonObject = Discipline.class)
public class DisciplineController {
}
