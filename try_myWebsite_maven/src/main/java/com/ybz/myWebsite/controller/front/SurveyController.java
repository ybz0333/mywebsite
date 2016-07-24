package com.ybz.myWebsite.controller.front;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ybz.myWebsite.controller.BaseController;
import com.ybz.myWebsite.po.Survey;

@Controller
@RequestMapping("/survey")
public class SurveyController extends BaseController{
	
	// 获取客户端真实IP地址的方法
	public String getRemoteHost(HttpServletRequest request){
	    String ip = request.getHeader("x-forwarded-for");
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
	        ip = request.getHeader("Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
	        ip = request.getHeader("WL-Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
	        ip = request.getRemoteAddr();
	    }
	    return ip.equals("0:0:0:0:0:0:0:1")?"127.0.0.1":ip;
	}
	
	// 问卷提交
	@RequestMapping("/surveySubmit")
	public @ResponseBody String surveySubmit(HttpServletRequest request, String senderName, String surveyData) throws Exception {
		Survey survey = new Survey();
		survey.setSenderName(senderName);
		survey.setSenderIP(getRemoteHost(request));
		survey.setSubmitTime(new Date());
		survey.setSurveyData(surveyData);
		surveyService.addNewSurvey(survey);
		return "success";
	}
}
