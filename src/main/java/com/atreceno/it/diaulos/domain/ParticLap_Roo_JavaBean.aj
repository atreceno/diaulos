// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.ParticLap;
import com.atreceno.it.diaulos.domain.Participant;
import com.atreceno.it.diaulos.domain.Phase;

privileged aspect ParticLap_Roo_JavaBean {
    
    public Phase ParticLap.getPhase() {
        return this.phase;
    }
    
    public void ParticLap.setPhase(Phase phase) {
        this.phase = phase;
    }
    
    public Participant ParticLap.getParticipant() {
        return this.participant;
    }
    
    public void ParticLap.setParticipant(Participant participant) {
        this.participant = participant;
    }
    
    public Integer ParticLap.getRank() {
        return this.rank;
    }
    
    public void ParticLap.setRank(Integer rank) {
        this.rank = rank;
    }
    
    public String ParticLap.getResult() {
        return this.result;
    }
    
    public void ParticLap.setResult(String result) {
        this.result = result;
    }
    
}
