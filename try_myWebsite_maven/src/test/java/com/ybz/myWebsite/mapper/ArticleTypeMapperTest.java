package com.ybz.myWebsite.mapper;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;

import com.ybz.myWebsite.po.ArticleType;
import com.ybz.myWebsite.vo.ArticleTypeGroup;

public class ArticleTypeMapperTest {
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
	
	//测试查询文章类型信息
	@Test
	public void testFindArticleTypes() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		//创建代理对象
		ArticleTypeMapper articleTypeMapper = sqlSession.getMapper(ArticleTypeMapper.class);
		List<ArticleType> articleTypeList = articleTypeMapper.findArticleTypes();
		if(articleTypeList != null) {
			for(ArticleType articleType : articleTypeList) {
				System.out.println(articleType);
			}
		}
		sqlSession.close();
	}
	
	//测试按id查询文章类型信息
	@Test
	public void testFindArticleTypeById() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		//创建代理对象
		ArticleTypeMapper articleTypeMapper = sqlSession.getMapper(ArticleTypeMapper.class);
		ArticleType articleType = articleTypeMapper.findArticleTypeById(1);
		System.out.println(articleType);
				
		sqlSession.close();
	}	
	
	//测试插入文章类型信息
	@Test
	public void testInsertArticleType() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		//创建代理对象
		ArticleTypeMapper articleTypeMapper = sqlSession.getMapper(ArticleTypeMapper.class);
		ArticleType articleType = new ArticleType();
		articleType.setTypeName("testInsertType");
		articleType.setDescription("none");
		articleTypeMapper.insertArticleType(articleType);
		System.out.println("id:" + articleType.getId());
		
		//提交事务
		sqlSession.commit();
		//关闭会话
		sqlSession.close();
	}
	
	//测试更新文章类型信息
	@Test
	public void testUpdateArticleType() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		//创建代理对象
		ArticleTypeMapper articleTypeMapper = sqlSession.getMapper(ArticleTypeMapper.class);
		ArticleType articleType = new ArticleType();
		articleType.setId(2);
		articleType.setTypeName("testUpdateType");
		articleType.setDescription("none");
		articleTypeMapper.updateArticleType(articleType);
		
		//提交事务
		sqlSession.commit();
		//关闭会话
		sqlSession.close();
	}
	
	//测试删除文章类型
	@Test
	public void testDeleteArticleType() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		//创建代理对象
		ArticleTypeMapper articleTypeMapper = sqlSession.getMapper(ArticleTypeMapper.class);
		articleTypeMapper.deleteArticleType(6);
		
		//提交事务
		sqlSession.commit();
		//关闭会话
		sqlSession.close();
	}
	
	@Test
	public void testFindArticleCountGroup() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		//创建代理对象
		ArticleTypeMapper articleTypeMapper = sqlSession.getMapper(ArticleTypeMapper.class);
		Map<String,Object> param = new HashMap<String,Object>();
		List<ArticleTypeGroup> articleTypeGroupResult1 = articleTypeMapper.findArticleCountGroup(param);
		System.out.println(articleTypeGroupResult1);
		
		param.put("state", 1);
		List<ArticleTypeGroup> articleTypeGroupResult2 = articleTypeMapper.findArticleCountGroup(param);
		System.out.println(articleTypeGroupResult2);
		
		//关闭会话
		sqlSession.close();		
	}
	
	//测试根据文章id查询文章类型信息
	@Test
	public void testFindArticleTypesByArticleId() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		//创建代理对象
		ArticleTypeMapper articleTypeMapper = sqlSession.getMapper(ArticleTypeMapper.class);
		//调用mapper的方法
		List<ArticleType> articleTypeList= articleTypeMapper.findArticleTypesByArticleId(28);
		System.out.println(articleTypeList);
		
		sqlSession.close();
	}	
}
