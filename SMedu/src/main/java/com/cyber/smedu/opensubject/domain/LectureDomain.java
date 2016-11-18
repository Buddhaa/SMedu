package com.cyber.smedu.opensubject.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class LectureDomain {
	
	private String lectureCode;
	private String openSubjectCode;
	private String lectureSubject;
	private String lectureContent;
	private String lectureLink;
	private String professorName;
	private String bookName;
	private String cardinalCode;
	private String lectureTime;
	private Date lectureRegisterDate;
	private String weeklySchedule;
	private String academicCalendarStartDay;
	private String academicCalendarEndDay;
	
	private String academicCalendarCode;
	
	public String getAcademicCalendarCode() {
		return academicCalendarCode;
	}
	public void setAcademicCalendarCode(String academicCalendarCode) {
		this.academicCalendarCode = academicCalendarCode;
	}
	public String getLectureCode() {
		return lectureCode;
	}
	public void setLectureCode(String lectureCode) {
		this.lectureCode = lectureCode;
	}
	public String getOpenSubjectCode() {
		return openSubjectCode;
	}
	public void setOpenSubjectCode(String openSubjectCode) {
		this.openSubjectCode = openSubjectCode;
	}
	public String getLectureSubject() {
		return lectureSubject;
	}
	public void setLectureSubject(String lectureSubject) {
		this.lectureSubject = lectureSubject;
	}
	public String getLectureContent() {
		return lectureContent;
	}
	public void setLectureContent(String lectureContent) {
		this.lectureContent = lectureContent;
	}
	public String getLectureLink() {
		return lectureLink;
	}
	public void setLectureLink(String lectureLink) {
		this.lectureLink = lectureLink;
	}
	public String getProfessorName() {
		return professorName;
	}
	public void setProfessorName(String professorName) {
		this.professorName = professorName;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getCardinalCode() {
		return cardinalCode;
	}
	public void setCardinalCode(String cardinalCode) {
		this.cardinalCode = cardinalCode;
	}
	public String getLectureTime() {
		return lectureTime;
	}
	public void setLectureTime(String lectureTime) {
		this.lectureTime = lectureTime;
	}
	public Date getLectureRegisterDate() {
		return lectureRegisterDate;
	}
	public void setLectureRegisterDate(Date lectureRegisterDate) {
		this.lectureRegisterDate = lectureRegisterDate;
	}
	public String getWeeklySchedule() {
		return weeklySchedule;
	}
	public void setWeeklySchedule(String weeklySchedule) {
		this.weeklySchedule = weeklySchedule;
	}
	public String getAcademicCalendarStartDay() {
		return academicCalendarStartDay;
	}
	public void setAcademicCalendarStartDay(String academicCalendarStartDay) {
		this.academicCalendarStartDay = academicCalendarStartDay;
	}
	public String getAcademicCalendarEndDay() {
		return academicCalendarEndDay;
	}
	public void setAcademicCalendarEndDay(String academicCalendarEndDay) {
		this.academicCalendarEndDay = academicCalendarEndDay;
	}
	
	@Override
	public String toString() {
		return "LectureDomain [lectureCode=" + lectureCode + ", openSubjectCode=" + openSubjectCode
				+ ", lectureSubject=" + lectureSubject + ", lectureContent=" + lectureContent + ", lectureLink="
				+ lectureLink + ", professorName=" + professorName + ", bookName=" + bookName + ", cardinalCode="
				+ cardinalCode + ", lectureTime=" + lectureTime + ", lectureRegisterDate=" + lectureRegisterDate
				+ ", weeklySchedule=" + weeklySchedule + ", academicCalendarStartDay=" + academicCalendarStartDay
				+ ", academicCalendarEndDay=" + academicCalendarEndDay + "]";
	}
	
}
