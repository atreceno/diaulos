package com.atreceno.it.diaulos.web;

import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;
import org.springframework.roo.addon.web.mvc.controller.converter.RooConversionService;

import com.atreceno.it.diaulos.domain.Event;
import com.atreceno.it.diaulos.domain.Phase;
import com.atreceno.it.diaulos.domain.Race;
import com.atreceno.it.diaulos.domain.Sport;
import com.atreceno.it.diaulos.domain.Venue;
import com.atreceno.it.diaulos.domain.security.User;
import com.atreceno.it.diaulos.reference.Gender;

/**
 * A central place to register application converters and formatters.
 */
@RooConversionService
public class ApplicationConversionServiceFactoryBean extends
		FormattingConversionServiceFactoryBean {

	@Override
	protected void installFormatters(FormatterRegistry registry) {
		super.installFormatters(registry);
		// Register application converters and formatters
		registry.addConverter(getGenderToStringConverter());
	}

	public Converter<Gender, String> getGenderToStringConverter() {
		return new Converter<Gender, String>() {
			public String convert(Gender gender) {
				return gender.toString();
			}
		};
	}

	public Converter<Sport, String> getSportToStringConverter() {
		return new org.springframework.core.convert.converter.Converter<com.atreceno.it.diaulos.domain.Sport, java.lang.String>() {
			public String convert(Sport sport) {
				return new StringBuilder().append(sport.getName()).toString();
			}
		};
	}

	public Converter<Event, String> getEventToStringConverter() {
		return new org.springframework.core.convert.converter.Converter<com.atreceno.it.diaulos.domain.Event, java.lang.String>() {
			public String convert(Event event) {
				return new StringBuilder().append(event.getCode()).append(' ')
						.append(event.getName()).toString();
			}
		};
	}

	public Converter<Phase, String> getPhaseToStringConverter() {
		return new org.springframework.core.convert.converter.Converter<com.atreceno.it.diaulos.domain.Phase, java.lang.String>() {
			public String convert(Phase phase) {
				return new StringBuilder().append(phase.getCode()).append(' ')
						.append(phase.getName()).toString();
			}
		};
	}

	public Converter<Race, String> getRaceToStringConverter() {
		return new org.springframework.core.convert.converter.Converter<com.atreceno.it.diaulos.domain.Race, java.lang.String>() {
			public String convert(Race race) {
				return new StringBuilder().append(race.getCode()).append(' ')
						.append(race.getName()).append(' ')
						.append(race.getStartDate()).toString();
			}
		};
	}

	public Converter<Venue, String> getVenueToStringConverter() {
		return new org.springframework.core.convert.converter.Converter<com.atreceno.it.diaulos.domain.Venue, java.lang.String>() {
			public String convert(Venue venue) {
				return new StringBuilder().append(venue.getName()).append(' ')
						.append(venue.getCapacity()).append(' ')
						.append(venue.getAddress()).toString();
			}
		};
	}

	public Converter<User, String> getUserToStringConverter() {
		return new org.springframework.core.convert.converter.Converter<com.atreceno.it.diaulos.domain.security.User, java.lang.String>() {
			public String convert(User user) {
				return new StringBuilder().append(user.getUsername())
						.append(' ').append(user.getEnabled()).toString();
			}
		};
	}

}
