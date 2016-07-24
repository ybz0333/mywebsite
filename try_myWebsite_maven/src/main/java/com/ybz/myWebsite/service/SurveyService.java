package com.ybz.myWebsite.service;

import java.util.List;

import com.ybz.myWebsite.po.Survey;

public interface SurveyService {
	
	public void addNewSurvey(Survey survey) throws Exception;
	
	/**
	 * 查询所有问卷（不包含问卷内容）（按时间降序）
	 * @param survey
	 * @throws Exception
	 */
	public List<Survey> findSurveysWithoutContent() throws Exception;

	/**
	 * 按id查询问卷
	 * @param id
	 * @return
	 */
	public Survey findSurveyById(Integer id) throws Exception;
	
	public void deleteSurveyById(Integer id) throws Exception;
	
}
