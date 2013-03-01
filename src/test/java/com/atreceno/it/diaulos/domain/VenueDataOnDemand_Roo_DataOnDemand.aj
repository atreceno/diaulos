// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.Venue;
import com.atreceno.it.diaulos.domain.VenueDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect VenueDataOnDemand_Roo_DataOnDemand {
    
    declare @type: VenueDataOnDemand: @Component;
    
    private Random VenueDataOnDemand.rnd = new SecureRandom();
    
    private List<Venue> VenueDataOnDemand.data;
    
    public Venue VenueDataOnDemand.getNewTransientVenue(int index) {
        Venue obj = new Venue();
        setAddress(obj, index);
        setCapacity(obj, index);
        setDescription(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void VenueDataOnDemand.setAddress(Venue obj, int index) {
        String address = "address_" + index;
        if (address.length() > 255) {
            address = address.substring(0, 255);
        }
        obj.setAddress(address);
    }
    
    public void VenueDataOnDemand.setCapacity(Venue obj, int index) {
        Integer capacity = new Integer(index);
        if (capacity > 100000) {
            capacity = 100000;
        }
        obj.setCapacity(capacity);
    }
    
    public void VenueDataOnDemand.setDescription(Venue obj, int index) {
        String description = "description_" + index;
        if (description.length() > 255) {
            description = description.substring(0, 255);
        }
        obj.setDescription(description);
    }
    
    public void VenueDataOnDemand.setName(Venue obj, int index) {
        String name = "name_" + index;
        if (name.length() > 25) {
            name = name.substring(0, 25);
        }
        obj.setName(name);
    }
    
    public Venue VenueDataOnDemand.getSpecificVenue(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Venue obj = data.get(index);
        String id = obj.getCode();
        return Venue.findVenue(id);
    }
    
    public Venue VenueDataOnDemand.getRandomVenue() {
        init();
        Venue obj = data.get(rnd.nextInt(data.size()));
        String id = obj.getCode();
        return Venue.findVenue(id);
    }
    
    public boolean VenueDataOnDemand.modifyVenue(Venue obj) {
        return false;
    }
    
    public void VenueDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Venue.findVenueEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Venue' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Venue>();
        for (int i = 0; i < 10; i++) {
            Venue obj = getNewTransientVenue(i);
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
