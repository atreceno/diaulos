package com.atreceno.it.diaulos.domain;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.roo.addon.test.RooIntegrationTest;

@RooIntegrationTest(entity = Event.class, findAllMaximum = 700)
public class EventIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }
    
    @Test
    public void testFindEventByCode() {
        Event obj = dod.getRandomEvent();
        Assert.assertNotNull("Data on demand for 'Event' failed to initialize correctly", obj);
        String code = obj.getCode();
        Assert.assertNotNull("Data on demand for 'Event' failed to provide a code", code);
        obj = eventService.findEventByCodeEquals(code);
        Assert.assertNotNull("Find method for 'Event' illegally returned null for code '" + code + "'", obj);
        Assert.assertEquals("Find method for 'Event' returned the incorrect code", code, obj.getCode());
    }
    
}
