package com.ybz.myWebsite.mapper;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;

import com.ybz.myWebsite.po.Survey;

public class SurveyMapperTest {
	private SqlSessionFactory sqlSessionFactory;
	
	@Before
	public void setUp() throws Exception {
		// 创建sqlSessionFactory
		
		//mybatis配置文件
		String resource = "mybatis/sqlMapConfigForTest.xml";
		//得到配置文件流
		InputStream inputStream = Resources.getResourceAsStream(resource);
		
		//创建会话工厂，传入mybatis的配置文件信息
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	// 测试查询所有问卷（不包含问卷内容）（按时间降序）
	@Test
	public void testSelectWitoutContent() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		//创建代理对象
		SurveyMapper surveyMapper = sqlSession.getMapper(SurveyMapper.class);
		List<Survey> surveyList = surveyMapper.selectWithoutContent();
		System.out.println(surveyList);
		//关闭会话				
		sqlSession.close();
	}
}
