package com.java.kosta.dto.matching;

public class matchingCntDTO {
	private String mno;
	private String bno;
	private String bnoNum;
	private String btitle;
	private String value;
	private String avgValue;
	private String condi;

	// getter, setter

	public String getBno() {
		return bno;
	}

	public String getMno() {
		return mno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public void setBno(String bno) {
		this.bno = bno;
	}

	public String getBnoNum() {
		return bnoNum;
	}

	public void setBnoNum(String bnoNum) {
		this.bnoNum = bnoNum;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getAvgValue() {
		return avgValue;
	}

	public void setAvgValue(String avgValue) {
		this.avgValue = avgValue;
	}

	public String getCondi() {
		return condi;
	}

	public void setCondi(String condi) {
		this.condi = condi;
	}

	@Override
	public String toString() {
		return "matchingCntDTO [bno=" + bno + ", bnoNum=" + bnoNum + ", btitle=" + btitle + ", value=" + value
				+ ", avgValue=" + avgValue + ", condi=" + condi + "]";
	}

}// 아아 DTO 귀엽당 ^0^