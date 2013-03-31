// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.web;

import com.atreceno.it.diaulos.domain.Country;
import com.atreceno.it.diaulos.domain.Event;
import com.atreceno.it.diaulos.domain.EventGender;
import com.atreceno.it.diaulos.domain.Lap;
import com.atreceno.it.diaulos.domain.Medal;
import com.atreceno.it.diaulos.domain.ParticEvent;
import com.atreceno.it.diaulos.domain.ParticLap;
import com.atreceno.it.diaulos.domain.ParticPhase;
import com.atreceno.it.diaulos.domain.ParticRace;
import com.atreceno.it.diaulos.domain.Participant;
import com.atreceno.it.diaulos.domain.Phase;
import com.atreceno.it.diaulos.domain.Race;
import com.atreceno.it.diaulos.domain.Sport;
import com.atreceno.it.diaulos.domain.Venue;
import com.atreceno.it.diaulos.domain.security.Role;
import com.atreceno.it.diaulos.domain.security.User;
import com.atreceno.it.diaulos.service.EventService;
import com.atreceno.it.diaulos.service.LapService;
import com.atreceno.it.diaulos.service.ParticEventService;
import com.atreceno.it.diaulos.service.ParticLapService;
import com.atreceno.it.diaulos.service.ParticPhaseService;
import com.atreceno.it.diaulos.service.ParticRaceService;
import com.atreceno.it.diaulos.service.ParticipantService;
import com.atreceno.it.diaulos.service.PhaseService;
import com.atreceno.it.diaulos.service.RaceService;
import com.atreceno.it.diaulos.service.RoleService;
import com.atreceno.it.diaulos.service.UserService;
import com.atreceno.it.diaulos.web.ApplicationConversionServiceFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    @Autowired
    EventService ApplicationConversionServiceFactoryBean.eventService;
    
    @Autowired
    LapService ApplicationConversionServiceFactoryBean.lapService;
    
    @Autowired
    ParticEventService ApplicationConversionServiceFactoryBean.particEventService;
    
    @Autowired
    ParticLapService ApplicationConversionServiceFactoryBean.particLapService;
    
    @Autowired
    ParticPhaseService ApplicationConversionServiceFactoryBean.particPhaseService;
    
    @Autowired
    ParticRaceService ApplicationConversionServiceFactoryBean.particRaceService;
    
    @Autowired
    ParticipantService ApplicationConversionServiceFactoryBean.participantService;
    
    @Autowired
    PhaseService ApplicationConversionServiceFactoryBean.phaseService;
    
    @Autowired
    RaceService ApplicationConversionServiceFactoryBean.raceService;
    
    @Autowired
    RoleService ApplicationConversionServiceFactoryBean.roleService;
    
    @Autowired
    UserService ApplicationConversionServiceFactoryBean.userService;
    
    public Converter<Country, String> ApplicationConversionServiceFactoryBean.getCountryToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.atreceno.it.diaulos.domain.Country, java.lang.String>() {
            public String convert(Country country) {
                return new StringBuilder().append(country.getCode()).append(' ').append(country.getName()).toString();
            }
        };
    }
    
    public Converter<String, Country> ApplicationConversionServiceFactoryBean.getIdToCountryConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.atreceno.it.diaulos.domain.Country>() {
            public com.atreceno.it.diaulos.domain.Country convert(java.lang.String id) {
                return Country.findCountry(id);
            }
        };
    }
    
    public Converter<Event, String> ApplicationConversionServiceFactoryBean.getEventToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.atreceno.it.diaulos.domain.Event, java.lang.String>() {
            public String convert(Event event) {
                return new StringBuilder().append(event.getCode()).append(' ').append(event.getName()).append(' ').append(event.getDescription()).toString();
            }
        };
    }
    
    public Converter<Long, Event> ApplicationConversionServiceFactoryBean.getIdToEventConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.atreceno.it.diaulos.domain.Event>() {
            public com.atreceno.it.diaulos.domain.Event convert(java.lang.Long id) {
                return eventService.findEvent(id);
            }
        };
    }
    
    public Converter<String, Event> ApplicationConversionServiceFactoryBean.getStringToEventConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.atreceno.it.diaulos.domain.Event>() {
            public com.atreceno.it.diaulos.domain.Event convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Event.class);
            }
        };
    }
    
    public Converter<EventGender, String> ApplicationConversionServiceFactoryBean.getEventGenderToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.atreceno.it.diaulos.domain.EventGender, java.lang.String>() {
            public String convert(EventGender eventGender) {
                return new StringBuilder().append(eventGender.getCode()).append(' ').append(eventGender.getName()).toString();
            }
        };
    }
    
    public Converter<String, EventGender> ApplicationConversionServiceFactoryBean.getIdToEventGenderConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.atreceno.it.diaulos.domain.EventGender>() {
            public com.atreceno.it.diaulos.domain.EventGender convert(java.lang.String id) {
                return EventGender.findEventGender(id);
            }
        };
    }
    
    public Converter<Lap, String> ApplicationConversionServiceFactoryBean.getLapToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.atreceno.it.diaulos.domain.Lap, java.lang.String>() {
            public String convert(Lap lap) {
                return new StringBuilder().append(lap.getCode()).append(' ').append(lap.getName()).append(' ').append(lap.getCumulativeDistance()).append(' ').append(lap.getPartialDistance()).toString();
            }
        };
    }
    
    public Converter<Long, Lap> ApplicationConversionServiceFactoryBean.getIdToLapConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.atreceno.it.diaulos.domain.Lap>() {
            public com.atreceno.it.diaulos.domain.Lap convert(java.lang.Long id) {
                return lapService.findLap(id);
            }
        };
    }
    
    public Converter<String, Lap> ApplicationConversionServiceFactoryBean.getStringToLapConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.atreceno.it.diaulos.domain.Lap>() {
            public com.atreceno.it.diaulos.domain.Lap convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Lap.class);
            }
        };
    }
    
    public Converter<Medal, String> ApplicationConversionServiceFactoryBean.getMedalToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.atreceno.it.diaulos.domain.Medal, java.lang.String>() {
            public String convert(Medal medal) {
                return new StringBuilder().append(medal.getCode()).append(' ').append(medal.getName()).toString();
            }
        };
    }
    
    public Converter<String, Medal> ApplicationConversionServiceFactoryBean.getIdToMedalConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.atreceno.it.diaulos.domain.Medal>() {
            public com.atreceno.it.diaulos.domain.Medal convert(java.lang.String id) {
                return Medal.findMedal(id);
            }
        };
    }
    
    public Converter<ParticEvent, String> ApplicationConversionServiceFactoryBean.getParticEventToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.atreceno.it.diaulos.domain.ParticEvent, java.lang.String>() {
            public String convert(ParticEvent particEvent) {
                return new StringBuilder().append(particEvent.getRank()).append(' ').append(particEvent.getResult()).toString();
            }
        };
    }
    
    public Converter<Long, ParticEvent> ApplicationConversionServiceFactoryBean.getIdToParticEventConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.atreceno.it.diaulos.domain.ParticEvent>() {
            public com.atreceno.it.diaulos.domain.ParticEvent convert(java.lang.Long id) {
                return particEventService.findParticEvent(id);
            }
        };
    }
    
    public Converter<String, ParticEvent> ApplicationConversionServiceFactoryBean.getStringToParticEventConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.atreceno.it.diaulos.domain.ParticEvent>() {
            public com.atreceno.it.diaulos.domain.ParticEvent convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), ParticEvent.class);
            }
        };
    }
    
    public Converter<ParticLap, String> ApplicationConversionServiceFactoryBean.getParticLapToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.atreceno.it.diaulos.domain.ParticLap, java.lang.String>() {
            public String convert(ParticLap particLap) {
                return new StringBuilder().append(particLap.getRank()).append(' ').append(particLap.getResult()).toString();
            }
        };
    }
    
    public Converter<Long, ParticLap> ApplicationConversionServiceFactoryBean.getIdToParticLapConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.atreceno.it.diaulos.domain.ParticLap>() {
            public com.atreceno.it.diaulos.domain.ParticLap convert(java.lang.Long id) {
                return particLapService.findParticLap(id);
            }
        };
    }
    
    public Converter<String, ParticLap> ApplicationConversionServiceFactoryBean.getStringToParticLapConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.atreceno.it.diaulos.domain.ParticLap>() {
            public com.atreceno.it.diaulos.domain.ParticLap convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), ParticLap.class);
            }
        };
    }
    
    public Converter<ParticPhase, String> ApplicationConversionServiceFactoryBean.getParticPhaseToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.atreceno.it.diaulos.domain.ParticPhase, java.lang.String>() {
            public String convert(ParticPhase particPhase) {
                return new StringBuilder().append(particPhase.getRank()).append(' ').append(particPhase.getResult()).toString();
            }
        };
    }
    
    public Converter<Long, ParticPhase> ApplicationConversionServiceFactoryBean.getIdToParticPhaseConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.atreceno.it.diaulos.domain.ParticPhase>() {
            public com.atreceno.it.diaulos.domain.ParticPhase convert(java.lang.Long id) {
                return particPhaseService.findParticPhase(id);
            }
        };
    }
    
    public Converter<String, ParticPhase> ApplicationConversionServiceFactoryBean.getStringToParticPhaseConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.atreceno.it.diaulos.domain.ParticPhase>() {
            public com.atreceno.it.diaulos.domain.ParticPhase convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), ParticPhase.class);
            }
        };
    }
    
    public Converter<ParticRace, String> ApplicationConversionServiceFactoryBean.getParticRaceToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.atreceno.it.diaulos.domain.ParticRace, java.lang.String>() {
            public String convert(ParticRace particRace) {
                return new StringBuilder().append(particRace.getRank()).append(' ').append(particRace.getResult()).append(' ').append(particRace.getLane()).append(' ').append(particRace.getBib()).toString();
            }
        };
    }
    
    public Converter<Long, ParticRace> ApplicationConversionServiceFactoryBean.getIdToParticRaceConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.atreceno.it.diaulos.domain.ParticRace>() {
            public com.atreceno.it.diaulos.domain.ParticRace convert(java.lang.Long id) {
                return particRaceService.findParticRace(id);
            }
        };
    }
    
    public Converter<String, ParticRace> ApplicationConversionServiceFactoryBean.getStringToParticRaceConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.atreceno.it.diaulos.domain.ParticRace>() {
            public com.atreceno.it.diaulos.domain.ParticRace convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), ParticRace.class);
            }
        };
    }
    
    public Converter<Participant, String> ApplicationConversionServiceFactoryBean.getParticipantToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.atreceno.it.diaulos.domain.Participant, java.lang.String>() {
            public String convert(Participant participant) {
                return new StringBuilder().append(participant.getCode()).append(' ').append(participant.getFirstName()).append(' ').append(participant.getLastName()).append(' ').append(participant.getEmail()).toString();
            }
        };
    }
    
    public Converter<Long, Participant> ApplicationConversionServiceFactoryBean.getIdToParticipantConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.atreceno.it.diaulos.domain.Participant>() {
            public com.atreceno.it.diaulos.domain.Participant convert(java.lang.Long id) {
                return participantService.findParticipant(id);
            }
        };
    }
    
    public Converter<String, Participant> ApplicationConversionServiceFactoryBean.getStringToParticipantConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.atreceno.it.diaulos.domain.Participant>() {
            public com.atreceno.it.diaulos.domain.Participant convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Participant.class);
            }
        };
    }
    
    public Converter<Phase, String> ApplicationConversionServiceFactoryBean.getPhaseToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.atreceno.it.diaulos.domain.Phase, java.lang.String>() {
            public String convert(Phase phase) {
                return new StringBuilder().append(phase.getCode()).append(' ').append(phase.getName()).append(' ').append(phase.getDescription()).toString();
            }
        };
    }
    
    public Converter<Long, Phase> ApplicationConversionServiceFactoryBean.getIdToPhaseConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.atreceno.it.diaulos.domain.Phase>() {
            public com.atreceno.it.diaulos.domain.Phase convert(java.lang.Long id) {
                return phaseService.findPhase(id);
            }
        };
    }
    
    public Converter<String, Phase> ApplicationConversionServiceFactoryBean.getStringToPhaseConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.atreceno.it.diaulos.domain.Phase>() {
            public com.atreceno.it.diaulos.domain.Phase convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Phase.class);
            }
        };
    }
    
    public Converter<Race, String> ApplicationConversionServiceFactoryBean.getRaceToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.atreceno.it.diaulos.domain.Race, java.lang.String>() {
            public String convert(Race race) {
                return new StringBuilder().append(race.getCode()).append(' ').append(race.getName()).append(' ').append(race.getDescription()).append(' ').append(race.getStartDate()).toString();
            }
        };
    }
    
    public Converter<Long, Race> ApplicationConversionServiceFactoryBean.getIdToRaceConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.atreceno.it.diaulos.domain.Race>() {
            public com.atreceno.it.diaulos.domain.Race convert(java.lang.Long id) {
                return raceService.findRace(id);
            }
        };
    }
    
    public Converter<String, Race> ApplicationConversionServiceFactoryBean.getStringToRaceConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.atreceno.it.diaulos.domain.Race>() {
            public com.atreceno.it.diaulos.domain.Race convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Race.class);
            }
        };
    }
    
    public Converter<Sport, String> ApplicationConversionServiceFactoryBean.getSportToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.atreceno.it.diaulos.domain.Sport, java.lang.String>() {
            public String convert(Sport sport) {
                return new StringBuilder().append(sport.getCode()).append(' ').append(sport.getName()).append(' ').append(sport.getDescription()).toString();
            }
        };
    }
    
    public Converter<String, Sport> ApplicationConversionServiceFactoryBean.getIdToSportConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.atreceno.it.diaulos.domain.Sport>() {
            public com.atreceno.it.diaulos.domain.Sport convert(java.lang.String id) {
                return Sport.findSport(id);
            }
        };
    }
    
    public Converter<Venue, String> ApplicationConversionServiceFactoryBean.getVenueToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.atreceno.it.diaulos.domain.Venue, java.lang.String>() {
            public String convert(Venue venue) {
                return new StringBuilder().append(venue.getCode()).append(' ').append(venue.getName()).append(' ').append(venue.getDescription()).append(' ').append(venue.getCapacity()).toString();
            }
        };
    }
    
    public Converter<String, Venue> ApplicationConversionServiceFactoryBean.getIdToVenueConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.atreceno.it.diaulos.domain.Venue>() {
            public com.atreceno.it.diaulos.domain.Venue convert(java.lang.String id) {
                return Venue.findVenue(id);
            }
        };
    }
    
    public Converter<Role, String> ApplicationConversionServiceFactoryBean.getRoleToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.atreceno.it.diaulos.domain.security.Role, java.lang.String>() {
            public String convert(Role role) {
                return new StringBuilder().append(role.getName()).toString();
            }
        };
    }
    
    public Converter<Long, Role> ApplicationConversionServiceFactoryBean.getIdToRoleConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.atreceno.it.diaulos.domain.security.Role>() {
            public com.atreceno.it.diaulos.domain.security.Role convert(java.lang.Long id) {
                return roleService.findRole(id);
            }
        };
    }
    
    public Converter<String, Role> ApplicationConversionServiceFactoryBean.getStringToRoleConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.atreceno.it.diaulos.domain.security.Role>() {
            public com.atreceno.it.diaulos.domain.security.Role convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Role.class);
            }
        };
    }
    
    public Converter<User, String> ApplicationConversionServiceFactoryBean.getUserToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.atreceno.it.diaulos.domain.security.User, java.lang.String>() {
            public String convert(User user) {
                return new StringBuilder().append(user.getUsername()).append(' ').append(user.getPassword()).toString();
            }
        };
    }
    
    public Converter<Long, User> ApplicationConversionServiceFactoryBean.getIdToUserConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.atreceno.it.diaulos.domain.security.User>() {
            public com.atreceno.it.diaulos.domain.security.User convert(java.lang.Long id) {
                return userService.findUser(id);
            }
        };
    }
    
    public Converter<String, User> ApplicationConversionServiceFactoryBean.getStringToUserConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.atreceno.it.diaulos.domain.security.User>() {
            public com.atreceno.it.diaulos.domain.security.User convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), User.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getCountryToStringConverter());
        registry.addConverter(getIdToCountryConverter());
        registry.addConverter(getEventToStringConverter());
        registry.addConverter(getIdToEventConverter());
        registry.addConverter(getStringToEventConverter());
        registry.addConverter(getEventGenderToStringConverter());
        registry.addConverter(getIdToEventGenderConverter());
        registry.addConverter(getLapToStringConverter());
        registry.addConverter(getIdToLapConverter());
        registry.addConverter(getStringToLapConverter());
        registry.addConverter(getMedalToStringConverter());
        registry.addConverter(getIdToMedalConverter());
        registry.addConverter(getParticEventToStringConverter());
        registry.addConverter(getIdToParticEventConverter());
        registry.addConverter(getStringToParticEventConverter());
        registry.addConverter(getParticLapToStringConverter());
        registry.addConverter(getIdToParticLapConverter());
        registry.addConverter(getStringToParticLapConverter());
        registry.addConverter(getParticPhaseToStringConverter());
        registry.addConverter(getIdToParticPhaseConverter());
        registry.addConverter(getStringToParticPhaseConverter());
        registry.addConverter(getParticRaceToStringConverter());
        registry.addConverter(getIdToParticRaceConverter());
        registry.addConverter(getStringToParticRaceConverter());
        registry.addConverter(getParticipantToStringConverter());
        registry.addConverter(getIdToParticipantConverter());
        registry.addConverter(getStringToParticipantConverter());
        registry.addConverter(getPhaseToStringConverter());
        registry.addConverter(getIdToPhaseConverter());
        registry.addConverter(getStringToPhaseConverter());
        registry.addConverter(getRaceToStringConverter());
        registry.addConverter(getIdToRaceConverter());
        registry.addConverter(getStringToRaceConverter());
        registry.addConverter(getSportToStringConverter());
        registry.addConverter(getIdToSportConverter());
        registry.addConverter(getVenueToStringConverter());
        registry.addConverter(getIdToVenueConverter());
        registry.addConverter(getRoleToStringConverter());
        registry.addConverter(getIdToRoleConverter());
        registry.addConverter(getStringToRoleConverter());
        registry.addConverter(getUserToStringConverter());
        registry.addConverter(getIdToUserConverter());
        registry.addConverter(getStringToUserConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
