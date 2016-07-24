package com.ybz.myWebsite.controller.manage;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ybz.myWebsite.controller.BaseController;
import com.ybz.myWebsite.po.Survey;

@Controller
@RequestMapping("/manage/survey")
public class ManageSurveyController extends BaseController{
	
	@RequestMapping("/listSurveys")
	public String listSurveys(Model model) throws Exception {
		List<Survey> surveyList = surveyService.findSurveysWithoutContent();
		model.addAttribute("surveyList", surveyList);
		return "manage/survey/listSurveys";
	}
	
	//这样配置以解决@ResponseBody返回中文乱码问题
	@RequestMapping(value="/checkSurvey", produces="text/plain; charset=utf-8")
	public @ResponseBody String checkSurvey(Integer id) throws Exception {
		if(id == null) {
			throw new RuntimeException("按id查询问卷时id为空");
		}
		Survey survey = surveyService.findSurveyById(id);
		return survey.getSurveyData();
	}
	
	@RequestMapping("/deleteSurvey")
	public @ResponseBody String deleteSurvey(Integer id) throws Exception {
		if(id == null) {
			throw new RuntimeException("要删除问卷的Id为空");
		}
		surveyService.deleteSurveyById(id);
		return "success";
	}
}
