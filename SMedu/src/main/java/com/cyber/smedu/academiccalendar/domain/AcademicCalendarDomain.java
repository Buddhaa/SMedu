package com.cyber.smedu.academiccalendar.domain;

import java.sql.Date;

public class AcademicCalendarDomain {
	private String academicCalendarCode;
	private String cardinalCode;
	private String weeklySchedule;
	private Date academicCalendarStartDay;
	private Date academicCalendarEndDay;
	
	public String getAcademicCalendarCode() {
		return academicCalendarCode;
	}
	public void setAcademicCalendarCode(String academicCalendarCode) {
		this.academicCalendarCode = academicCalendarCode;
	}
	public String getCardinalCode() {
		return cardinalCode;
	}
	public void setCardinalCode(String cardinalCode) {
		this.cardinalCode = cardinalCode;
	}
	public String getWeeklySchedule() {
		return weeklySchedule;
	}
	public void setWeeklySchedule(String weeklySchedule) {
		this.weeklySchedule = weeklySchedule;
	}
	public Date getAcademicCalendarStartDay() {
		return academicCalendarStartDay;
	}
	public void setAcademicCalendarStartDay(Date academicCalendarStartDay) {
		this.academicCalendarStartDay = academicCalendarStartDay;
	}
	public Date getAcademicCalendarEndDay() {
		return academicCalendarEndDay;
	}
	public void setAcademicCalendarEndDay(Date academicCalendarEndDay) {
		this.academicCalendarEndDay = academicCalendarEndDay;
	}
	
	@Override
	public String toString() {
		return "AcademicCalendarDomain [academicCalendarCode=" + academicCalendarCode + ", cardinalCode=" + cardinalCode
				+ ", weeklySchedule=" + weeklySchedule + ", academicCalendarStartDay=" + academicCalendarStartDay
				+ ", academicCalendarEndDay=" + academicCalendarEndDay + "]";
	}	
}
