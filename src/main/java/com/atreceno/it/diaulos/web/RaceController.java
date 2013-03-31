package com.atreceno.it.diaulos.web;

import com.atreceno.it.diaulos.domain.Race;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/races")
@Controller
@RooWebScaffold(path = "races", formBackingObject = Race.class)
@RooWebJson(jsonObject = Race.class)
public class RaceController {
}
