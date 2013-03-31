package com.atreceno.it.diaulos.web;

import com.atreceno.it.diaulos.domain.Lap;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/laps")
@Controller
@RooWebScaffold(path = "laps", formBackingObject = Lap.class)
@RooWebJson(jsonObject = Lap.class)
public class LapController {
}
