// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.Discipline;
import com.atreceno.it.diaulos.domain.Event;
import com.atreceno.it.diaulos.domain.EventGender;
import com.atreceno.it.diaulos.domain.Phase;
import java.util.Set;

privileged aspect Event_Roo_JavaBean {
    
    public String Event.getCode() {
        return this.code;
    }
    
    public void Event.setCode(String code) {
        this.code = code;
    }
    
    public String Event.getName() {
        return this.name;
    }
    
    public void Event.setName(String name) {
        this.name = name;
    }
    
    public String Event.getDescription() {
        return this.description;
    }
    
    public void Event.setDescription(String description) {
        this.description = description;
    }
    
    public EventGender Event.getEventGender() {
        return this.eventGender;
    }
    
    public void Event.setEventGender(EventGender eventGender) {
        this.eventGender = eventGender;
    }
    
    public Discipline Event.getDiscipline() {
        return this.discipline;
    }
    
    public void Event.setDiscipline(Discipline discipline) {
        this.discipline = discipline;
    }
    
    public Set<Phase> Event.getPhases() {
        return this.phases;
    }
    
    public void Event.setPhases(Set<Phase> phases) {
        this.phases = phases;
    }
    
}
