package com.cyber.smedu.academiccalendar.domain;

import java.sql.Date;

public class CardinalDomain {
	private String cardinalCode;
	private int year;
	private int semester;
	private int cardinal;
	private Date recruitStartDay;
	private Date recruitEndDay;
	private Date classStartDay;
	private Date classEndDay;
	private String openSubjectCode;
	private String subjectName;
	public String getCardinalCode() {
		return cardinalCode;
	}
	public void setCardinalCode(String cardinalCode) {
		this.cardinalCode = cardinalCode;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public int getCardinal() {
		return cardinal;
	}
	public void setCardinal(int cardinal) {
		this.cardinal = cardinal;
	}
	public Date getRecruitStartDay() {
		return recruitStartDay;
	}
	public void setRecruitStartDay(Date recruitStartDay) {
		this.recruitStartDay = recruitStartDay;
	}
	public Date getRecruitEndDay() {
		return recruitEndDay;
	}
	public void setRecruitEndDay(Date recruitEndDay) {
		this.recruitEndDay = recruitEndDay;
	}
	public Date getClassStartDay() {
		return classStartDay;
	}
	public void setClassStartDay(Date classStartDay) {
		this.classStartDay = classStartDay;
	}
	public Date getClassEndDay() {
		return classEndDay;
	}
	public void setClassEndDay(Date classEndDay) {
		this.classEndDay = classEndDay;
	}
	public String getOpenSubjectCode() {
		return openSubjectCode;
	}
	public void setOpenSubjectCode(String openSubjectCode) {
		this.openSubjectCode = openSubjectCode;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	@Override
	public String toString() {
		return "CardinalDomain [cardinalCode=" + cardinalCode + ", year=" + year + ", semester=" + semester
				+ ", cardinal=" + cardinal + ", recruitStartDay=" + recruitStartDay + ", recruitEndDay=" + recruitEndDay
				+ ", classStartDay=" + classStartDay + ", classEndDay=" + classEndDay + ", openSubjectCode="
				+ openSubjectCode + ", subjectName=" + subjectName + "]";
	}
	
}
