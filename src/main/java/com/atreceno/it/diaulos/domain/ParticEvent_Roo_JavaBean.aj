// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.Event;
import com.atreceno.it.diaulos.domain.Medal;
import com.atreceno.it.diaulos.domain.ParticEvent;
import com.atreceno.it.diaulos.domain.Participant;

privileged aspect ParticEvent_Roo_JavaBean {
    
    public Event ParticEvent.getEvent() {
        return this.event;
    }
    
    public void ParticEvent.setEvent(Event event) {
        this.event = event;
    }
    
    public Participant ParticEvent.getParticipant() {
        return this.participant;
    }
    
    public void ParticEvent.setParticipant(Participant participant) {
        this.participant = participant;
    }
    
    public Medal ParticEvent.getMedal() {
        return this.medal;
    }
    
    public void ParticEvent.setMedal(Medal medal) {
        this.medal = medal;
    }
    
    public Integer ParticEvent.getRank() {
        return this.rank;
    }
    
    public void ParticEvent.setRank(Integer rank) {
        this.rank = rank;
    }
    
    public String ParticEvent.getResult() {
        return this.result;
    }
    
    public void ParticEvent.setResult(String result) {
        this.result = result;
    }
    
}
