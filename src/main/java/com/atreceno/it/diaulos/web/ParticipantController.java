package com.atreceno.it.diaulos.web;

import java.util.Arrays;

import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atreceno.it.diaulos.domain.Country;
import com.atreceno.it.diaulos.domain.Participant;
import com.atreceno.it.diaulos.reference.Gender;

@RequestMapping("/participants")
@Controller
@RooWebScaffold(path = "participants", formBackingObject = Participant.class)
@RooWebJson(jsonObject = Participant.class)
public class ParticipantController {

	void populateEditForm(Model uiModel, Participant participant) {
		uiModel.addAttribute("participant", participant);
		addDateTimeFormatPatterns(uiModel);
		uiModel.addAttribute("countrys", Country.findAllCountrys());
//		uiModel.addAttribute("particevents", particEventService.findAllParticEvents());
//		uiModel.addAttribute("particlaps", particLapService.findAllParticLaps());
//		uiModel.addAttribute("particphases", particPhaseService.findAllParticPhases());
//		uiModel.addAttribute("particraces", particRaceService.findAllParticRaces());
		uiModel.addAttribute("genders", Arrays.asList(Gender.values()));
	}
}
