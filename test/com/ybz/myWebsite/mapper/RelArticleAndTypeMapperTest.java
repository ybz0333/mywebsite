package com.ybz.myWebsite.mapper;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;

import com.ybz.myWebsite.po.RelArticleAndType;

public class RelArticleAndTypeMapperTest {
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
	
	//测试插入文章与文章类型的关系
	@Test
	public void testInsertRelArticleAndType() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		//创建代理对象
		RelArticleAndTypeMapper relArticleAndTypeMapper = sqlSession.getMapper(RelArticleAndTypeMapper.class);
		
		RelArticleAndType relArticleAndType = new RelArticleAndType();
		relArticleAndType.setArticleId(17);
		relArticleAndType.setArticleTypeId(1);
		//调用mapper的方法
		relArticleAndTypeMapper.insertRelArticleAndType(relArticleAndType);
		
		//提交事务
		sqlSession.commit();
		//关闭会话
		sqlSession.close();		
	}
	
	//测试删除某文章对应的所有关系
	@Test
	public void testDeleteRelArticleAndTypes() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		//创建代理对象
		RelArticleAndTypeMapper relArticleAndTypeMapper = sqlSession.getMapper(RelArticleAndTypeMapper.class);
		
		//调用mapper的方法
		relArticleAndTypeMapper.deleteRelArticleAndTypes(1);
		
		//提交事务
		sqlSession.commit();
		//关闭会话
		sqlSession.close();		
	}
}
