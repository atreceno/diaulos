// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.service;

import com.atreceno.it.diaulos.domain.ParticPhase;
import com.atreceno.it.diaulos.repository.ParticPhaseRepository;
import com.atreceno.it.diaulos.service.ParticPhaseServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ParticPhaseServiceImpl_Roo_Service {
    
    declare @type: ParticPhaseServiceImpl: @Service;
    
    declare @type: ParticPhaseServiceImpl: @Transactional;
    
    @Autowired
    ParticPhaseRepository ParticPhaseServiceImpl.particPhaseRepository;
    
    public long ParticPhaseServiceImpl.countAllParticPhases() {
        return particPhaseRepository.count();
    }
    
    public void ParticPhaseServiceImpl.deleteParticPhase(ParticPhase particPhase) {
        particPhaseRepository.delete(particPhase);
    }
    
    public ParticPhase ParticPhaseServiceImpl.findParticPhase(Long id) {
        return particPhaseRepository.findOne(id);
    }
    
    public List<ParticPhase> ParticPhaseServiceImpl.findAllParticPhases() {
        return particPhaseRepository.findAll();
    }
    
    public List<ParticPhase> ParticPhaseServiceImpl.findParticPhaseEntries(int firstResult, int maxResults) {
        return particPhaseRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void ParticPhaseServiceImpl.saveParticPhase(ParticPhase particPhase) {
        particPhaseRepository.save(particPhase);
    }
    
    public ParticPhase ParticPhaseServiceImpl.updateParticPhase(ParticPhase particPhase) {
        return particPhaseRepository.save(particPhase);
    }
    
}
