// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.ParticPhaseDataOnDemand;
import com.atreceno.it.diaulos.domain.ParticPhaseIntegrationTest;
import com.atreceno.it.diaulos.repository.ParticPhaseRepository;
import com.atreceno.it.diaulos.service.ParticPhaseService;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ParticPhaseIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ParticPhaseIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ParticPhaseIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ParticPhaseIntegrationTest: @Transactional;
    
    @Autowired
    ParticPhaseDataOnDemand ParticPhaseIntegrationTest.dod;
    
    @Autowired
    ParticPhaseService ParticPhaseIntegrationTest.particPhaseService;
    
    @Autowired
    ParticPhaseRepository ParticPhaseIntegrationTest.particPhaseRepository;
    
    @Test
    public void ParticPhaseIntegrationTest.testCountAllParticPhases() {
        Assert.assertNotNull("Data on demand for 'ParticPhase' failed to initialize correctly", dod.getRandomParticPhase());
        long count = particPhaseService.countAllParticPhases();
        Assert.assertTrue("Counter for 'ParticPhase' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ParticPhaseIntegrationTest.testFindParticPhase() {
        ParticPhase obj = dod.getRandomParticPhase();
        Assert.assertNotNull("Data on demand for 'ParticPhase' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ParticPhase' failed to provide an identifier", id);
        obj = particPhaseService.findParticPhase(id);
        Assert.assertNotNull("Find method for 'ParticPhase' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'ParticPhase' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ParticPhaseIntegrationTest.testFindAllParticPhases() {
        Assert.assertNotNull("Data on demand for 'ParticPhase' failed to initialize correctly", dod.getRandomParticPhase());
        long count = particPhaseService.countAllParticPhases();
        Assert.assertTrue("Too expensive to perform a find all test for 'ParticPhase', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<ParticPhase> result = particPhaseService.findAllParticPhases();
        Assert.assertNotNull("Find all method for 'ParticPhase' illegally returned null", result);
        Assert.assertTrue("Find all method for 'ParticPhase' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ParticPhaseIntegrationTest.testFindParticPhaseEntries() {
        Assert.assertNotNull("Data on demand for 'ParticPhase' failed to initialize correctly", dod.getRandomParticPhase());
        long count = particPhaseService.countAllParticPhases();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<ParticPhase> result = particPhaseService.findParticPhaseEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'ParticPhase' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'ParticPhase' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ParticPhaseIntegrationTest.testFlush() {
        ParticPhase obj = dod.getRandomParticPhase();
        Assert.assertNotNull("Data on demand for 'ParticPhase' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ParticPhase' failed to provide an identifier", id);
        obj = particPhaseService.findParticPhase(id);
        Assert.assertNotNull("Find method for 'ParticPhase' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyParticPhase(obj);
        Integer currentVersion = obj.getVersion();
        particPhaseRepository.flush();
        Assert.assertTrue("Version for 'ParticPhase' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ParticPhaseIntegrationTest.testUpdateParticPhaseUpdate() {
        ParticPhase obj = dod.getRandomParticPhase();
        Assert.assertNotNull("Data on demand for 'ParticPhase' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ParticPhase' failed to provide an identifier", id);
        obj = particPhaseService.findParticPhase(id);
        boolean modified =  dod.modifyParticPhase(obj);
        Integer currentVersion = obj.getVersion();
        ParticPhase merged = particPhaseService.updateParticPhase(obj);
        particPhaseRepository.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'ParticPhase' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ParticPhaseIntegrationTest.testSaveParticPhase() {
        Assert.assertNotNull("Data on demand for 'ParticPhase' failed to initialize correctly", dod.getRandomParticPhase());
        ParticPhase obj = dod.getNewTransientParticPhase(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'ParticPhase' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'ParticPhase' identifier to be null", obj.getId());
        particPhaseService.saveParticPhase(obj);
        particPhaseRepository.flush();
        Assert.assertNotNull("Expected 'ParticPhase' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ParticPhaseIntegrationTest.testDeleteParticPhase() {
        ParticPhase obj = dod.getRandomParticPhase();
        Assert.assertNotNull("Data on demand for 'ParticPhase' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ParticPhase' failed to provide an identifier", id);
        obj = particPhaseService.findParticPhase(id);
        particPhaseService.deleteParticPhase(obj);
        particPhaseRepository.flush();
        Assert.assertNull("Failed to remove 'ParticPhase' with identifier '" + id + "'", particPhaseService.findParticPhase(id));
    }
    
}