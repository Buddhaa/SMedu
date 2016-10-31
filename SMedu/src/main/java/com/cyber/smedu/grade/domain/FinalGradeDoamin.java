package com.cyber.smedu.grade.domain;

public class FinalGradeDoamin {
	private String finalResultCompleteConfirmaitionCode;
	private String studentCode;
	private String cardinalCode;
	private String openSubjectCode;
	private int finalResult;
	private char completeConfirmation;
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
	@Override
	public String toString() {
		return "FinalGradeDoamin [finalResultCompleteConfirmaitionCode=" + finalResultCompleteConfirmaitionCode
				+ ", studentCode=" + studentCode + ", cardinalCode=" + cardinalCode + ", openSubjectCode="
				+ openSubjectCode + ", finalResult=" + finalResult + ", completeConfirmation=" + completeConfirmation
				+ "]";
	}
	
}
