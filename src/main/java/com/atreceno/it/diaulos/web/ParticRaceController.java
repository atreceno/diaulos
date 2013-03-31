package com.atreceno.it.diaulos.web;

import com.atreceno.it.diaulos.domain.ParticRace;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/particraces")
@Controller
@RooWebScaffold(path = "particraces", formBackingObject = ParticRace.class)
@RooWebJson(jsonObject = ParticRace.class)
public class ParticRaceController {
}
