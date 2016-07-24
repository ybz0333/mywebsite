package com.ybz.myWebsite.mapper;

import java.io.InputStream;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;

import com.ybz.myWebsite.po.User;
import com.ybz.myWebsite.po.UserExample;

public class UserMapperTest {
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
	
	//测试查询用户
	@Test
	public void testFindUsers() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		//创建代理对象
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		
		//调用mapper的方法
		List<User> userList = userMapper.selectByExample(null);
		System.out.println(userList);
		
		UserExample userExample = new UserExample();
		// 通过criteria构造查询条件
		UserExample.Criteria criteria = userExample.createCriteria();
		criteria.andUsernameEqualTo("test");
		int num = userMapper.countByExample(userExample);
		System.out.println("num: " + num);
		
		//关闭会话
		sqlSession.close();
	}
	
	//测试插入用户
	@Test
	public void testInsertUser() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		//创建代理对象
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		
		User user = new User();
		user.setUsername("testInsert");
		user.setNickname("testInsert");
		user.setPassword("testInsert");
		user.setPermission(0);
		user.setRegisttime(new Date());
		//调用mapper的方法
		userMapper.insert(user);
		
		//提交事务
		sqlSession.commit();
		//关闭会话
		sqlSession.close();
	}
	
	//测试更新用户
	@Test
	public void testUpdateUser() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		//创建代理对象
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		
		User user = new User();
		user.setId(2);
		user.setUsername("test5");
		user.setPassword("test5");
		user.setPermission(0);
		//调用mapper的方法
		userMapper.updateByPrimaryKeySelective(user);
		
		//提交事务
		sqlSession.commit();
		//关闭会话
		sqlSession.close();
	}
	
	//测试删除用户
	@Test
	public void testDeleteUser() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		//创建代理对象
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		
		//调用mapper的方法
		userMapper.deleteByPrimaryKey(2);
		
		//提交事务
		sqlSession.commit();
		//关闭会话
		sqlSession.close();		
	}
}