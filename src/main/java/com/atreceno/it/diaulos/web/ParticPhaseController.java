package com.atreceno.it.diaulos.web;

import com.atreceno.it.diaulos.domain.ParticPhase;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/particphases")
@Controller
@RooWebScaffold(path = "particphases", formBackingObject = ParticPhase.class)
@RooWebJson(jsonObject = ParticPhase.class)
public class ParticPhaseController {
}
