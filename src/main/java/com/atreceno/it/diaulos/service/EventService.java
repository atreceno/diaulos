package com.atreceno.it.diaulos.service;

import org.springframework.roo.addon.layers.service.RooService;

import com.atreceno.it.diaulos.domain.Event;

@RooService(domainTypes = { com.atreceno.it.diaulos.domain.Event.class })
public interface EventService {

	public Event findEventByCodeEquals(String code);

}
