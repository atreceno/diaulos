// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.Lap;
import com.atreceno.it.diaulos.domain.LapDataOnDemand;
import com.atreceno.it.diaulos.domain.Race;
import com.atreceno.it.diaulos.domain.RaceDataOnDemand;
import com.atreceno.it.diaulos.repository.LapRepository;
import com.atreceno.it.diaulos.service.LapService;
import java.math.BigDecimal;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect LapDataOnDemand_Roo_DataOnDemand {
    
    declare @type: LapDataOnDemand: @Component;
    
    private Random LapDataOnDemand.rnd = new SecureRandom();
    
    private List<Lap> LapDataOnDemand.data;
    
    @Autowired
    RaceDataOnDemand LapDataOnDemand.raceDataOnDemand;
    
    @Autowired
    LapService LapDataOnDemand.lapService;
    
    @Autowired
    LapRepository LapDataOnDemand.lapRepository;
    
    public Lap LapDataOnDemand.getNewTransientLap(int index) {
        Lap obj = new Lap();
        setCode(obj, index);
        setCumulativeDistance(obj, index);
        setName(obj, index);
        setPartialDistance(obj, index);
        setRace(obj, index);
        return obj;
    }
    
    public void LapDataOnDemand.setCode(Lap obj, int index) {
        String code = "code_" + index;
        obj.setCode(code);
    }
    
    public void LapDataOnDemand.setCumulativeDistance(Lap obj, int index) {
        BigDecimal cumulativeDistance = BigDecimal.valueOf(index);
        obj.setCumulativeDistance(cumulativeDistance);
    }
    
    public void LapDataOnDemand.setName(Lap obj, int index) {
        String name = "name_" + index;
        if (name.length() > 20) {
            name = name.substring(0, 20);
        }
        obj.setName(name);
    }
    
    public void LapDataOnDemand.setPartialDistance(Lap obj, int index) {
        BigDecimal partialDistance = BigDecimal.valueOf(index);
        obj.setPartialDistance(partialDistance);
    }
    
    public void LapDataOnDemand.setRace(Lap obj, int index) {
        Race race = raceDataOnDemand.getRandomRace();
        obj.setRace(race);
    }
    
    public Lap LapDataOnDemand.getSpecificLap(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Lap obj = data.get(index);
        Long id = obj.getId();
        return lapService.findLap(id);
    }
    
    public Lap LapDataOnDemand.getRandomLap() {
        init();
        Lap obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return lapService.findLap(id);
    }
    
    public boolean LapDataOnDemand.modifyLap(Lap obj) {
        return false;
    }
    
    public void LapDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = lapService.findLapEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Lap' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Lap>();
        for (int i = 0; i < 10; i++) {
            Lap obj = getNewTransientLap(i);
            try {
                lapService.saveLap(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            lapRepository.flush();
            data.add(obj);
        }
    }
    
}
