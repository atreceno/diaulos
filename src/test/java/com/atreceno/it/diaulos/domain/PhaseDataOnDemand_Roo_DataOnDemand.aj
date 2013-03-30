// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.Phase;
import com.atreceno.it.diaulos.domain.PhaseDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect PhaseDataOnDemand_Roo_DataOnDemand {
    
    declare @type: PhaseDataOnDemand: @Component;
    
    private Random PhaseDataOnDemand.rnd = new SecureRandom();
    
    private List<Phase> PhaseDataOnDemand.data;
    
    public Phase PhaseDataOnDemand.getNewTransientPhase(int index) {
        Phase obj = new Phase();
        setCode(obj, index);
        setDescription(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void PhaseDataOnDemand.setCode(Phase obj, int index) {
        String code = "codex_" + index;
        if (code.length() > 7) {
            code = new Random().nextInt(10) + code.substring(1, 7);
        }
        obj.setCode(code);
    }
    
    public void PhaseDataOnDemand.setDescription(Phase obj, int index) {
        String description = "description_" + index;
        if (description.length() > 255) {
            description = description.substring(0, 255);
        }
        obj.setDescription(description);
    }
    
    public void PhaseDataOnDemand.setName(Phase obj, int index) {
        String name = "name_" + index;
        if (name.length() > 45) {
            name = name.substring(0, 45);
        }
        obj.setName(name);
    }
    
    public Phase PhaseDataOnDemand.getSpecificPhase(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Phase obj = data.get(index);
        Long id = obj.getId();
        return Phase.findPhase(id);
    }
    
    public Phase PhaseDataOnDemand.getRandomPhase() {
        init();
        Phase obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Phase.findPhase(id);
    }
    
    public boolean PhaseDataOnDemand.modifyPhase(Phase obj) {
        return false;
    }
    
    public void PhaseDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Phase.findPhaseEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Phase' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Phase>();
        for (int i = 0; i < 10; i++) {
            Phase obj = getNewTransientPhase(i);
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
