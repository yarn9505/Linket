package com.java.kosta.dto.mypage;

public class EvalDTO {
	private String userId;
	private String bno;
	private String cateId;
	private String postNum;
	private String buyerId;
	private String pcontent;
	private String pscore;
	
	
	public String getUserId() {
		return userId;
	}
	public String getBno() {
		return bno;
	}
	public String getCateId() {
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
	public void setCateId(String cateId) {
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

}
