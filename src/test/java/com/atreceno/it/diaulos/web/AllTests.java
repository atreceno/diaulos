package com.atreceno.it.diaulos.web;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

@RunWith(Suite.class)
@SuiteClasses({ TestLogin.class, TestSport.class, TestEvent.class,
		TestPhase.class, TestRace.class, TestParticipant.class,
		TestParticEvent.class })
public class AllTests {

}
