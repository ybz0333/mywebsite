package com.ybz.myWebsite.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ybz.myWebsite.mapper.SurveyMapper;
import com.ybz.myWebsite.po.Survey;
import com.ybz.myWebsite.service.SurveyService;

@Service
public class SurveyServiceImpl implements SurveyService{
	
	@Autowired
	SurveyMapper surveyMapper;

	@Override
	public void addNewSurvey(Survey survey) throws Exception {
		surveyMapper.insert(survey);
	}

	@Override
	public List<Survey> findSurveysWithoutContent() throws Exception {
		return surveyMapper.selectWithoutContent();
	}

	@Override
	public Survey findSurveyById(Integer id) throws Exception {
		return surveyMapper.selectByPrimaryKey(id);
	}

	@Override
	public void deleteSurveyById(Integer id) throws Exception {
		surveyMapper.deleteByPrimaryKey(id);
	}

}
