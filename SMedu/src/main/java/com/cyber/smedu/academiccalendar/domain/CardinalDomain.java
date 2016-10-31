package com.cyber.smedu.academiccalendar.domain;

import java.sql.Date;

public class CardinalDomain {
	private String cardinalCode;
	private int year;
	private String semester;
	private String cardinal;
	private Date recruitStartDay;
	private Date recruitEndDay;
	private Date classStartDay;
	private Date classEndDay;
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
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public String getCardinal() {
		return cardinal;
	}
	public void setCardinal(String cardinal) {
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

	@Override
	public String toString() {
		return "CardinalDomain [cardinalCode=" + cardinalCode + ", year=" + year + ", semester=" + semester
				+ ", cardinal=" + cardinal + ", recruitStartDay=" + recruitStartDay + ", recruitEndDay=" + recruitEndDay
				+ ", classStartDay=" + classStartDay + ", classEndDay=" + classEndDay + "]";
	}	
}
