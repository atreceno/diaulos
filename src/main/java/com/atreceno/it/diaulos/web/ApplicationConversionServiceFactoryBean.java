package com.atreceno.it.diaulos.web;

import org.apache.commons.codec.binary.Base64;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;
import org.springframework.roo.addon.web.mvc.controller.converter.RooConversionService;

import com.atreceno.it.diaulos.domain.Event;
import com.atreceno.it.diaulos.domain.EventCode;

/**
 * A central place to register application converters and formatters.
 */
@RooConversionService
public class ApplicationConversionServiceFactoryBean extends FormattingConversionServiceFactoryBean {

	@Override
	protected void installFormatters(FormatterRegistry registry) {
		super.installFormatters(registry);
		// Register application converters and formatters
	}

	public Converter<EventCode, String> getEventCodeToJsonConverter() {
		return new org.springframework.core.convert.converter.Converter<EventCode, java.lang.String>() {
			public String convert(EventCode eventCode) {
				// return
				// Base64.encodeBase64URLSafeString(eventPK.toJson().getBytes());
				return eventCode.getDisciplineCode() + eventCode.getGenderCode() + eventCode.getSubcode();
			}
		};
	}

	public Converter<String, EventCode> getJsonToEventCodeConverter() {
		return new org.springframework.core.convert.converter.Converter<String, EventCode>() {
			public EventCode convert(String id) {
				if (id.length() == 6) {
					return new EventCode(id.substring(0, 2), id.substring(2, 3), id.substring(3, 6));
				} else {
					return EventCode.fromJsonToEventCode(new String(Base64.decodeBase64(id)));
				}
			}
		};
	}

	public Converter<EventCode, Event> getIdToEventConverter() {
        return new org.springframework.core.convert.converter.Converter<EventCode, Event>() {
            public com.atreceno.it.diaulos.domain.Event convert(EventCode id) {
                return Event.findEvent(id);
            }
        };
    }

	public void installLabelConverters(FormatterRegistry registry) {
		registry.addConverter(getCompetitionToStringConverter());
		registry.addConverter(getIdToCompetitionConverter());
		registry.addConverter(getStringToCompetitionConverter());
		registry.addConverter(getDisciplineToStringConverter());
		registry.addConverter(getIdToDisciplineConverter());
		registry.addConverter(getEventToStringConverter());
		registry.addConverter(getIdToEventConverter());
		registry.addConverter(getStringToEventConverter());
		registry.addConverter(getEventGenderToStringConverter());
		registry.addConverter(getIdToEventGenderConverter());
		registry.addConverter(getPhaseToStringConverter());
		registry.addConverter(getIdToPhaseConverter());
		registry.addConverter(getStringToPhaseConverter());
		registry.addConverter(getVenueToStringConverter());
		registry.addConverter(getIdToVenueConverter());
		registry.addConverter(getEventCodeToJsonConverter());
		registry.addConverter(getJsonToEventCodeConverter());
		registry.addConverter(getIdToEventConverter());
	}
}
