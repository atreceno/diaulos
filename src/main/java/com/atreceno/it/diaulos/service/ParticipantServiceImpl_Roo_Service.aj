// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.service;

import com.atreceno.it.diaulos.domain.Participant;
import com.atreceno.it.diaulos.repository.ParticipantRepository;
import com.atreceno.it.diaulos.service.ParticipantServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ParticipantServiceImpl_Roo_Service {
    
    declare @type: ParticipantServiceImpl: @Service;
    
    declare @type: ParticipantServiceImpl: @Transactional;
    
    @Autowired
    ParticipantRepository ParticipantServiceImpl.participantRepository;
    
    public long ParticipantServiceImpl.countAllParticipants() {
        return participantRepository.count();
    }
    
    public void ParticipantServiceImpl.deleteParticipant(Participant participant) {
        participantRepository.delete(participant);
    }
    
    public Participant ParticipantServiceImpl.findParticipant(Long id) {
        return participantRepository.findOne(id);
    }
    
    public List<Participant> ParticipantServiceImpl.findAllParticipants() {
        return participantRepository.findAll();
    }
    
    public List<Participant> ParticipantServiceImpl.findParticipantEntries(int firstResult, int maxResults) {
        return participantRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void ParticipantServiceImpl.saveParticipant(Participant participant) {
        participantRepository.save(participant);
    }
    
    public Participant ParticipantServiceImpl.updateParticipant(Participant participant) {
        return participantRepository.save(participant);
    }
    
}
