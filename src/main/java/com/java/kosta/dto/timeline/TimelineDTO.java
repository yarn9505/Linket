package com.java.kosta.dto.timeline;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimelineDTO {

	private String bno;
	private String userId;
	private String btitle;
	private String bcontent;
	private String value;
	private String cateId;
	private String lat;
	private String lon;
	private String viewcnt;
	private String bmodifydate;
	private String bregdate;
	private String cateId1;
	private String cateId2;
	private String cateId3;
	private String cateId4;
	private String cateId5;
	private String cateId6;
	private String cateId7;
	private String distance;
	private String cateName;
	private String imgPath;
	private String isSwap;
	private String checkfavorite;
	private String addr1;

	// getter, setter

	public String getBno() {
		return bno;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getIsSwap() {
		return isSwap;
	}

	public void setIsSwap(String isSwap) {
		this.isSwap = isSwap;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
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

	public String getCateId() {
		return cateId;
	}

	public void setCateId(String cateId) {
		this.cateId = cateId;
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

	public String getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(String viewcnt) {
		this.viewcnt = viewcnt;
	}

	public String getBmodifydate() {
		return bmodifydate;
	}

	public void setBmodifydate(String bmodifydate) {
		String newString = dateFormatting(bmodifydate);
		this.bmodifydate = newString;
		// this.bmodifydate = bmodifydate;
	}

	public String getBregdate() {
		return bregdate;
	}

	public void setBregdate(String bregdate) {
		String newString = dateFormatting(bregdate);
		this.bregdate = newString;
		// this.bregdate = bregdate;
	}

	public String getCateId1() {
		return cateId1;
	}

	public void setCateId1(String cateId1) {
		this.cateId1 = cateId1;
	}

	public String getCateId2() {
		return cateId2;
	}

	public void setCateId2(String cateId2) {
		this.cateId2 = cateId2;
	}

	public String getCateId3() {
		return cateId3;
	}

	public void setCateId3(String cateId3) {
		this.cateId3 = cateId3;
	}

	public String getCateId4() {
		return cateId4;
	}

	public void setCateId4(String cateId4) {
		this.cateId4 = cateId4;
	}

	public String getCateId5() {
		return cateId5;
	}

	public void setCateId5(String cateId5) {
		this.cateId5 = cateId5;
	}

	public String getCateId6() {
		return cateId6;
	}

	public void setCateId6(String cateId6) {
		this.cateId6 = cateId6;
	}

	public String getCateId7() {
		return cateId7;
	}

	public void setCateId7(String cateId7) {
		this.cateId7 = cateId7;
	}

	public String getDistance() {
		return distance;
	}

	public void setDistance(String distance) {
		this.distance = distance;
	}

	public String getCheckfavorite() {
		return checkfavorite;
	}

	public void setCheckfavorite(String checkfavorite) {
		this.checkfavorite = checkfavorite;
	}

	// 데이트 형식 바꾸는 메서드
	public String dateFormatting(String oldString) {
		String newString = "";
		try {
			Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(oldString);
			newString = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return newString;
	}

	@Override
	public String toString() {
		return "TimelineDTO [bno=" + bno + ", userId=" + userId + ", btitle=" + btitle + ", bcontent=" + bcontent
				+ ", value=" + value + ", cateId=" + cateId + ", lat=" + lat + ", lon=" + lon + ", viewcnt=" + viewcnt
				+ ", bmodifydate=" + bmodifydate + ", bregdate=" + bregdate + ", cateId1=" + cateId1 + ", cateId2="
				+ cateId2 + ", cateId3=" + cateId3 + ", cateId4=" + cateId4 + ", cateId5=" + cateId5 + ", cateId6="
				+ cateId6 + ", cateId7=" + cateId7 + ", distance=" + distance + ", cateName=" + cateName + ", imgPath="
				+ imgPath + ", isSwap=" + isSwap + ", checkfavorite=" + checkfavorite + ", addr1=" + addr1 + "]";
	}

}