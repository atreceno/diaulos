// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.web;

import com.atreceno.it.diaulos.domain.ParticRace;
import com.atreceno.it.diaulos.web.ParticRaceController;
import java.util.List;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

privileged aspect ParticRaceController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ParticRaceController.showJson(@PathVariable("id") Long id) {
        ParticRace particRace = particRaceService.findParticRace(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (particRace == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(particRace.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ParticRaceController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<ParticRace> result = particRaceService.findAllParticRaces();
        return new ResponseEntity<String>(ParticRace.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> ParticRaceController.createFromJson(@RequestBody String json) {
        ParticRace particRace = ParticRace.fromJsonToParticRace(json);
        particRaceService.saveParticRace(particRace);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> ParticRaceController.createFromJsonArray(@RequestBody String json) {
        for (ParticRace particRace: ParticRace.fromJsonArrayToParticRaces(json)) {
            particRaceService.saveParticRace(particRace);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> ParticRaceController.updateFromJson(@RequestBody String json, @PathVariable("id") Long id) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        ParticRace particRace = ParticRace.fromJsonToParticRace(json);
        if (particRaceService.updateParticRace(particRace) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> ParticRaceController.deleteFromJson(@PathVariable("id") Long id) {
        ParticRace particRace = particRaceService.findParticRace(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (particRace == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        particRaceService.deleteParticRace(particRace);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}
