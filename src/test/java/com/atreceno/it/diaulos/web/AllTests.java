package com.atreceno.it.diaulos.web;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

@RunWith(Suite.class)
@SuiteClasses({ SeleniumLogin.class, SeleniumSport.class, SeleniumEvent.class,
		SeleniumPhase.class, SeleniumRace.class, SeleniumParticipant.class,
		SeleniumParticEvent.class, SeleniumUndo.class })
public class AllTests {

}
