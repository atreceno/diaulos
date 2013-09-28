package com.atreceno.it.diaulos.web;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.util.concurrent.TimeUnit;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

public class SeleniumParticEvent {
	private WebDriver driver;
	private String baseUrl;
	private StringBuffer verificationErrors = new StringBuffer();

	@Before
	public void setUp() throws Exception {
		driver = new FirefoxDriver();
		baseUrl = "http://localhost:8080/diaulos";
		driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
	}

	@Test
	public void testParticEvent() throws Exception {

		// Login first
		driver.get(baseUrl + "/login");
		driver.findElement(By.id("j_username")).sendKeys("agustin");
		driver.findElement(By.id("j_password")).sendKeys("olympic");
		driver.findElement(By.id("proceed")).click();

		driver.get(baseUrl + "/particevents?form");
//		driver.findElement(By.linkText("Create new Partic Event")).click();
		driver.findElement(By.id("_event_id")).clear();
		driver.findElement(By.id("_event_id")).sendKeys("");
		driver.findElement(By.id("_event_id")).sendKeys(
				"AAGEE1 - Selenium Event");
		driver.findElement(By.id("_participant_id")).clear();
		driver.findElement(By.id("_participant_id")).sendKeys("");
		driver.findElement(By.id("_participant_id")).sendKeys(
				"A123456 - Chris Hoy");
		driver.findElement(By.id("_medal_id")).clear();
		driver.findElement(By.id("_medal_id")).sendKeys("");
		driver.findElement(By.id("_medal_id")).sendKeys("Gold");
		driver.findElement(By.id("_rank_id")).sendKeys("1");
		driver.findElement(By.id("_result_id")).sendKeys("9.713");
		driver.findElement(By.id("proceed")).click();
		try {
			assertEquals(
					"AAGEE1 - Selenium Event",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_ParticEvent_event_event_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			assertEquals(
					"A123456 - Chris Hoy",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_ParticEvent_participant_participant_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			assertEquals(
					"Gold",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_ParticEvent_medal_medal_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			assertEquals(
					"1",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_ParticEvent_rank_rank_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			assertEquals(
					"9.713",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_ParticEvent_result_result_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		driver.findElement(By.linkText("List all Partic Events")).click();
	}

	@After
	public void tearDown() throws Exception {
		driver.quit();
		String verificationErrorString = verificationErrors.toString();
		if (!"".equals(verificationErrorString)) {
			fail(verificationErrorString);
		}
	}

}
