// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.service;

import com.atreceno.it.diaulos.domain.Phase;
import com.atreceno.it.diaulos.service.PhaseService;
import java.util.List;

privileged aspect PhaseService_Roo_Service {
    
    public abstract long PhaseService.countAllPhases();    
    public abstract void PhaseService.deletePhase(Phase phase);    
    public abstract Phase PhaseService.findPhase(Long id);    
    public abstract List<Phase> PhaseService.findAllPhases();    
    public abstract List<Phase> PhaseService.findPhaseEntries(int firstResult, int maxResults);    
    public abstract void PhaseService.savePhase(Phase phase);    
    public abstract Phase PhaseService.updatePhase(Phase phase);    
}