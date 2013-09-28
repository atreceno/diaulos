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

public class SeleniumParticipant {
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
	public void testParticipant() throws Exception {

		// Login first
		driver.get(baseUrl + "/login");
		driver.findElement(By.id("j_username")).sendKeys("agustin");
		driver.findElement(By.id("j_password")).sendKeys("olympic");
		driver.findElement(By.id("proceed")).click();

		driver.get(baseUrl + "/participants?form");
//		driver.findElement(By.linkText("Create new Participant")).click();
		driver.findElement(By.id("_code_id")).sendKeys("A123456");
		driver.findElement(By.id("_firstName_id")).sendKeys("Chris");
		driver.findElement(By.id("_lastName_id")).sendKeys("Hoy");
		driver.findElement(By.id("_email_id")).sendKeys("chris.hoy@gmail.com");
		driver.findElement(By.id("_birthDate_id")).sendKeys("Mar 23, 1976");
		driver.findElement(By.id("_weight_id")).sendKeys("93");
		driver.findElement(By.id("_height_id")).sendKeys("185");
		driver.findElement(By.id("_country_id")).clear();
		driver.findElement(By.id("_country_id")).sendKeys("");
		driver.findElement(By.id("_country_id")).sendKeys("Great Britain");
		driver.findElement(By.id("proceed")).click();
		try {
			assertEquals(
					"A123456",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Participant_code_code_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		driver.findElement(By.linkText("List all Participants")).click();
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
