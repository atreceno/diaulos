// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.Discipline;
import com.atreceno.it.diaulos.domain.DisciplineDataOnDemand;
import com.atreceno.it.diaulos.domain.Event;
import com.atreceno.it.diaulos.domain.EventDataOnDemand;
import com.atreceno.it.diaulos.domain.EventGender;
import com.atreceno.it.diaulos.domain.EventGenderDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect EventDataOnDemand_Roo_DataOnDemand {
    
    declare @type: EventDataOnDemand: @Component;
    
    private Random EventDataOnDemand.rnd = new SecureRandom();
    
    private List<Event> EventDataOnDemand.data;
    
    @Autowired
    DisciplineDataOnDemand EventDataOnDemand.disciplineDataOnDemand;
    
    @Autowired
    EventGenderDataOnDemand EventDataOnDemand.eventGenderDataOnDemand;
    
    public Event EventDataOnDemand.getNewTransientEvent(int index) {
        Event obj = new Event();
        setCode(obj, index);
        setDescription(obj, index);
        setDiscipline(obj, index);
        setEventGender(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void EventDataOnDemand.setCode(Event obj, int index) {
        String code = "code_" + index;
        if (code.length() > 6) {
            code = new Random().nextInt(10) + code.substring(1, 6);
        }
        obj.setCode(code);
    }
    
    public void EventDataOnDemand.setDescription(Event obj, int index) {
        String description = "description_" + index;
        if (description.length() > 255) {
            description = description.substring(0, 255);
        }
        obj.setDescription(description);
    }
    
    public void EventDataOnDemand.setDiscipline(Event obj, int index) {
        Discipline discipline = disciplineDataOnDemand.getRandomDiscipline();
        obj.setDiscipline(discipline);
    }
    
    public void EventDataOnDemand.setEventGender(Event obj, int index) {
        EventGender eventGender = eventGenderDataOnDemand.getRandomEventGender();
        obj.setEventGender(eventGender);
    }
    
    public void EventDataOnDemand.setName(Event obj, int index) {
        String name = "name_" + index;
        if (name.length() > 45) {
            name = name.substring(0, 45);
        }
        obj.setName(name);
    }
    
    public Event EventDataOnDemand.getSpecificEvent(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Event obj = data.get(index);
        Long id = obj.getId();
        return Event.findEvent(id);
    }
    
    public Event EventDataOnDemand.getRandomEvent() {
        init();
        Event obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Event.findEvent(id);
    }
    
    public boolean EventDataOnDemand.modifyEvent(Event obj) {
        return false;
    }
    
    public void EventDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Event.findEventEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Event' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Event>();
        for (int i = 0; i < 10; i++) {
            Event obj = getNewTransientEvent(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
