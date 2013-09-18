package com.atreceno.it.diaulos.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atreceno.it.diaulos.domain.Race;
import com.atreceno.it.diaulos.domain.Venue;
import com.atreceno.it.diaulos.service.PhaseService;

@RequestMapping("/races")
@Controller
@RooWebScaffold(path = "races", formBackingObject = Race.class)
@RooWebJson(jsonObject = Race.class)
public class RaceController {

	@Autowired
	PhaseService phaseService;
	
	void populateEditForm(Model uiModel, Race race) {
		uiModel.addAttribute("race", race);
		addDateTimeFormatPatterns(uiModel);
//		uiModel.addAttribute("laps", lapService.findAllLaps());
//		uiModel.addAttribute("particraces", particRaceService.findAllParticRaces());
		uiModel.addAttribute("phases", phaseService.findAllPhases());
		uiModel.addAttribute("venues", Venue.findAllVenues());
	}

}
