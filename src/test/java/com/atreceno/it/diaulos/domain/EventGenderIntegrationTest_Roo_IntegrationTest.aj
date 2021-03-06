// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.EventGender;
import com.atreceno.it.diaulos.domain.EventGenderDataOnDemand;
import com.atreceno.it.diaulos.domain.EventGenderIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect EventGenderIntegrationTest_Roo_IntegrationTest {
    
    declare @type: EventGenderIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: EventGenderIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: EventGenderIntegrationTest: @Transactional;
    
    @Autowired
    EventGenderDataOnDemand EventGenderIntegrationTest.dod;
    
    @Test
    public void EventGenderIntegrationTest.testCountEventGenders() {
        Assert.assertNotNull("Data on demand for 'EventGender' failed to initialize correctly", dod.getRandomEventGender());
        long count = EventGender.countEventGenders();
        Assert.assertTrue("Counter for 'EventGender' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void EventGenderIntegrationTest.testFindEventGender() {
        EventGender obj = dod.getRandomEventGender();
        Assert.assertNotNull("Data on demand for 'EventGender' failed to initialize correctly", obj);
        String id = obj.getCode();
        Assert.assertNotNull("Data on demand for 'EventGender' failed to provide an identifier", id);
        obj = EventGender.findEventGender(id);
        Assert.assertNotNull("Find method for 'EventGender' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'EventGender' returned the incorrect identifier", id, obj.getCode());
    }
    
    @Test
    public void EventGenderIntegrationTest.testFindAllEventGenders() {
        Assert.assertNotNull("Data on demand for 'EventGender' failed to initialize correctly", dod.getRandomEventGender());
        long count = EventGender.countEventGenders();
        Assert.assertTrue("Too expensive to perform a find all test for 'EventGender', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<EventGender> result = EventGender.findAllEventGenders();
        Assert.assertNotNull("Find all method for 'EventGender' illegally returned null", result);
        Assert.assertTrue("Find all method for 'EventGender' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void EventGenderIntegrationTest.testFindEventGenderEntries() {
        Assert.assertNotNull("Data on demand for 'EventGender' failed to initialize correctly", dod.getRandomEventGender());
        long count = EventGender.countEventGenders();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<EventGender> result = EventGender.findEventGenderEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'EventGender' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'EventGender' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void EventGenderIntegrationTest.testFlush() {
        EventGender obj = dod.getRandomEventGender();
        Assert.assertNotNull("Data on demand for 'EventGender' failed to initialize correctly", obj);
        String id = obj.getCode();
        Assert.assertNotNull("Data on demand for 'EventGender' failed to provide an identifier", id);
        obj = EventGender.findEventGender(id);
        Assert.assertNotNull("Find method for 'EventGender' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyEventGender(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'EventGender' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void EventGenderIntegrationTest.testMergeUpdate() {
        EventGender obj = dod.getRandomEventGender();
        Assert.assertNotNull("Data on demand for 'EventGender' failed to initialize correctly", obj);
        String id = obj.getCode();
        Assert.assertNotNull("Data on demand for 'EventGender' failed to provide an identifier", id);
        obj = EventGender.findEventGender(id);
        boolean modified =  dod.modifyEventGender(obj);
        Integer currentVersion = obj.getVersion();
        EventGender merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getCode(), id);
        Assert.assertTrue("Version for 'EventGender' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
}
