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

public class SeleniumRace {
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
	public void testRace() throws Exception {
		
		// Login first
		driver.get(baseUrl + "/login");
		driver.findElement(By.id("j_username")).sendKeys("agustin");
		driver.findElement(By.id("j_password")).sendKeys("olympic");
		driver.findElement(By.id("proceed")).click();

		driver.get(baseUrl + "/races?form");
//		driver.findElement(By.xpath("//a[@title='Create new Race']")).click();
		driver.findElement(By.id("_code_id")).sendKeys("AAGEE1PR1");
		driver.findElement(By.id("_name_id")).sendKeys("Selenium Race");
		driver.findElement(By.id("_description_id")).sendKeys(
				"This is a Selenium Test");
		driver.findElement(By.id("_startDate_id")).sendKeys(
				"Sep 17, 2013 11:00:00 AM");
		driver.findElement(By.id("_finishDate_id")).sendKeys(
				"Sep 17, 2013 01:00:00 PM");
		driver.findElement(By.id("_phase_id")).clear();
		driver.findElement(By.id("_phase_id")).sendKeys("");
		driver.findElement(By.id("_phase_id")).sendKeys(
				"AAGEE1P - Selenium Phase");
		driver.findElement(By.id("_venue_id")).clear();
		driver.findElement(By.id("_venue_id")).sendKeys("");
		driver.findElement(By.id("_venue_id")).sendKeys(
				"ExCeL - South Arena 2 2000 No address at the moment");
		driver.findElement(By.id("_official_id")).click();
		driver.findElement(By.id("proceed")).submit();
//		driver.findElement(By.id("proceed")).click();
		driver.findElement(By.xpath("//img[@alt='Update Race']")).click();
		driver.findElement(By.id("_official_id")).click();
		driver.findElement(By.id("_description_id")).clear();
		driver.findElement(By.id("_description_id")).sendKeys(
				"This is a Selenium Test of a Race entity.");
		driver.findElement(By.id("proceed")).submit();
//		driver.findElement(By.id("proceed")).click();
		try {
			assertEquals(
					"AAGEE1PR1",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Race_code_code_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			assertEquals(
					"Selenium Race",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Race_name_name_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			assertEquals(
					"This is a Selenium Test of a Race entity.",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Race_description_description_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			assertEquals(
					"false",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Race_official_official_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			assertEquals(
					"AAGEE1P - Selenium Phase",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Race_phase_phase_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			assertEquals(
					"ExCeL - South Arena 2 2000 No address at the moment",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Race_venue_venue_id"))
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
