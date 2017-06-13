package com.java.kosta.dto.mail;

public class MailDTO {
	private String title;
	private String email;
	private String content;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "MailDTO [title=" + title + ", email=" + email + ", content=" + content + "]";
	}
	
}
