package com.java.kosta.dto.board;

public class BoardAttachDTO {
	private String fNo;
	private String bNo;
	private String fileName;
	private String fRegDate;
	private String fileSize;
	private String originName;
	private String attachType;
	
	public String getfNo() {
		return fNo;
	}
	public String getbNo() {
		return bNo;
	}
	public String getFileName() {
		return fileName;
	}
	public String getfRegDate() {
		return fRegDate;
	}
	public String getFileSize() {
		return fileSize;
	}
	public String getOriginName() {
		return originName;
	}
	public void setfNo(String fNo) {
		this.fNo = fNo;
	}
	public void setbNo(String bNo) {
		this.bNo = bNo;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public void setfRegDate(String fRegDate) {
		this.fRegDate = fRegDate;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getAttachType() {
		return attachType;
	}
	public void setAttachType(String attachType) {
		this.attachType = attachType;
	}
	
	
}
