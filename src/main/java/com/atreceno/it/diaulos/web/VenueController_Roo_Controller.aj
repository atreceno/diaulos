// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.web;

import com.atreceno.it.diaulos.domain.Venue;
import com.atreceno.it.diaulos.web.VenueController;
import java.io.UnsupportedEncodingException;
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

privileged aspect VenueController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String VenueController.create(@Valid Venue venue, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, venue);
            return "venues/create";
        }
        uiModel.asMap().clear();
        venue.persist();
        return "redirect:/venues/" + encodeUrlPathSegment(venue.getCode_().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String VenueController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Venue());
        return "venues/create";
    }
    
    @RequestMapping(value = "/{code_}", produces = "text/html")
    public String VenueController.show(@PathVariable("code_") String code_, Model uiModel) {
        uiModel.addAttribute("venue", Venue.findVenue(code_));
        uiModel.addAttribute("itemId", code_);
        return "venues/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String VenueController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("venues", Venue.findVenueEntries(firstResult, sizeNo));
            float nrOfPages = (float) Venue.countVenues() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("venues", Venue.findAllVenues());
        }
        return "venues/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String VenueController.update(@Valid Venue venue, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, venue);
            return "venues/update";
        }
        uiModel.asMap().clear();
        venue.merge();
        return "redirect:/venues/" + encodeUrlPathSegment(venue.getCode_().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{code_}", params = "form", produces = "text/html")
    public String VenueController.updateForm(@PathVariable("code_") String code_, Model uiModel) {
        populateEditForm(uiModel, Venue.findVenue(code_));
        return "venues/update";
    }
    
    @RequestMapping(value = "/{code_}", method = RequestMethod.DELETE, produces = "text/html")
    public String VenueController.delete(@PathVariable("code_") String code_, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Venue venue = Venue.findVenue(code_);
        venue.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/venues";
    }
    
    void VenueController.populateEditForm(Model uiModel, Venue venue) {
        uiModel.addAttribute("venue", venue);
    }
    
    String VenueController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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