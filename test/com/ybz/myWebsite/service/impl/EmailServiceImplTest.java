package com.ybz.myWebsite.service.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.BlockJUnit4ClassRunner;

import com.ybz.myWebsite.service.EmailService;
import com.ybz.myWebsite.vo.EmailVo;

@RunWith(BlockJUnit4ClassRunner.class)
public class EmailServiceImplTest extends UnitTestBase{
	
	public EmailServiceImplTest() {
		super("classpath*:spring/applicationContext-*.xml");
	}
	
	@Test
	public void testSendEmail() throws Exception {
		EmailService emailService = super.getBean("emailServiceImpl");
		EmailVo emailVo = new EmailVo();
		emailVo.setName("测试者");
		emailVo.setSenderEmail("ybzTest@126.com");
		emailVo.setSubject("测试");
		emailVo.setMessage("这是一封测试邮件");
		emailService.sendEmail(emailVo);
	}
}
