// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.service;

import com.atreceno.it.diaulos.domain.ParticEvent;
import com.atreceno.it.diaulos.repository.ParticEventRepository;
import com.atreceno.it.diaulos.service.ParticEventServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ParticEventServiceImpl_Roo_Service {
    
    declare @type: ParticEventServiceImpl: @Service;
    
    declare @type: ParticEventServiceImpl: @Transactional;
    
    @Autowired
    ParticEventRepository ParticEventServiceImpl.particEventRepository;
    
    public long ParticEventServiceImpl.countAllParticEvents() {
        return particEventRepository.count();
    }
    
    public void ParticEventServiceImpl.deleteParticEvent(ParticEvent particEvent) {
        particEventRepository.delete(particEvent);
    }
    
    public ParticEvent ParticEventServiceImpl.findParticEvent(Long id) {
        return particEventRepository.findOne(id);
    }
    
    public List<ParticEvent> ParticEventServiceImpl.findAllParticEvents() {
        return particEventRepository.findAll();
    }
    
    public List<ParticEvent> ParticEventServiceImpl.findParticEventEntries(int firstResult, int maxResults) {
        return particEventRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void ParticEventServiceImpl.saveParticEvent(ParticEvent particEvent) {
        particEventRepository.save(particEvent);
    }
    
    public ParticEvent ParticEventServiceImpl.updateParticEvent(ParticEvent particEvent) {
        return particEventRepository.save(particEvent);
    }
    
}
