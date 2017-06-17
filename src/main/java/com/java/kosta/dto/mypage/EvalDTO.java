package com.java.kosta.dto.mypage;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class EvalDTO {
	private String userId;
	private String bno;
	private int cateId;
	private String postNum;
	private String buyerId;
	private String pcontent;
	private String pscore;	// 별점
	private String count;	// 각 별점의 갯수
	private String avg;		// 별점의 평점
	private String pRegDate;
	
	private String cateName;
	private int totReviewCnt;	// 리뷰 총 갯수
	
	
	public int getTotReviewCnt() {
		return totReviewCnt;
	}
	public void setTotReviewCnt(int totReviewCnt) {
		this.totReviewCnt = totReviewCnt;
	}
	public String getpRegDate() {
		return pRegDate;
	}
	public String getCateName() {
		return cateName;
	}
	public void setpRegDate(String pRegDate) {
		String newString = dateFormatting(pRegDate);
		this.pRegDate = newString;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getAvg() {
		return avg;
	}
	public void setAvg(String avg) {
		this.avg = avg;
	}
	public String getUserId() {
		return userId;
	}
	public String getBno() {
		return bno;
	}
	public int getCateId() {
		return cateId;
	}
	public String getPostNum() {
		return postNum;
	}
	public String getBuyerId() {
		return buyerId;
	}
	public String getPcontent() {
		return pcontent;
	}
	public String getPscore() {
		return pscore;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public void setCateId(int cateId) {
		this.cateId = cateId;
	}
	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}
	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public void setPscore(String pscore) {
		this.pscore = pscore;
	}
	
	// 데이트 형식 바꾸는 메서드
	public String dateFormatting(String oldString){
		String newString ="";
		try {
			Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(oldString);
			newString = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return newString;
	}

}
