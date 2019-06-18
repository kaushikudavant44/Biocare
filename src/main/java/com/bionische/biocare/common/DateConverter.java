package com.bionische.biocare.common;

 

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateConverter {

	
	

	
	// To convert string to ymd format date
	public static String convertToYMD(String date) {
		 
		String convertedDate=null;
		if(date!=null) {
		try {
			SimpleDateFormat ymdSDF = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat dmySDF = new SimpleDateFormat("dd-MM-yyyy");
			Date dmyDate = dmySDF.parse(date);
			
			convertedDate=ymdSDF.format(dmyDate);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		return convertedDate;

	}
	
public static String convertToDMY(String date) {
		
		String convertedDate=null;
		if(date!=null) {
		try {
			SimpleDateFormat ymdSDF = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat ymdSDF2 = new SimpleDateFormat("yyyy-MM-dd");

			
			SimpleDateFormat dmySDF = new SimpleDateFormat("dd-MM-yyyy");

			Date ymdDate = ymdSDF2.parse(date);
			
			convertedDate=dmySDF.format(ymdDate);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		return convertedDate;

	}
	
public static java.sql.Date convertToSqlDate(String date) {
		
		java.sql.Date convertedDate=null;
		try {
			SimpleDateFormat ymdSDF = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat dmySDF = new SimpleDateFormat("dd-MM-yyyy");

			Date dmyDate = dmySDF.parse(date);
			
			System.out.println("converted util date commons "+dmyDate);

			
			

			convertedDate=new java.sql.Date(dmyDate.getTime());
			System.out.println("converted sql date commons "+convertedDate);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return convertedDate;

	}

	
public static String addMonthInDate(Date date, int month) {
	 
	Calendar c = Calendar.getInstance(); 
	c.setTime(date); 
	c.add(Calendar.MONTH, month);
	return new SimpleDateFormat("yyyy-MM-dd").format(c.getTime());
}

public static String addDaysInDate(Date date, int days) {
	
	Calendar c = Calendar.getInstance(); 
	c.setTime(date); 
	c.add(Calendar.DATE, days);
	
	return new SimpleDateFormat("yyyy-MM-dd").format(c.getTime());
}


}
