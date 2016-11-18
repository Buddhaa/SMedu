package com.cyber.smedu.exam.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class TestPaperDomain {
		
	private String testPaperCode;
	private String openSubjectCode;
	private String academicCalendarCode;
	private Date testPaperDate;
	private String testTime; 
	
	private Date academicCalendarStartDay;
	private Date academicCalendarEndDay;
	
	public Date getTestPaperDate() {
		return testPaperDate;
	}
	public void setTestPaperDate(Date testPaperDate) {
		this.testPaperDate = testPaperDate;
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
	public String getTestPaperCode() {
		return testPaperCode;
	}
	public void setTestPaperCode(String testPaperCode) {
		this.testPaperCode = testPaperCode;
	}
	public String getOpenSubjectCode() {
		return openSubjectCode;
	}
	public void setOpenSubjectCode(String openSubjectCode) {
		this.openSubjectCode = openSubjectCode;
	}
	public String getAcademicCalendarCode() {
		return academicCalendarCode;
	}
	public void setAcademicCalendarCode(String academicCalendarCode) {
		this.academicCalendarCode = academicCalendarCode;
	}
	public String getTestTime() {
		return testTime;
	}
	public void setTestTime(String testTime) {
		this.testTime = testTime;
	}
	
	@Override
	public String toString() {
		return "TestPaperDomain [testPaperCode=" + testPaperCode + ", openSubjectCode=" + openSubjectCode
				+ ", academicCalendarCode=" + academicCalendarCode + ", testTime=" + testTime + "]";
	}
}
