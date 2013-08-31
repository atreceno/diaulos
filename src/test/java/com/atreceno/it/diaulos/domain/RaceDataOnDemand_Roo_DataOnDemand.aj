// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.Phase;
import com.atreceno.it.diaulos.domain.PhaseDataOnDemand;
import com.atreceno.it.diaulos.domain.Race;
import com.atreceno.it.diaulos.domain.RaceDataOnDemand;
import com.atreceno.it.diaulos.domain.VenueDataOnDemand;
import com.atreceno.it.diaulos.repository.RaceRepository;
import com.atreceno.it.diaulos.service.RaceService;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect RaceDataOnDemand_Roo_DataOnDemand {
    
    declare @type: RaceDataOnDemand: @Component;
    
    private Random RaceDataOnDemand.rnd = new SecureRandom();
    
    private List<Race> RaceDataOnDemand.data;
    
    @Autowired
    PhaseDataOnDemand RaceDataOnDemand.phaseDataOnDemand;
    
    @Autowired
    VenueDataOnDemand RaceDataOnDemand.venueDataOnDemand;
    
    @Autowired
    RaceService RaceDataOnDemand.raceService;
    
    @Autowired
    RaceRepository RaceDataOnDemand.raceRepository;
    
    public Race RaceDataOnDemand.getNewTransientRace(int index) {
        Race obj = new Race();
        setCode(obj, index);
        setDescription(obj, index);
        setFinishDate(obj, index);
        setName(obj, index);
        setOfficial(obj, index);
        setPhase(obj, index);
        setStartDate(obj, index);
        return obj;
    }
    
    public void RaceDataOnDemand.setCode(Race obj, int index) {
        String code = "codexxx_" + index;
        if (code.length() > 9) {
            code = new Random().nextInt(10) + code.substring(1, 9);
        }
        obj.setCode(code);
    }
    
    public void RaceDataOnDemand.setDescription(Race obj, int index) {
        String description = "description_" + index;
        if (description.length() > 255) {
            description = description.substring(0, 255);
        }
        obj.setDescription(description);
    }
    
    public void RaceDataOnDemand.setFinishDate(Race obj, int index) {
        Date finishDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setFinishDate(finishDate);
    }
    
    public void RaceDataOnDemand.setName(Race obj, int index) {
        String name = "name_" + index;
        if (name.length() > 45) {
            name = name.substring(0, 45);
        }
        obj.setName(name);
    }
    
    public void RaceDataOnDemand.setOfficial(Race obj, int index) {
        Boolean official = Boolean.TRUE;
        obj.setOfficial(official);
    }
    
    public void RaceDataOnDemand.setPhase(Race obj, int index) {
        Phase phase = phaseDataOnDemand.getRandomPhase();
        obj.setPhase(phase);
    }
    
    public void RaceDataOnDemand.setStartDate(Race obj, int index) {
        Date startDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setStartDate(startDate);
    }
    
    public Race RaceDataOnDemand.getSpecificRace(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Race obj = data.get(index);
        Long id = obj.getId();
        return raceService.findRace(id);
    }
    
    public Race RaceDataOnDemand.getRandomRace() {
        init();
        Race obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return raceService.findRace(id);
    }
    
    public boolean RaceDataOnDemand.modifyRace(Race obj) {
        return false;
    }
    
    public void RaceDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = raceService.findRaceEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Race' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Race>();
        for (int i = 0; i < 10; i++) {
            Race obj = getNewTransientRace(i);
            try {
                raceService.saveRace(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            raceRepository.flush();
            data.add(obj);
        }
    }
    
}
