package com.atreceno.it.diaulos.web;

import com.atreceno.it.diaulos.domain.EventGender;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/eventgenders")
@Controller
@RooWebScaffold(path = "eventgenders", formBackingObject = EventGender.class)
public class EventGenderController {
}
