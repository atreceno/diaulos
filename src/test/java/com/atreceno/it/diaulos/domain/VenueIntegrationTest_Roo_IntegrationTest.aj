// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.Venue;
import com.atreceno.it.diaulos.domain.VenueDataOnDemand;
import com.atreceno.it.diaulos.domain.VenueIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect VenueIntegrationTest_Roo_IntegrationTest {
    
    declare @type: VenueIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: VenueIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: VenueIntegrationTest: @Transactional;
    
    @Autowired
    VenueDataOnDemand VenueIntegrationTest.dod;
    
    @Test
    public void VenueIntegrationTest.testCountVenues() {
        Assert.assertNotNull("Data on demand for 'Venue' failed to initialize correctly", dod.getRandomVenue());
        long count = Venue.countVenues();
        Assert.assertTrue("Counter for 'Venue' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void VenueIntegrationTest.testFindVenue() {
        Venue obj = dod.getRandomVenue();
        Assert.assertNotNull("Data on demand for 'Venue' failed to initialize correctly", obj);
        String id = obj.getCode();
        Assert.assertNotNull("Data on demand for 'Venue' failed to provide an identifier", id);
        obj = Venue.findVenue(id);
        Assert.assertNotNull("Find method for 'Venue' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Venue' returned the incorrect identifier", id, obj.getCode());
    }
    
    @Test
    public void VenueIntegrationTest.testFindAllVenues() {
        Assert.assertNotNull("Data on demand for 'Venue' failed to initialize correctly", dod.getRandomVenue());
        long count = Venue.countVenues();
        Assert.assertTrue("Too expensive to perform a find all test for 'Venue', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Venue> result = Venue.findAllVenues();
        Assert.assertNotNull("Find all method for 'Venue' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Venue' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void VenueIntegrationTest.testFindVenueEntries() {
        Assert.assertNotNull("Data on demand for 'Venue' failed to initialize correctly", dod.getRandomVenue());
        long count = Venue.countVenues();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Venue> result = Venue.findVenueEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Venue' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Venue' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void VenueIntegrationTest.testFlush() {
        Venue obj = dod.getRandomVenue();
        Assert.assertNotNull("Data on demand for 'Venue' failed to initialize correctly", obj);
        String id = obj.getCode();
        Assert.assertNotNull("Data on demand for 'Venue' failed to provide an identifier", id);
        obj = Venue.findVenue(id);
        Assert.assertNotNull("Find method for 'Venue' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyVenue(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Venue' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void VenueIntegrationTest.testMergeUpdate() {
        Venue obj = dod.getRandomVenue();
        Assert.assertNotNull("Data on demand for 'Venue' failed to initialize correctly", obj);
        String id = obj.getCode();
        Assert.assertNotNull("Data on demand for 'Venue' failed to provide an identifier", id);
        obj = Venue.findVenue(id);
        boolean modified =  dod.modifyVenue(obj);
        Integer currentVersion = obj.getVersion();
        Venue merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getCode(), id);
        Assert.assertTrue("Version for 'Venue' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void VenueIntegrationTest.testRemove() {
        Venue obj = dod.getRandomVenue();
        Assert.assertNotNull("Data on demand for 'Venue' failed to initialize correctly", obj);
        String id = obj.getCode();
        Assert.assertNotNull("Data on demand for 'Venue' failed to provide an identifier", id);
        obj = Venue.findVenue(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Venue' with identifier '" + id + "'", Venue.findVenue(id));
    }
    
}
