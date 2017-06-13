package com.java.kosta.dto.transaction;

public class TransactionDTO {
	private String userId;
	private String bno;
	private int cateId;
	private String postNum;
	private String buyerId;
	private String pcontent;
	private String pscore;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBno() {
		return bno;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}

	public int getCateId() {
		return cateId;
	}
	public void setCateId(int cateId) {
		this.cateId = cateId;
	}
	public String getPostNum() {
		return postNum;
	}
	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}
	public String getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public String getPscore() {
		return pscore;
	}
	public void setPscore(String pscore) {
		this.pscore = pscore;
	}
	@Override
	public String toString() {
		return "TransactionDTO [userId=" + userId + ", bno=" + bno + ", cateId=" + cateId + ", postNum=" + postNum
				+ ", buyerId=" + buyerId + ", pcontent=" + pcontent + ", pscore=" + pscore + "]";
	}
	
}
