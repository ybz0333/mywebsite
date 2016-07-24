package com.ybz.myWebsite.vo;

public class EmailVo {
	private String name;
	private String senderEmail;
	private String subject;
	private String message;
	
	public EmailVo() {
	}
	public EmailVo(String name, String senderEmail, String subject,
			String message) {
		super();
		this.name = name;
		this.senderEmail = senderEmail;
		this.subject = subject;
		this.message = message;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSenderEmail() {
		return senderEmail;
	}
	public void setSenderEmail(String senderEmail) {
		this.senderEmail = senderEmail;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "EmailVo [name=" + name + ", senderEmail=" + senderEmail
				+ ", subject=" + subject + ", message=" + message + "]";
	}
	
}
