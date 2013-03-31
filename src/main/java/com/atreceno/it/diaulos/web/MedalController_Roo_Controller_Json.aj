// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.web;

import com.atreceno.it.diaulos.domain.Medal;
import com.atreceno.it.diaulos.web.MedalController;
import java.util.List;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

privileged aspect MedalController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{code_}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> MedalController.showJson(@PathVariable("code_") String code_) {
        Medal medal = Medal.findMedal(code_);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (medal == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(medal.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> MedalController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<Medal> result = Medal.findAllMedals();
        return new ResponseEntity<String>(Medal.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> MedalController.createFromJson(@RequestBody String json) {
        Medal medal = Medal.fromJsonToMedal(json);
        medal.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> MedalController.createFromJsonArray(@RequestBody String json) {
        for (Medal medal: Medal.fromJsonArrayToMedals(json)) {
            medal.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> MedalController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        Medal medal = Medal.fromJsonToMedal(json);
        if (medal.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> MedalController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (Medal medal: Medal.fromJsonArrayToMedals(json)) {
            if (medal.merge() == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{code_}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> MedalController.deleteFromJson(@PathVariable("code_") String code_) {
        Medal medal = Medal.findMedal(code_);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (medal == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        medal.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}
