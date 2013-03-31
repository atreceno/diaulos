// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.web;

import com.atreceno.it.diaulos.domain.Event;
import com.atreceno.it.diaulos.domain.Phase;
import com.atreceno.it.diaulos.service.EventService;
import com.atreceno.it.diaulos.service.ParticPhaseService;
import com.atreceno.it.diaulos.service.PhaseService;
import com.atreceno.it.diaulos.service.RaceService;
import com.atreceno.it.diaulos.web.PhaseController;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect PhaseController_Roo_Controller {
    
    @Autowired
    PhaseService PhaseController.phaseService;
    
    @Autowired
    EventService PhaseController.eventService;
    
    @Autowired
    ParticPhaseService PhaseController.particPhaseService;
    
    @Autowired
    RaceService PhaseController.raceService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String PhaseController.create(@Valid Phase phase, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, phase);
            return "phases/create";
        }
        uiModel.asMap().clear();
        phaseService.savePhase(phase);
        return "redirect:/phases/" + encodeUrlPathSegment(phase.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String PhaseController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Phase());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (eventService.countAllEvents() == 0) {
            dependencies.add(new String[] { "event", "events" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "phases/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String PhaseController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("phase", phaseService.findPhase(id));
        uiModel.addAttribute("itemId", id);
        return "phases/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String PhaseController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("phases", phaseService.findPhaseEntries(firstResult, sizeNo));
            float nrOfPages = (float) phaseService.countAllPhases() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("phases", phaseService.findAllPhases());
        }
        return "phases/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String PhaseController.update(@Valid Phase phase, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, phase);
            return "phases/update";
        }
        uiModel.asMap().clear();
        phaseService.updatePhase(phase);
        return "redirect:/phases/" + encodeUrlPathSegment(phase.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String PhaseController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, phaseService.findPhase(id));
        return "phases/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String PhaseController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Phase phase = phaseService.findPhase(id);
        phaseService.deletePhase(phase);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/phases";
    }
    
    void PhaseController.populateEditForm(Model uiModel, Phase phase) {
        uiModel.addAttribute("phase", phase);
        uiModel.addAttribute("events", eventService.findAllEvents());
        uiModel.addAttribute("particphases", particPhaseService.findAllParticPhases());
        uiModel.addAttribute("races", raceService.findAllRaces());
    }
    
    String PhaseController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
