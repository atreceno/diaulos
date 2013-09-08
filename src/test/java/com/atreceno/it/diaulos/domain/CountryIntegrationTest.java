package com.atreceno.it.diaulos.domain;

import org.junit.Test;
import org.springframework.roo.addon.test.RooIntegrationTest;

@RooIntegrationTest(entity = Country.class, findAllMaximum = 300, persist = false)
public class CountryIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }
}
