package com.atreceno.it.diaulos.web;

import com.atreceno.it.diaulos.domain.Discipline;
import com.atreceno.it.diaulos.domain.Event;
import com.atreceno.it.diaulos.domain.EventGender;
import java.util.ArrayList;
import java.util.List;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/events")
@Controller
@RooWebScaffold(path = "events", formBackingObject = Event.class)
@RooWebFinder
public class EventController {

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new Event());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (Discipline.countDisciplines() == 0) {
            dependencies.add(new String[] { "discipline", "disciplines" });
        }
        if (EventGender.countEventGenders() == 0) {
            dependencies.add(new String[] { "eventgender", "eventgenders" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "events/create";
    }
}
