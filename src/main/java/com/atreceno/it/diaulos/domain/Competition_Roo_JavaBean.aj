// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.Competition;
import com.atreceno.it.diaulos.domain.Venue;
import java.util.Date;

privileged aspect Competition_Roo_JavaBean {
    
    public String Competition.getCode() {
        return this.code;
    }
    
    public void Competition.setCode(String code) {
        this.code = code;
    }
    
    public String Competition.getName() {
        return this.name;
    }
    
    public void Competition.setName(String name) {
        this.name = name;
    }
    
    public String Competition.getDescription() {
        return this.description;
    }
    
    public void Competition.setDescription(String description) {
        this.description = description;
    }
    
    public Date Competition.getStartDate() {
        return this.startDate;
    }
    
    public void Competition.setStartDate(Date startDate) {
        this.startDate = startDate;
    }
    
    public Date Competition.getFinishDate() {
        return this.finishDate;
    }
    
    public void Competition.setFinishDate(Date finishDate) {
        this.finishDate = finishDate;
    }
    
    public Boolean Competition.getOfficialResult() {
        return this.officialResult;
    }
    
    public void Competition.setOfficialResult(Boolean officialResult) {
        this.officialResult = officialResult;
    }
    
    public Venue Competition.getVenue() {
        return this.venue;
    }
    
    public void Competition.setVenue(Venue venue) {
        this.venue = venue;
    }
    
}
