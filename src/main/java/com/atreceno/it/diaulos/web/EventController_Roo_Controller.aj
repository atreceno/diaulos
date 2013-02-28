// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.web;

import com.atreceno.it.diaulos.domain.Discipline;
import com.atreceno.it.diaulos.domain.Event;
import com.atreceno.it.diaulos.domain.EventGender;
import com.atreceno.it.diaulos.web.EventController;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect EventController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String EventController.create(@Valid Event event, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, event);
            return "events/create";
        }
        uiModel.asMap().clear();
        event.persist();
        return "redirect:/events/" + encodeUrlPathSegment(event.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String EventController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Event());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (EventGender.countEventGenders() == 0) {
            dependencies.add(new String[] { "eventgender", "eventgenders" });
        }
        if (Discipline.countDisciplines() == 0) {
            dependencies.add(new String[] { "discipline", "disciplines" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "events/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String EventController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("event", Event.findEvent(id));
        uiModel.addAttribute("itemId", id);
        return "events/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String EventController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("events", Event.findEventEntries(firstResult, sizeNo));
            float nrOfPages = (float) Event.countEvents() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("events", Event.findAllEvents());
        }
        return "events/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String EventController.update(@Valid Event event, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, event);
            return "events/update";
        }
        uiModel.asMap().clear();
        event.merge();
        return "redirect:/events/" + encodeUrlPathSegment(event.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String EventController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Event.findEvent(id));
        return "events/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String EventController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Event event = Event.findEvent(id);
        event.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/events";
    }
    
    void EventController.populateEditForm(Model uiModel, Event event) {
        uiModel.addAttribute("event", event);
        uiModel.addAttribute("disciplines", Discipline.findAllDisciplines());
        uiModel.addAttribute("eventgenders", EventGender.findAllEventGenders());
    }
    
    String EventController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
