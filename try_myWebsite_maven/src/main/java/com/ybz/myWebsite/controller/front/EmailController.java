package com.ybz.myWebsite.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ybz.myWebsite.controller.BaseController;
import com.ybz.myWebsite.vo.EmailVo;

@Controller
public class EmailController extends BaseController{
	//发送邮件
	@RequestMapping("/email")
	public @ResponseBody String sendMail(EmailVo emailVo) throws Exception {
		emailService.sendEmail(emailVo);
		return "success";
	}
}
