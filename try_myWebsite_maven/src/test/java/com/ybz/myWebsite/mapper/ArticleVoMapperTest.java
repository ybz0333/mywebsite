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

import com.ybz.myWebsite.po.Article;
import com.ybz.myWebsite.vo.ArticleTimeGroup;
import com.ybz.myWebsite.vo.ArticleVo;

public class ArticleVoMapperTest {
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
	
	// 测试查询文章信息（带分页） 
	@Test
	public void testFindArticleVos() throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		//创建代理对象
		ArticleVoMapper articleVoMapper = sqlSession.getMapper(ArticleVoMapper.class);
		
		//调用mapper的方法
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("articleId", 28);
		param.put("articleTypeId", 1);
		param.put("state", 1);
		param.put("year", 2016);
		param.put("month", 2);
		param.put("fromIndex", 0);
		param.put("pageSize", 1);
		List<ArticleVo>list = articleVoMapper.findArticleSearchVos(param);
		
		System.out.println(list);
		
		sqlSession.close();
	}
	//测试查询文章数量
	@Test
	public void testFindArticleCount() throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		//创建代理对象
		ArticleVoMapper articleVoMapper = sqlSession.getMapper(ArticleVoMapper.class);
		
		//调用mapper的方法
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("articleId", 2);
		param.put("articleTypeId", 2);
		int count = articleVoMapper.findArticleCount(param);
		
		System.out.println("count: " + count);
		
		sqlSession.close();
	}
	
	//测试根据id查询查询文章信息
	@Test
	public void testFindArticleVoById() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		//创建代理对象
		ArticleVoMapper articleVoMapper = sqlSession.getMapper(ArticleVoMapper.class);
		
		//调用mapper的方法
		ArticleVo articleVo = articleVoMapper.findArticleVoById(28);
		
		System.out.println(articleVo);
		
		sqlSession.close();
	}
	
	//测试根据id查询文章信息（不包含类型信息）
	@Test
	public void testFindArticleById() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		//创建代理对象
		ArticleVoMapper articleVoMapper = sqlSession.getMapper(ArticleVoMapper.class);
		
		//调用mapper的方法
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", 11);
		param.put("clickCount", "clickCount");
		param.put("praiseCount", "praiseCount");
		Article article = articleVoMapper.findArticleById(param);
		
		System.out.println(article);
		
		sqlSession.close();		
	}
	
	//测试插入文章
	@Test
	public void testInsertArticle() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		//创建代理对象
		ArticleVoMapper articleVoMapper = sqlSession.getMapper(ArticleVoMapper.class);
		
		Article article = new Article();
		article.setTitle("测试插入文章");
		article.setAuthorName("test");
		article.setContent("这是一篇测试文章");
		article.setNote("test");
		
		//调用mapper的方法
		articleVoMapper.insertArticle(article);
		
		System.out.println("id:" + article.getId());
		
		//提交事务
		sqlSession.commit();
		//关闭会话
		sqlSession.close();
	}
	
	//测试更新文章
	@Test
	public void testUpdateArticle() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		//创建代理对象
		ArticleVoMapper articleVoMapper = sqlSession.getMapper(ArticleVoMapper.class);
		
		Article article = new Article();
		article.setId(17);
		article.setAuthorName("testUpdate");
		article.setTitle("test article");
		article.setContent("test update");
		article.setNote("test");
		//调用mapper的方法
		articleVoMapper.updateArticle(article);
		
		//提交事务
		sqlSession.commit();
		//关闭会话
		sqlSession.close();		
	}
	
	//测试按id删除文章
	@Test
	public void testDeleteArticleById() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		//创建代理对象
		ArticleVoMapper articleVoMapper = sqlSession.getMapper(ArticleVoMapper.class);
		
		//调用mapper的方法
		articleVoMapper.deleteArticleById(21);
		
		//提交事务
		sqlSession.commit();
		//关闭会话
		sqlSession.close();		
	}

	//测试文章年月分组查询
	@Test
	public void testFindArticleTimeGroup() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		//创建代理对象
		ArticleVoMapper articleVoMapper = sqlSession.getMapper(ArticleVoMapper.class);
	
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("state", 1);
		//调用mapper的方法
		List<ArticleTimeGroup> articleTimeGroupList = articleVoMapper.findArticleTimeGroup(param);
		System.out.println(articleTimeGroupList);
		
		//关闭会话
		sqlSession.close();		
	}
}