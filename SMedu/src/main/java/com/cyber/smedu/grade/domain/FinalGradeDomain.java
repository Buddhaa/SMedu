package com.cyber.smedu.grade.domain;

import java.sql.Date;

public class FinalGradeDomain {
	private String finalResultCompleteConfirmaitionCode;
	private String studentCode;
	private String cardinalCode;
	private String openSubjectCode;
	private int finalResult;
	private char completeConfirmation;
	
	private int year;
	private int semester;
	private int cardinal;
	private Date classStartDay;
	private Date classEndDay;
	private String subjectName;
	private String subjectSort;
	private int subjectCredit;
	private String userName;
	
	
	public String getFinalResultCompleteConfirmaitionCode() {
		return finalResultCompleteConfirmaitionCode;
	}


	public void setFinalResultCompleteConfirmaitionCode(String finalResultCompleteConfirmaitionCode) {
		this.finalResultCompleteConfirmaitionCode = finalResultCompleteConfirmaitionCode;
	}


	public String getStudentCode() {
		return studentCode;
	}


	public void setStudentCode(String studentCode) {
		this.studentCode = studentCode;
	}


	public String getCardinalCode() {
		return cardinalCode;
	}


	public void setCardinalCode(String cardinalCode) {
		this.cardinalCode = cardinalCode;
	}


	public String getOpenSubjectCode() {
		return openSubjectCode;
	}


	public void setOpenSubjectCode(String openSubjectCode) {
		this.openSubjectCode = openSubjectCode;
	}


	public int getFinalResult() {
		return finalResult;
	}


	public void setFinalResult(int finalResult) {
		this.finalResult = finalResult;
	}


	public char getCompleteConfirmation() {
		return completeConfirmation;
	}


	public void setCompleteConfirmation(char completeConfirmation) {
		this.completeConfirmation = completeConfirmation;
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


	public String getSubjectName() {
		return subjectName;
	}


	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}


	public String getSubjectSort() {
		return subjectSort;
	}


	public void setSubjectSort(String subjectSort) {
		this.subjectSort = subjectSort;
	}


	public int getSubjectCredit() {
		return subjectCredit;
	}


	public void setSubjectCredit(int subjectCredit) {
		this.subjectCredit = subjectCredit;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	@Override
	public String toString() {
		return "FinalGradeDoamin [finalResultCompleteConfirmaitionCode=" + finalResultCompleteConfirmaitionCode
				+ ", studentCode=" + studentCode + ", cardinalCode=" + cardinalCode + ", openSubjectCode="
				+ openSubjectCode + ", finalResult=" + finalResult + ", completeConfirmation=" + completeConfirmation
				+ "]";
	}
	
}
