package com.cyber.smedu.evaluation.domain;

public class EvaluationCategoryDomain {
	private String lectureEvaluationItemsCode;
	private String lectureEvaluationItems;
	
	public String getLectureEvaluationItemsCode() {
		return lectureEvaluationItemsCode;
	}
	public void setLectureEvaluationItemsCode(String lectureEvaluationItemsCode) {
		this.lectureEvaluationItemsCode = lectureEvaluationItemsCode;
	}
	public String getLectureEvaluationItems() {
		return lectureEvaluationItems;
	}
	public void setLectureEvaluationItems(String lectureEvaluationItems) {
		this.lectureEvaluationItems = lectureEvaluationItems;
	}
	
	@Override
	public String toString() {
		return "EvaluationCategoryDomain [lectureEvaluationItemsCode=" + lectureEvaluationItemsCode
				+ ", lectureEvaluationItems=" + lectureEvaluationItems + "]";
	}
	
}
