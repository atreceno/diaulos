package com.atreceno.it.diaulos.repository;

import com.atreceno.it.diaulos.domain.Participant;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Participant.class)
public interface ParticipantRepository {
}
