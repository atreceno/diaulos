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

public class TestPhase {
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
	public void testPhase() throws Exception {

		// Login first
		driver.get(baseUrl + "/login");
		driver.findElement(By.id("j_username")).sendKeys("agustin");
		driver.findElement(By.id("j_password")).sendKeys("olympic");
		driver.findElement(By.id("proceed")).click();

		driver.get(baseUrl);
		driver.findElement(By.linkText("Create new Phase")).click();
		driver.findElement(By.id("_code_id")).sendKeys("AAGEE1P");
		driver.findElement(By.id("_name_id")).sendKeys("Selenium Phase");
		driver.findElement(By.id("_description_id")).sendKeys(
				"This is a Selenium test.");
		driver.findElement(By.id("_event_id")).clear();
		driver.findElement(By.id("_event_id")).sendKeys("");
		driver.findElement(By.id("_event_id"))
				.sendKeys("AAGEE1 Selenium Event");
		driver.findElement(By.id("proceed")).click();
		try {
			assertEquals(
					"AAGEE1P",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Phase_code_code_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			assertEquals(
					"Selenium Phase",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Phase_name_name_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			assertEquals(
					"This is a Selenium test.",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Phase_description_description_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			assertEquals(
					"AAGEE1 Selenium Event",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Phase_event_event_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		driver.findElement(By.xpath("//img[@alt='Update Phase']")).click();
		driver.findElement(By.id("_description_id")).clear();
		driver.findElement(By.id("_description_id")).sendKeys(
				"This is a Selenium test of the Phase entity.");
		driver.findElement(By.id("proceed")).click();
		try {
			assertEquals(
					"AAGEE1P",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Phase_code_code_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			assertEquals(
					"Selenium Phase",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Phase_name_name_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			assertEquals(
					"This is a Selenium test of the Phase entity.",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Phase_description_description_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			assertEquals(
					"AAGEE1 Selenium Event",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Phase_event_event_id"))
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
