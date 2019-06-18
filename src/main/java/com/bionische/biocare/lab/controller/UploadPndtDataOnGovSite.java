package com.bionische.biocare.lab.controller;

import com.bionische.biocare.lab.model.RadiologistPndtDetails;
import com.bionische.biocare.radiology.model.PNDTPatientDetails;

public class UploadPndtDataOnGovSite {

	public static boolean uploadData(PNDTPatientDetails pndtPatientDetails,RadiologistPndtDetails radiologistPndtDetails) throws InterruptedException {
		
		
		//  System.setProperty("webdriver.chrome.driver","C:\\Users\\Jarves\\Downloads\\be proud html\\chromedriver.exe");
	     // WebDriver driver = new ChromeDriver();
	      
		  System.setProperty("webdriver.firefox.marionette","C:\\geckodriver.exe");
		/*  WebDriver driver = new FirefoxDriver();
		  driver.get("https://pcpndt.maharashtra.gov.in/Home/Login.aspx");
	      driver.findElement(By.id("ctl00_CPH_txtusername")).sendKeys(radiologistPndtDetails.getUserName(),Keys.TAB);
	      Thread.sleep(3000);
	      driver.findElement(By.id("ctl00_CPH_txtpassword")).sendKeys(radiologistPndtDetails.getPassword(),Keys.ENTER);
	      Thread.sleep(4000);
	      driver.findElement(By.id("ctl00_CPH_txtFirstName")).sendKeys(pndtPatientDetails.getPatientName(),Keys.TAB);
	      Thread.sleep(2000);
	      driver.findElement(By.id("ctl00_CPH_txtMiddleName")).sendKeys(pndtPatientDetails.getmName(),Keys.TAB);
	      Thread.sleep(2000);
	      driver.findElement(By.id("ctl00_CPH_txtSurname")).sendKeys(pndtPatientDetails.getlName(),Keys.TAB);
	      Thread.sleep(2000);
	      driver.findElement(By.id("ctl00_CPH_txtSurname")).sendKeys(pndtPatientDetails.getlName(),Keys.TAB);
	      Thread.sleep(2000);*/
	      
	    //  driver.close();
		return true;
	}
	
}
