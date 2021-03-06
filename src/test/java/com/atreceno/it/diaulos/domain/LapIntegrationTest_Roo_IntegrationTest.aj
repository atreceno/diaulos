// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.LapDataOnDemand;
import com.atreceno.it.diaulos.domain.LapIntegrationTest;
import com.atreceno.it.diaulos.repository.LapRepository;
import com.atreceno.it.diaulos.service.LapService;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect LapIntegrationTest_Roo_IntegrationTest {
    
    declare @type: LapIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: LapIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: LapIntegrationTest: @Transactional;
    
    @Autowired
    LapDataOnDemand LapIntegrationTest.dod;
    
    @Autowired
    LapService LapIntegrationTest.lapService;
    
    @Autowired
    LapRepository LapIntegrationTest.lapRepository;
    
    @Test
    public void LapIntegrationTest.testCountAllLaps() {
        Assert.assertNotNull("Data on demand for 'Lap' failed to initialize correctly", dod.getRandomLap());
        long count = lapService.countAllLaps();
        Assert.assertTrue("Counter for 'Lap' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void LapIntegrationTest.testFindLap() {
        Lap obj = dod.getRandomLap();
        Assert.assertNotNull("Data on demand for 'Lap' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Lap' failed to provide an identifier", id);
        obj = lapService.findLap(id);
        Assert.assertNotNull("Find method for 'Lap' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Lap' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void LapIntegrationTest.testFindAllLaps() {
        Assert.assertNotNull("Data on demand for 'Lap' failed to initialize correctly", dod.getRandomLap());
        long count = lapService.countAllLaps();
        Assert.assertTrue("Too expensive to perform a find all test for 'Lap', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Lap> result = lapService.findAllLaps();
        Assert.assertNotNull("Find all method for 'Lap' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Lap' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void LapIntegrationTest.testFindLapEntries() {
        Assert.assertNotNull("Data on demand for 'Lap' failed to initialize correctly", dod.getRandomLap());
        long count = lapService.countAllLaps();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Lap> result = lapService.findLapEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Lap' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Lap' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void LapIntegrationTest.testFlush() {
        Lap obj = dod.getRandomLap();
        Assert.assertNotNull("Data on demand for 'Lap' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Lap' failed to provide an identifier", id);
        obj = lapService.findLap(id);
        Assert.assertNotNull("Find method for 'Lap' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyLap(obj);
        Integer currentVersion = obj.getVersion();
        lapRepository.flush();
        Assert.assertTrue("Version for 'Lap' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void LapIntegrationTest.testUpdateLapUpdate() {
        Lap obj = dod.getRandomLap();
        Assert.assertNotNull("Data on demand for 'Lap' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Lap' failed to provide an identifier", id);
        obj = lapService.findLap(id);
        boolean modified =  dod.modifyLap(obj);
        Integer currentVersion = obj.getVersion();
        Lap merged = lapService.updateLap(obj);
        lapRepository.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Lap' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void LapIntegrationTest.testSaveLap() {
        Assert.assertNotNull("Data on demand for 'Lap' failed to initialize correctly", dod.getRandomLap());
        Lap obj = dod.getNewTransientLap(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Lap' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Lap' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'Lap' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void LapIntegrationTest.testDeleteLap() {
        Lap obj = dod.getRandomLap();
        Assert.assertNotNull("Data on demand for 'Lap' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Lap' failed to provide an identifier", id);
        obj = lapService.findLap(id);
        lapService.deleteLap(obj);
        lapRepository.flush();
        Assert.assertNull("Failed to remove 'Lap' with identifier '" + id + "'", lapService.findLap(id));
    }
    
}
