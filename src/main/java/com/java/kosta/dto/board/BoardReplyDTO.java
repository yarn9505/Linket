package com.java.kosta.dto.board;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardReplyDTO {
	private String rNo;			// 댓글 번호
	private String bNo;			// 댓글 달린 게시판 번호
	private String replyId;		// 댓글단 id
	private String rContent;	// 댓글 내용
	private String rRegDate;		// 생성 날짜
	private String rModifyDate; 	// 수정 날짜
	private String isSecret;	// 비밀 댓글 여부
	
	
	public String getrNo() {
		return rNo;
	}
	public String getbNo() {
		return bNo;
	}
	public String getReplyId() {
		return replyId;
	}
	public String getrContent() {
		return rContent;
	}
	public String getrRegDate() {
		return rRegDate;
	}
	public String getrModifyDate() {
		return rModifyDate;
	}
	public void setrNo(String rNo) {
		this.rNo = rNo;
	}
	public void setbNo(String bNo) {
		this.bNo = bNo;
	}
	public void setReplyId(String replyId) {
		this.replyId = replyId;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public void setrRegDate(String rRegDate) {
		String newString = dateFormatting(rRegDate);
		this.rRegDate = newString;
	}
	public void setrModifyDate(String rModifyDate) {
		String newString = dateFormatting(rModifyDate);
		this.rModifyDate = newString;
	}
	
	// 데이터 형식 바꾸는 메서드
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
	public String getIsSecret() {
		return isSecret;
	}
	public void setIsSecret(String isSecret) {
		this.isSecret = isSecret;
	}
	
}
