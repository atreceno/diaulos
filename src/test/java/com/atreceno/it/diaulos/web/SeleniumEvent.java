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

public class SeleniumEvent {
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
	public void testEvent() throws Exception {

		// Login first
		driver.get(baseUrl + "/login");
		driver.findElement(By.id("j_username")).sendKeys("agustin");
		driver.findElement(By.id("j_password")).sendKeys("olympic");
		driver.findElement(By.id("proceed")).click();

		driver.get(baseUrl + "/events?form");
//		driver.findElement(By.linkText("Create new Event")).click();
		driver.findElement(By.id("_code_id")).sendKeys("AAGEE1");
		driver.findElement(By.id("_name_id")).sendKeys("Selenium Event");
		driver.findElement(By.id("_description_id")).sendKeys(
				"This is a Selenium test.");
		driver.findElement(By.id("_gender_id")).clear();
		driver.findElement(By.id("_gender_id")).sendKeys("");
		driver.findElement(By.id("_gender_id")).sendKeys("Mixed");
		driver.findElement(By.id("_sport_id")).clear();
		driver.findElement(By.id("_sport_id")).sendKeys("");
		driver.findElement(By.id("_sport_id")).sendKeys("Selenium Sport");
		driver.findElement(By.id("proceed")).click();
		try {
			assertEquals(
					"AAGEE1",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Event_code_code_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			assertEquals(
					"Selenium Event",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Event_name_name_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			assertEquals(
					"This is a Selenium test.",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Event_description_description_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			assertEquals(
					"Mixed",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Event_gender_gender_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			assertEquals(
					"Selenium Sport",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Event_sport_sport_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		driver.findElement(By.xpath("//img[@alt='Update Event']")).click();
		driver.findElement(By.id("_description_id")).clear();
		driver.findElement(By.id("_description_id")).sendKeys(
				"This is a Selenium test for the Event entity.");
		driver.findElement(By.id("proceed")).click();
		try {
			assertEquals(
					"AAGEE1",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Event_code_code_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			assertEquals(
					"Selenium Event",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Event_name_name_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			assertEquals(
					"This is a Selenium test for the Event entity.",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Event_description_description_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			assertEquals(
					"Mixed",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Event_gender_gender_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			assertEquals(
					"Selenium Sport",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Event_sport_sport_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
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
