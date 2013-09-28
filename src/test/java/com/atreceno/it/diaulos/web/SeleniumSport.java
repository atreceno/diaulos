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

public class SeleniumSport {
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
	public void testSport() throws Exception {

		// Login first
		driver.get(baseUrl + "/login");
		driver.findElement(By.id("j_username")).sendKeys("agustin");
		driver.findElement(By.id("j_password")).sendKeys("olympic");
		driver.findElement(By.id("proceed")).click();

		driver.get(baseUrl + "/sports?form");
		//driver.findElement(By.linkText("Create new Sport")).click();
		driver.findElement(By.id("_code_id")).sendKeys("AA");
		driver.findElement(By.id("_name_id")).sendKeys("Selenium Sport");
		driver.findElement(By.id("_description_id")).sendKeys(
				"This is a Selenium Sport.");
		driver.findElement(By.id("proceed")).click();
		try {
			assertEquals(
					"Selenium Sport",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Sport_name_name_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			assertEquals(
					"This is a Selenium Sport.",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Sport_description_description_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		driver.findElement(By.linkText("Find by Code Equals")).click();
		driver.findElement(By.id("_code_id")).sendKeys("AA");
		driver.findElement(By.id("proceed")).click();
		try {
			assertEquals("Selenium Sport",
					driver.findElement(By.xpath("//table/tbody/tr[1]/td[1]"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			assertEquals("This is a Selenium Sport.",
					driver.findElement(By.xpath("//table/tbody/tr[1]/td[2]"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		driver.findElement(By.xpath("//img[@alt='Update Sport']")).click();
		driver.findElement(By.id("_description_id")).clear();
		driver.findElement(By.id("_description_id")).sendKeys(
				"This is a Selenium Sport (front-end unit testing).");
		driver.findElement(By.id("proceed")).click();
		try {
			assertEquals(
					"Selenium Sport",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Sport_name_name_id"))
							.getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			assertEquals(
					"This is a Selenium Sport (front-end unit testing).",
					driver.findElement(
							By.id("_s_com_atreceno_it_diaulos_domain_Sport_description_description_id"))
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
