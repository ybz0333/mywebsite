package com.ybz.myWebsite.service;

import com.ybz.myWebsite.vo.EmailVo;

public interface EmailService {
	public void sendEmail(EmailVo emailVo) throws Exception;
}
