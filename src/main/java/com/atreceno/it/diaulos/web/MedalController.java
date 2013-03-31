package com.atreceno.it.diaulos.web;

import com.atreceno.it.diaulos.domain.Medal;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/medals")
@Controller
@RooWebScaffold(path = "medals", formBackingObject = Medal.class)
@RooWebJson(jsonObject = Medal.class)
public class MedalController {
}
