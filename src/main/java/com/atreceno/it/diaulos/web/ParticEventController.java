package com.atreceno.it.diaulos.web;

import com.atreceno.it.diaulos.domain.ParticEvent;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/particevents")
@Controller
@RooWebScaffold(path = "particevents", formBackingObject = ParticEvent.class)
@RooWebJson(jsonObject = ParticEvent.class)
public class ParticEventController {
}
