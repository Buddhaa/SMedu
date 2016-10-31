package com.cyber.smedu.opensubject.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class LectureDomain {
	
	private String lectureCode;
	private String openSubjectCode;
	private String lectureSubject;
	private String lectureContent;
	private String lectureLink;
	private Timestamp lectureTime;
	private Date lectureRegisterDate;
	
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
	public Timestamp getLectureTime() {
		return lectureTime;
	}
	public void setLectureTime(Timestamp lectureTime) {
		this.lectureTime = lectureTime;
	}
	public Date getLectureRegisterDate() {
		return lectureRegisterDate;
	}
	public void setLectureRegisterDate(Date lectureRegisterDate) {
		this.lectureRegisterDate = lectureRegisterDate;
	}
	
	@Override
	public String toString() {
		return "LectureDomain [lectureCode=" + lectureCode + ", openSubjectCode=" + openSubjectCode
				+ ", lectureSubject=" + lectureSubject + ", lectureContent=" + lectureContent + ", lectureLink="
				+ lectureLink + ", lectureTime=" + lectureTime + ", lectureRegisterDate=" + lectureRegisterDate + "]";
	}
}
