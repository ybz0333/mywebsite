package com.ybz.myWebsite.mapper;

import com.ybz.myWebsite.po.Survey;
import com.ybz.myWebsite.po.SurveyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SurveyMapper {
    int countByExample(SurveyExample example);

    int deleteByExample(SurveyExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Survey record);

    int insertSelective(Survey record);

    List<Survey> selectByExample(SurveyExample example);

    Survey selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Survey record, @Param("example") SurveyExample example);

    int updateByExample(@Param("record") Survey record, @Param("example") SurveyExample example);

    int updateByPrimaryKeySelective(Survey record);

    int updateByPrimaryKey(Survey record);
    
    // 新增
    // 查询所有问卷（不包含问卷内容）（按时间降序）
    List<Survey> selectWithoutContent();
}