package com.cyber.smedu.pay.domain;

import java.sql.Timestamp;

public class PayDomain {

	private String payCode;
	private String studentCode;
	private String cardinalCode;
	private String payMethod;
	private int payAmount;
	private Timestamp payDate;
	
	public String getPayCode() {
		return payCode;
	}
	public void setPayCode(String payCode) {
		this.payCode = payCode;
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
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public int getPayAmount() {
		return payAmount;
	}
	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}
	public Timestamp getPayDate() {
		return payDate;
	}
	public void setPayDate(Timestamp payDate) {
		this.payDate = payDate;
	}
	@Override
	public String toString() {
		return "PayDomain [payCode=" + payCode + ", studentCode=" + studentCode + ", cardinalCode=" + cardinalCode
				+ ", payMethod=" + payMethod + ", payAmount=" + payAmount + ", payDate=" + payDate + "]";
	}
	
}
