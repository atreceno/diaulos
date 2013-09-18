package com.atreceno.it.diaulos.web;

import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atreceno.it.diaulos.domain.Event;
import com.atreceno.it.diaulos.domain.EventGender;
import com.atreceno.it.diaulos.domain.Sport;

@RequestMapping("/events")
@Controller
@RooWebScaffold(path = "events", formBackingObject = Event.class)
@RooWebJson(jsonObject = Event.class)
public class EventController {

    void populateEditForm(Model uiModel, Event event) {
        uiModel.addAttribute("event", event);
        uiModel.addAttribute("eventgenders", EventGender.findAllEventGenders());
//        uiModel.addAttribute("particevents", particEventService.findAllParticEvents());
//        uiModel.addAttribute("phases", phaseService.findAllPhases());
        uiModel.addAttribute("sports", Sport.findAllSports());
    }
    
}
