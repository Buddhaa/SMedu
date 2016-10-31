package com.cyber.smedu.evaluation.domain;

import java.util.Date;

public class EvaluationDomain {
	private String lectureEvaluationCode;
	private String studentCode;
	private String openSubjectCode;
	private String lectureEvaluationItemsCode;
	private int lectureEvaluationScore;
	private Date lectureEvaluationDate;
	public String getLectureEvaluationCode() {
		return lectureEvaluationCode;
	}
	public void setLectureEvaluationCode(String lectureEvaluationCode) {
		this.lectureEvaluationCode = lectureEvaluationCode;
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
	public String getLectureEvaluationItemsCode() {
		return lectureEvaluationItemsCode;
	}
	public void setLectureEvaluationItemsCode(String lectureEvaluationItemsCode) {
		this.lectureEvaluationItemsCode = lectureEvaluationItemsCode;
	}
	public int getLectureEvaluationScore() {
		return lectureEvaluationScore;
	}
	public void setLectureEvaluationScore(int lectureEvaluationScore) {
		this.lectureEvaluationScore = lectureEvaluationScore;
	}
	public Date getLectureEvaluationDate() {
		return lectureEvaluationDate;
	}
	public void setLectureEvaluationDate(Date lectureEvaluationDate) {
		this.lectureEvaluationDate = lectureEvaluationDate;
	}
	@Override
	public String toString() {
		return "EvaluationDomain [lectureEvaluationCode=" + lectureEvaluationCode + ", studentCode=" + studentCode
				+ ", openSubjectCode=" + openSubjectCode + ", lectureEvaluationItemsCode=" + lectureEvaluationItemsCode
				+ ", lectureEvaluationScore=" + lectureEvaluationScore + ", lectureEvaluationDate="
				+ lectureEvaluationDate + "]";
	}
	
}
