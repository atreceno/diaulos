// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.web;

import com.atreceno.it.diaulos.domain.Sport;
import com.atreceno.it.diaulos.web.SportController;
import java.util.List;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

privileged aspect SportController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{code}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> SportController.showJson(@PathVariable("code") String code) {
        Sport sport = Sport.findSport(code);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (sport == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(sport.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> SportController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<Sport> result = Sport.findAllSports();
        return new ResponseEntity<String>(Sport.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> SportController.createFromJson(@RequestBody String json) {
        Sport sport = Sport.fromJsonToSport(json);
        sport.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> SportController.createFromJsonArray(@RequestBody String json) {
        for (Sport sport: Sport.fromJsonArrayToSports(json)) {
            sport.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/{code}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> SportController.updateFromJson(@RequestBody String json, @PathVariable("code") String code) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        Sport sport = Sport.fromJsonToSport(json);
        if (sport.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{code}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> SportController.deleteFromJson(@PathVariable("code") String code) {
        Sport sport = Sport.findSport(code);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (sport == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        sport.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByCodeEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> SportController.jsonFindSportsByCodeEquals(@RequestParam("code") String code) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Sport.toJsonArray(Sport.findSportsByCodeEquals(code).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByNameLike", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> SportController.jsonFindSportsByNameLike(@RequestParam("name") String name) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Sport.toJsonArray(Sport.findSportsByNameLike(name).getResultList()), headers, HttpStatus.OK);
    }
    
}
