package com.ybz.myWebsite.service.impl;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

import com.ybz.myWebsite.service.EmailService;
import com.ybz.myWebsite.vo.EmailVo;

@Service
public class EmailServiceImpl implements EmailService{
	
	private String host;
	
	private String auth;
	
	private String userName;
	
	private String password;
	
	private String receiverEmail; 
	
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getReceiverEmail() {
		return receiverEmail;
	}
	public void setReceiverEmail(String receiverEmail) {
		this.receiverEmail = receiverEmail;
	}

	@Override
	public void sendEmail(EmailVo emailVo) throws Exception {
		System.out.println("host:" + host);
		System.out.println("auth:" + auth);
		System.out.println("userName:" + userName);
		System.out.println("password:" + password);
		System.out.println("receiverEmail:" + receiverEmail);
		
		/*
		 * 1. 得到session
		 */
		Properties props = new Properties();
		props.setProperty("mail.host", host);
		props.setProperty("mail.smtp.auth", auth);
		
		Authenticator auth = new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(userName, password);
			}
		};
		
		Session session = Session.getInstance(props, auth);
		
		/*
		 * 2. 创建MimeMessage
		 */
		MimeMessage msg = new MimeMessage(session);
		msg.setFrom(new InternetAddress(emailVo.getSenderEmail()));//设置发件人
		msg.setRecipients(RecipientType.TO, receiverEmail);//设置收件人
		//msg.setRecipients(RecipientType.CC, "itcast_cxf@sohu.com");//设置抄送
		//msg.setRecipients(RecipientType.BCC, "itcast_cxf@sina.com");//设置暗送
		
		msg.setSubject(emailVo.getSubject());
		msg.setContent(emailVo.getMessage(), "text/html;charset=utf-8");
		
		/*
		 * 3. 发送邮件
		 */
		Transport.send(msg);
	}

}
