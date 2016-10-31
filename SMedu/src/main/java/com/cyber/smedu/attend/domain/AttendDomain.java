package com.cyber.smedu.attend.domain;

import java.sql.Timestamp;

public class AttendDomain {
	private String attendCode;
	private String studentCode;
	private String openSubjectCode;
	private String lectureCode;
	private String academicCalendarCode;
	private Timestamp attendLectureTime;
	private Timestamp attendDate;
	private String attendCompleteConfirmation;
	private int attendScore;
	
	public String getAttendCode() {
		return attendCode;
	}
	public void setAttendCode(String attendCode) {
		this.attendCode = attendCode;
	}
	public String getStudentCode() {
		return studentCode;
	}
	public void setStudentCode(String studentCode) {
		this.studentCode = studentCode;
	}
	public String getOpenSubjectCode() {
		return openSubjectCode;
	}
	public void setOpenSubjectCode(String openSubjectCode) {
		this.openSubjectCode = openSubjectCode;
	}
	public String getLectureCode() {
		return lectureCode;
	}
	public void setLectureCode(String lectureCode) {
		this.lectureCode = lectureCode;
	}
	public String getAcademicCalendarCode() {
		return academicCalendarCode;
	}
	public void setAcademicCalendarCode(String academicCalendarCode) {
		this.academicCalendarCode = academicCalendarCode;
	}
	public Timestamp getAttendLectureTime() {
		return attendLectureTime;
	}
	public void setAttendLectureTime(Timestamp attendLectureTime) {
		this.attendLectureTime = attendLectureTime;
	}
	public Timestamp getAttendDate() {
		return attendDate;
	}
	public void setAttendDate(Timestamp attendDate) {
		this.attendDate = attendDate;
	}
	public String getAttendCompleteConfirmation() {
		return attendCompleteConfirmation;
	}
	public void setAttendCompleteConfirmation(String attendCompleteConfirmation) {
		this.attendCompleteConfirmation = attendCompleteConfirmation;
	}
	public int getAttendScore() {
		return attendScore;
	}
	public void setAttendScore(int attendScore) {
		this.attendScore = attendScore;
	}
	
	@Override
	public String toString() {
		return "AttendDomain [attendCode=" + attendCode + ", studentCode=" + studentCode + ", openSubjectCode="
				+ openSubjectCode + ", lectureCode=" + lectureCode + ", academicCalendarCode=" + academicCalendarCode
				+ ", attendLectureTime=" + attendLectureTime + ", attendDate=" + attendDate
				+ ", attendCompleteConfirmation=" + attendCompleteConfirmation + ", attendScore=" + attendScore + "]";
	}
}
