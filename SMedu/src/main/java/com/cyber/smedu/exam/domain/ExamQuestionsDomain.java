package com.cyber.smedu.exam.domain;

public class ExamQuestionsDomain {
	
	//���蹮�� ���� VO
	
	private String examQuestionCode;
	private String testPaperCode;
	private int examQuestionNo;	//���蹮�� ��ȣ
	private int examQuestionAnswer;	//���蹮�� ����
	private int examQuestionScore;	//���蹮�� ����
	private String examFileName;
	private String examFileExt;
	private int examFileSize;
	private String examFileType;
	private String examOriginFileName;
	private String openSubjectCode;
	private String academicCalendarCode;
	
	
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
	public String getExamQuestionCode() {
		return examQuestionCode;
	}
	public void setExamQuestionCode(String examQuestionCode) {
		this.examQuestionCode = examQuestionCode;
	}
	public String getTestPaperCode() {
		return testPaperCode;
	}
	public void setTestPaperCode(String testPaperCode) {
		this.testPaperCode = testPaperCode;
	}
	public int getExamQuestionNo() {
		return examQuestionNo;
	}
	public void setExamQuestionNo(int examQuestionNo) {
		this.examQuestionNo = examQuestionNo;
	}
	public int getExamQuestionAnswer() {
		return examQuestionAnswer;
	}
	public void setExamQuestionAnswer(int examQuestionAnswer) {
		this.examQuestionAnswer = examQuestionAnswer;
	}
	public int getExamQuestionScore() {
		return examQuestionScore;
	}
	public void setExamQuestionScore(int examQuestionScore) {
		this.examQuestionScore = examQuestionScore;
	}
	public String getExamFileName() {
		return examFileName;
	}
	public void setExamFileName(String examFileName) {
		this.examFileName = examFileName;
	}
	public String getExamFileExt() {
		return examFileExt;
	}
	public void setExamFileExt(String examFileExt) {
		this.examFileExt = examFileExt;
	}
	public int getExamFileSize() {
		return examFileSize;
	}
	public void setExamFileSize(int examFileSize) {
		this.examFileSize = examFileSize;
	}
	public String getExamFileType() {
		return examFileType;
	}
	public void setExamFileType(String examFileType) {
		this.examFileType = examFileType;
	}
	public String getExamOriginFileName() {
		return examOriginFileName;
	}
	public void setExamOriginFileName(String examOriginFileName) {
		this.examOriginFileName = examOriginFileName;
	}
	
	@Override
	public String toString() {
		return "ExamQuestionsDomain [examQuestionCode=" + examQuestionCode + ", testPaperCode=" + testPaperCode
				+ ", examQuestionNo=" + examQuestionNo + ", examQuestionAnswer=" + examQuestionAnswer
				+ ", examQuestionScore=" + examQuestionScore + ", examFileName=" + examFileName + ", examFileExt="
				+ examFileExt + ", examFileSize=" + examFileSize + ", examFileType=" + examFileType
				+ ", examOriginFileName=" + examOriginFileName + ", openSubjectCode=" + openSubjectCode
				+ ", academicCalendarCode=" + academicCalendarCode + "]";
	}
	

	
	
}
