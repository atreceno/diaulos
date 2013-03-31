package com.atreceno.it.diaulos.repository;

import com.atreceno.it.diaulos.domain.Event;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Event.class)
public interface EventRepository {
}
