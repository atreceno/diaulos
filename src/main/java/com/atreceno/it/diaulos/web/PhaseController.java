package com.atreceno.it.diaulos.web;

import com.atreceno.it.diaulos.domain.Phase;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/phases")
@Controller
@RooWebScaffold(path = "phases", formBackingObject = Phase.class)
@RooWebJson(jsonObject = Phase.class)
public class PhaseController {
}
