package com.atreceno.it.diaulos.repository;

import com.atreceno.it.diaulos.domain.ParticEvent;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = ParticEvent.class)
public interface ParticEventRepository {
}
