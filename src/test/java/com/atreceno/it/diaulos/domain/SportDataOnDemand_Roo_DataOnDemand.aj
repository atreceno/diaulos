// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.Sport;
import com.atreceno.it.diaulos.domain.SportDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect SportDataOnDemand_Roo_DataOnDemand {
    
    declare @type: SportDataOnDemand: @Component;
    
    private Random SportDataOnDemand.rnd = new SecureRandom();
    
    private List<Sport> SportDataOnDemand.data;
    
    public Sport SportDataOnDemand.getNewTransientSport(int index) {
        Sport obj = new Sport();
        setDescription(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void SportDataOnDemand.setDescription(Sport obj, int index) {
        String description = "description_" + index;
        if (description.length() > 255) {
            description = description.substring(0, 255);
        }
        obj.setDescription(description);
    }
    
    public void SportDataOnDemand.setName(Sport obj, int index) {
        String name = "name_" + index;
        if (name.length() > 25) {
            name = name.substring(0, 25);
        }
        obj.setName(name);
    }
    
    public Sport SportDataOnDemand.getSpecificSport(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Sport obj = data.get(index);
        String id = obj.getCode();
        return Sport.findSport(id);
    }
    
    public Sport SportDataOnDemand.getRandomSport() {
        init();
        Sport obj = data.get(rnd.nextInt(data.size()));
        String id = obj.getCode();
        return Sport.findSport(id);
    }
    
    public boolean SportDataOnDemand.modifySport(Sport obj) {
        return false;
    }
    
    public void SportDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Sport.findSportEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Sport' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Sport>();
        for (int i = 0; i < 10; i++) {
            Sport obj = getNewTransientSport(i);
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
