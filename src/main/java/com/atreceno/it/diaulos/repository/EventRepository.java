package com.atreceno.it.diaulos.repository;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import com.atreceno.it.diaulos.domain.Event;

@RooJpaRepository(domainType = Event.class)
public interface EventRepository {

	public Event findEventByCode(String code);

}
