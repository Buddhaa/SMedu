package com.cyber.smedu.user.domain;

public class PlannerDomain {
	private String plannerCode;
	private String userCode;
	private String plannerKakao;
	
	public String getPlannerCode() {
		return plannerCode;
	}
	public void setPlannerCode(String plannerCode) {
		this.plannerCode = plannerCode;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getPlannerKakao() {
		return plannerKakao;
	}
	public void setPlannerKakao(String plannerKakao) {
		this.plannerKakao = plannerKakao;
	}
	
	@Override
	public String toString() {
		return "PlannerDomain [plannerCode=" + plannerCode + ", userCode=" + userCode + ", plannerKakao=" + plannerKakao
				+ "]";
	}
}
