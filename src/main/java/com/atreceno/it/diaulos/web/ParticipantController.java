package com.atreceno.it.diaulos.web;

import com.atreceno.it.diaulos.domain.Participant;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/participants")
@Controller
@RooWebScaffold(path = "participants", formBackingObject = Participant.class)
@RooWebJson(jsonObject = Participant.class)
public class ParticipantController {
}
