package com.cyber.smedu.book.domain;

import java.sql.Date;

public class BookDomain {
	private String bookCode;
	private String bookName;
	private String bookCompany;
	private String bookWriter;
	private String bookIntroduce;
	private Date bookDate;
	public String getBookCode() {
		return bookCode;
	}
	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBookCompany() {
		return bookCompany;
	}
	public void setBookCompany(String bookCompany) {
		this.bookCompany = bookCompany;
	}
	public String getBookWriter() {
		return bookWriter;
	}
	public void setBookWriter(String bookWriter) {
		this.bookWriter = bookWriter;
	}
	public String getBookIntroduce() {
		return bookIntroduce;
	}
	public void setBookIntroduce(String bookIntroduce) {
		this.bookIntroduce = bookIntroduce;
	}
	public Date getBookDate() {
		return bookDate;
	}
	public void setBookDate(Date bookDate) {
		this.bookDate = bookDate;
	}
	
	@Override
	public String toString() {
		return "BookDomain [bookCode=" + bookCode + ", bookName=" + bookName + ", bookCompany=" + bookCompany
				+ ", bookWriter=" + bookWriter + ", bookIntroduce=" + bookIntroduce + ", bookDate=" + bookDate + "]";
	}	
}
