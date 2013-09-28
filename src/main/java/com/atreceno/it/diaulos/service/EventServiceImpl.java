package com.atreceno.it.diaulos.service;

import com.atreceno.it.diaulos.domain.Event;

public class EventServiceImpl implements EventService {

	@Override
	public Event findEventByCodeEquals(String code) {
		return eventRepository.findEventByCode(code);
	}

}
