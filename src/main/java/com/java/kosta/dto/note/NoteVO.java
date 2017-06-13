package com.java.kosta.dto.note;

import java.sql.Date;

public class NoteVO {

	// 보낸이 id
	private String userId;
	// 쪽지 번호
	private String mno;
	// 받는이 id
	private String recvId;
	// 쪽지 제목
	private String mtitle;
	// 쪽지 내용
	private String mcontent;
	// 쪽지를 보낸 날짜
	private Date date_sender;
	// 받는이가 쪽지를 읽은 날짜
	private Date date_receiver;
	// 받는이가 쪽지를 읽었는지 유무(N/Y)
	private String recv_read;
	// 받는이가 쪽지를 삭제했는지 유무(N/Y)
	private String recv_del;
	// 보낸이가 쪽지를 삭제했는지 유무(N/Y)
	private String sender_del;
	
	// getter/setter
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMno() {
		return mno;
	}
	public void setMno(String mno) {
		this.mno = mno;
	}
	public String getRecvId() {
		return recvId;
	}
	public void setRecvId(String recvId) {
		this.recvId = recvId;
	}
	public String getMtitle() {
		return mtitle;
	}
	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}
	public String getMcontent() {
		return mcontent;
	}
	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}
	public Date getDate_sender() {
		return date_sender;
	}
	public void setDate_sender(Date date_sender) {
		this.date_sender = date_sender;
	}
	public Date getDate_receiver() {
		return date_receiver;
	}
	public void setDate_receiver(Date date_receiver) {
		this.date_receiver = date_receiver;
	}
	public String getRecv_read() {
		return recv_read;
	}
	public void setRecv_read(String recv_read) {
		this.recv_read = recv_read;
	}
	public String getRecv_del() {
		return recv_del;
	}
	public void setRecv_del(String recv_del) {
		this.recv_del = recv_del;
	}
	public String getSender_del() {
		return sender_del;
	}
	public void setSender_del(String sender_del) {
		this.sender_del = sender_del;
	}
	@Override
	public String toString() {
		return "NoteVO [userId=" + userId + ", mno=" + mno + ", recvId=" + recvId + ", mtitle=" + mtitle + ", mcontent="
				+ mcontent + ", date_sender=" + date_sender + ", date_receiver=" + date_receiver + ", recv_read="
				+ recv_read + ", recv_del=" + recv_del + ", sender_del=" + sender_del + "]";
	}
}
