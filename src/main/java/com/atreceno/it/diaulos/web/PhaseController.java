package com.atreceno.it.diaulos.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atreceno.it.diaulos.domain.Phase;
import com.atreceno.it.diaulos.service.EventService;

@RequestMapping("/phases")
@Controller
@RooWebScaffold(path = "phases", formBackingObject = Phase.class)
@RooWebJson(jsonObject = Phase.class)
public class PhaseController {

	@Autowired
	EventService eventService;

	void populateEditForm(Model uiModel, Phase phase) {
		uiModel.addAttribute("phase", phase);
		uiModel.addAttribute("events", eventService.findAllEvents());
//		uiModel.addAttribute("particphases", particPhaseService.findAllParticPhases());
//		uiModel.addAttribute("races", raceService.findAllRaces());
	}

}
