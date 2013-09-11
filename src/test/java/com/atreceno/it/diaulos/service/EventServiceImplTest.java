package com.atreceno.it.diaulos.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mockito;
import org.springframework.test.util.ReflectionTestUtils;

import com.atreceno.it.diaulos.domain.Event;
import com.atreceno.it.diaulos.repository.EventRepository;

@RunWith(JUnit4.class)
public class EventServiceImplTest {

	private List<Event> events = new ArrayList<Event>();

	/**
	 * EventRepository to mock
	 */
	private EventRepository eventRepository;

	/**
	 * Initialize list of Events
	 */
	@Before
	public void initEvents() {
		for (int i = 0; i < 5; i++) {
			Event event = new Event();
			event.setCode("code_" + i);
			event.setName("name_" + i);
			event.setDescription("description_" + i);
			events.add(event);
		}
	}

	/**
	 * Test findAllEvents method
	 */
	@Test
	public void testFindAllEvents() {

		// Mock EventRepository
		eventRepository = Mockito.mock(EventRepository.class);
		Mockito.when(eventRepository.findAll()).thenReturn(events);

		// Create EventService and inject the mocked repository
		EventService eventService = new EventServiceImpl();
		ReflectionTestUtils.setField(eventService, "eventRepository",
				eventRepository);

		// Use the Service
		List<Event> result = eventService.findAllEvents();

		// Assert
		Assert.assertNotNull(result);
		Assert.assertEquals(5, result.size());
		for (int i = 0; i < 5; i++) {
			Event event = result.get(i);
			Assert.assertEquals("code_" + i, event.getCode());
			Assert.assertEquals("name_" + i, event.getName());
			Assert.assertEquals("description_" + i, event.getDescription());
		}

	}

}
