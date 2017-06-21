package com.java.kosta.dto.matching;

import java.sql.Date;

public class matchingDTO implements Comparable<matchingDTO> {
	private String bno;
	private String userId;
	private String btitle;
	private String bcontent;
	private String value;
	private String viewcnt;
	private Date bregdate;
	private String isSwap;
	private String cateName;
	private String distance;
	private String productKeywords;
	private String requestMsg;
	private String lat;
	private String lon;
	private String addr1;
	private String wantedValue;
	private String relValue;
	private String mno;
	private String weightValue;
	private String sellerId;
	private String requester;
	private String receiver;

	public String getRequester() {
		return requester;
	}

	public void setRequester(String requester) {
		this.requester = requester;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	public String getWeightValue() {
		return weightValue;
	}

	public void setWeightValue(String weightValue) {
		this.weightValue = weightValue;
	}

	public String getMno() {
		return mno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLon() {
		return lon;
	}

	public void setLon(String lon) {
		this.lon = lon;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getWantedValue() {
		return wantedValue;
	}

	public void setWantedValue(String wantedValue) {
		this.wantedValue = wantedValue;
	}

	public String getProductKeywords() {
		return productKeywords;
	}

	public void setProductKeywords(String productKeywords) {
		this.productKeywords = productKeywords;
	}

	public String getDistance() {
		return distance;
	}

	public void setDistance(String distance) {
		this.distance = distance;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public String getBno() {
		return bno;
	}

	public void setBno(String bno) {
		this.bno = bno;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(String viewcnt) {
		this.viewcnt = viewcnt;
	}

	public Date getBregdate() {
		return bregdate;
	}

	public void setBregdate(Date bregdate) {
		this.bregdate = bregdate;
	}

	public String getIsSwap() {
		return isSwap;
	}

	public void setIsSwap(String isSwap) {
		this.isSwap = isSwap;
	}

	public String getRequestMsg() {
		return requestMsg;
	}

	public void setRequestMsg(String requestMsg) {
		this.requestMsg = requestMsg;
	}

	public String getRelValue() {
		return relValue;
	}

	public void setRelValue(String relValue) {
		this.relValue = relValue;
	}

	@Override
	public String toString() {
		return "matchingDTO [bno=" + bno + ", userId=" + userId + ", btitle=" + btitle + ", bcontent=" + bcontent
				+ ", value=" + value + ", viewcnt=" + viewcnt + ", bregdate=" + bregdate + ", isSwap=" + isSwap
				+ ", cateName=" + cateName + ", distance=" + distance + ", productKeywords=" + productKeywords
				+ ", requestMsg=" + requestMsg + ", lat=" + lat + ", lon=" + lon + ", addr1=" + addr1 + ", wantedValue="
				+ wantedValue + ", relValue=" + relValue + ", mno=" + mno + ", weightValue=" + weightValue
				+ ", sellerId=" + sellerId + ", requester=" + requester + ", receiver=" + receiver + "]";
	}

	@Override
	public int compareTo(matchingDTO o) {
		return Integer.parseInt(o.weightValue) - Integer.parseInt(this.weightValue);
	}

}