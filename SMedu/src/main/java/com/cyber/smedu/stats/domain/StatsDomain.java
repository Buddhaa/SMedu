package com.cyber.smedu.stats.domain;

public class StatsDomain {
	private String statsCode;	
	private int statsCount;
	private String statsDate;
	
	private int aa;
	private int bb;
	private int cc;
	private int dd;
	private int ee;
	
	public int getAa() {
		return aa;
	}
	public void setAa(int aa) {
		this.aa = aa;
	}
	public int getBb() {
		return bb;
	}
	public void setBb(int bb) {
		this.bb = bb;
	}
	public int getCc() {
		return cc;
	}
	public void setCc(int cc) {
		this.cc = cc;
	}
	public int getDd() {
		return dd;
	}
	public void setDd(int dd) {
		this.dd = dd;
	}
	public int getEe() {
		return ee;
	}
	public void setEe(int ee) {
		this.ee = ee;
	}
	public String getStatsCode() {
		return statsCode;
	}
	public void setStatsCode(String statsCode) {
		this.statsCode = statsCode;
	}
	public String getStatsDate() {
		return statsDate;
	}
	public void setStatsDate(String statsDay) {
		this.statsDate = statsDay;
	}
	public int getStatsCount() {
		return statsCount;
	}
	public void setStatsCount(int statsCount) {
		this.statsCount = statsCount;
	}
	
	@Override
	public String toString() {
		return "StatsDomain [statsCode=" + statsCode + ", statsDay=" + statsDate + ", statsCount=" + statsCount
				+ ", getStatsCode()=" + getStatsCode() + ", getStatsDay()=" + getStatsDate() + ", getStatsCount()="
				+ getStatsCount() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
}
