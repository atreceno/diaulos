// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.Event;
import com.atreceno.it.diaulos.domain.Sport;
import java.util.Set;

privileged aspect Sport_Roo_JavaBean {
    
    public String Sport.getCode() {
        return this.code;
    }
    
    public void Sport.setCode(String code) {
        this.code = code;
    }
    
    public String Sport.getName() {
        return this.name;
    }
    
    public void Sport.setName(String name) {
        this.name = name;
    }
    
    public String Sport.getDescription() {
        return this.description;
    }
    
    public void Sport.setDescription(String description) {
        this.description = description;
    }
    
    public Set<Event> Sport.getEvents() {
        return this.events;
    }
    
    public void Sport.setEvents(Set<Event> events) {
        this.events = events;
    }
    
}
