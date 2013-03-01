package com.atreceno.it.diaulos.web;

import com.atreceno.it.diaulos.domain.Competition;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/competitions")
@Controller
@RooWebScaffold(path = "competitions", formBackingObject = Competition.class)
public class CompetitionController {
}
