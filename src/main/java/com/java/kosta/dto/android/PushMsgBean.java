package com.java.kosta.dto.android;

import java.sql.Date;

public class PushMsgBean {
	
	/*한나!*/
	
	private String to; //=> pushToken
	private Data data;
	
	//Data Class
	public static class Data {
		private String title;
		private String message;
		private String time;
		
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getMessage() {
			return message;
		}
		public void setMessage(String message) {
			this.message = message;
		}
		public String getTime() {
			return time;
		}
		public void setTime(String date) {
			this.time = date;
		}
	}
	
	
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public Data getData() {
		return data;
	}
	public void setData(Data data) {
		this.data = data;
	}
	
}
