package com.atreceno.it.diaulos.web;

import com.atreceno.it.diaulos.domain.security.Role;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/roles")
@Controller
@RooWebScaffold(path = "roles", formBackingObject = Role.class)
@RooWebJson(jsonObject = Role.class)
public class RoleController {
}
