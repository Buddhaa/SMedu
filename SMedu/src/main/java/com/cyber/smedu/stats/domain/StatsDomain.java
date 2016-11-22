package com.cyber.smedu.stats.domain;

public class StatsDomain {
	private String statsCode;	
	private int statsCount;
	private String statsDate;
	
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
