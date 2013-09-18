// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.web;

import com.atreceno.it.diaulos.domain.Sport;
import com.atreceno.it.diaulos.web.SportController;
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

privileged aspect SportController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String SportController.create(@Valid Sport sport, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, sport);
            return "sports/create";
        }
        uiModel.asMap().clear();
        sport.persist();
        return "redirect:/sports/" + encodeUrlPathSegment(sport.getCode().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String SportController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Sport());
        return "sports/create";
    }
    
    @RequestMapping(value = "/{code}", produces = "text/html")
    public String SportController.show(@PathVariable("code") String code, Model uiModel) {
        uiModel.addAttribute("sport", Sport.findSport(code));
        uiModel.addAttribute("itemId", code);
        return "sports/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String SportController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("sports", Sport.findSportEntries(firstResult, sizeNo));
            float nrOfPages = (float) Sport.countSports() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("sports", Sport.findAllSports());
        }
        return "sports/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String SportController.update(@Valid Sport sport, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, sport);
            return "sports/update";
        }
        uiModel.asMap().clear();
        sport.merge();
        return "redirect:/sports/" + encodeUrlPathSegment(sport.getCode().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{code}", params = "form", produces = "text/html")
    public String SportController.updateForm(@PathVariable("code") String code, Model uiModel) {
        populateEditForm(uiModel, Sport.findSport(code));
        return "sports/update";
    }
    
    @RequestMapping(value = "/{code}", method = RequestMethod.DELETE, produces = "text/html")
    public String SportController.delete(@PathVariable("code") String code, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Sport sport = Sport.findSport(code);
        sport.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/sports";
    }
    
    String SportController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
