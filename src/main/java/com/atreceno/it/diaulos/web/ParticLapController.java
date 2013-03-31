package com.atreceno.it.diaulos.web;

import com.atreceno.it.diaulos.domain.ParticLap;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/particlaps")
@Controller
@RooWebScaffold(path = "particlaps", formBackingObject = ParticLap.class)
@RooWebJson(jsonObject = ParticLap.class)
public class ParticLapController {
}
