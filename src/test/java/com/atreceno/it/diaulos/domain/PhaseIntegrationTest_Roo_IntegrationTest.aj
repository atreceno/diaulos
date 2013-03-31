// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.PhaseDataOnDemand;
import com.atreceno.it.diaulos.domain.PhaseIntegrationTest;
import com.atreceno.it.diaulos.repository.PhaseRepository;
import com.atreceno.it.diaulos.service.PhaseService;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PhaseIntegrationTest_Roo_IntegrationTest {
    
    declare @type: PhaseIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: PhaseIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: PhaseIntegrationTest: @Transactional;
    
    @Autowired
    PhaseDataOnDemand PhaseIntegrationTest.dod;
    
    @Autowired
    PhaseService PhaseIntegrationTest.phaseService;
    
    @Autowired
    PhaseRepository PhaseIntegrationTest.phaseRepository;
    
    @Test
    public void PhaseIntegrationTest.testCountAllPhases() {
        Assert.assertNotNull("Data on demand for 'Phase' failed to initialize correctly", dod.getRandomPhase());
        long count = phaseService.countAllPhases();
        Assert.assertTrue("Counter for 'Phase' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void PhaseIntegrationTest.testFindPhase() {
        Phase obj = dod.getRandomPhase();
        Assert.assertNotNull("Data on demand for 'Phase' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Phase' failed to provide an identifier", id);
        obj = phaseService.findPhase(id);
        Assert.assertNotNull("Find method for 'Phase' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Phase' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void PhaseIntegrationTest.testFindAllPhases() {
        Assert.assertNotNull("Data on demand for 'Phase' failed to initialize correctly", dod.getRandomPhase());
        long count = phaseService.countAllPhases();
        Assert.assertTrue("Too expensive to perform a find all test for 'Phase', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Phase> result = phaseService.findAllPhases();
        Assert.assertNotNull("Find all method for 'Phase' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Phase' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void PhaseIntegrationTest.testFindPhaseEntries() {
        Assert.assertNotNull("Data on demand for 'Phase' failed to initialize correctly", dod.getRandomPhase());
        long count = phaseService.countAllPhases();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Phase> result = phaseService.findPhaseEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Phase' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Phase' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void PhaseIntegrationTest.testFlush() {
        Phase obj = dod.getRandomPhase();
        Assert.assertNotNull("Data on demand for 'Phase' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Phase' failed to provide an identifier", id);
        obj = phaseService.findPhase(id);
        Assert.assertNotNull("Find method for 'Phase' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPhase(obj);
        Integer currentVersion = obj.getVersion();
        phaseRepository.flush();
        Assert.assertTrue("Version for 'Phase' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PhaseIntegrationTest.testUpdatePhaseUpdate() {
        Phase obj = dod.getRandomPhase();
        Assert.assertNotNull("Data on demand for 'Phase' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Phase' failed to provide an identifier", id);
        obj = phaseService.findPhase(id);
        boolean modified =  dod.modifyPhase(obj);
        Integer currentVersion = obj.getVersion();
        Phase merged = phaseService.updatePhase(obj);
        phaseRepository.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Phase' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PhaseIntegrationTest.testSavePhase() {
        Assert.assertNotNull("Data on demand for 'Phase' failed to initialize correctly", dod.getRandomPhase());
        Phase obj = dod.getNewTransientPhase(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Phase' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Phase' identifier to be null", obj.getId());
        phaseService.savePhase(obj);
        phaseRepository.flush();
        Assert.assertNotNull("Expected 'Phase' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void PhaseIntegrationTest.testDeletePhase() {
        Phase obj = dod.getRandomPhase();
        Assert.assertNotNull("Data on demand for 'Phase' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Phase' failed to provide an identifier", id);
        obj = phaseService.findPhase(id);
        phaseService.deletePhase(obj);
        phaseRepository.flush();
        Assert.assertNull("Failed to remove 'Phase' with identifier '" + id + "'", phaseService.findPhase(id));
    }
    
}
