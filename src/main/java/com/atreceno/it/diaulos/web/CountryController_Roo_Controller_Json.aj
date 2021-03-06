// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.web;

import com.atreceno.it.diaulos.domain.Country;
import com.atreceno.it.diaulos.web.CountryController;
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

privileged aspect CountryController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{code}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> CountryController.showJson(@PathVariable("code") String code) {
        Country country = Country.findCountry(code);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (country == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(country.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> CountryController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<Country> result = Country.findAllCountrys();
        return new ResponseEntity<String>(Country.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> CountryController.createFromJson(@RequestBody String json) {
        Country country = Country.fromJsonToCountry(json);
        country.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> CountryController.createFromJsonArray(@RequestBody String json) {
        for (Country country: Country.fromJsonArrayToCountrys(json)) {
            country.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/{code}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> CountryController.updateFromJson(@RequestBody String json, @PathVariable("code") String code) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        Country country = Country.fromJsonToCountry(json);
        if (country.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{code}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> CountryController.deleteFromJson(@PathVariable("code") String code) {
        Country country = Country.findCountry(code);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (country == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        country.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByCodeEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> CountryController.jsonFindCountrysByCodeEquals(@RequestParam("code") String code) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Country.toJsonArray(Country.findCountrysByCodeEquals(code).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByNameLike", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> CountryController.jsonFindCountrysByNameLike(@RequestParam("name") String name) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Country.toJsonArray(Country.findCountrysByNameLike(name).getResultList()), headers, HttpStatus.OK);
    }
    
}
