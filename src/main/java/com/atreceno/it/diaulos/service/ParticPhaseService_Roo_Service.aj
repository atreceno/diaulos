// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.service;

import com.atreceno.it.diaulos.domain.ParticPhase;
import com.atreceno.it.diaulos.service.ParticPhaseService;
import java.util.List;

privileged aspect ParticPhaseService_Roo_Service {
    
    public abstract long ParticPhaseService.countAllParticPhases();    
    public abstract void ParticPhaseService.deleteParticPhase(ParticPhase particPhase);    
    public abstract ParticPhase ParticPhaseService.findParticPhase(Long id);    
    public abstract List<ParticPhase> ParticPhaseService.findAllParticPhases();    
    public abstract List<ParticPhase> ParticPhaseService.findParticPhaseEntries(int firstResult, int maxResults);    
    public abstract void ParticPhaseService.saveParticPhase(ParticPhase particPhase);    
    public abstract ParticPhase ParticPhaseService.updateParticPhase(ParticPhase particPhase);    
}
