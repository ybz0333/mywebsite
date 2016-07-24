package com.ybz.myWebsite.service.impl;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ybz.myWebsite.mapper.UserMapper;
import com.ybz.myWebsite.po.User;
import com.ybz.myWebsite.po.UserExample;
import com.ybz.myWebsite.service.UserService;

@Service
public class UserSeviceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public boolean VerifyUser(User user) throws Exception{
		List<User> userList = userMapper.selectByExample(null);
		boolean hasUser = false;
		for(User userTemp : userList) {
			if(user.getUsername().equals(userTemp.getUsername())
					&&user.getPassword().equals(userTemp.getPassword())) {
				// 拷贝以补全user的各个成员变量
				BeanUtils.copyProperties(userTemp, user);
				hasUser = true;
				break;
			}
		}
		return hasUser;
	}
	
	@Override
	public List<User> findUsers() throws Exception {
		return userMapper.selectByExample(null);
	}

	@Override
	public void inserUser(User user) throws Exception {
		userMapper.insert(user);
	}

	@Override
	public void updateUser(User user) throws Exception {
		userMapper.updateByPrimaryKey(user);
	}

	@Override
	public void deleteUserById(Integer id) throws Exception {
		userMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int registUser(User user) throws Exception {
		UserExample userExample = new UserExample();
		// 通过criteria构造查询条件
		UserExample.Criteria criteria = userExample.createCriteria();
		criteria.andUsernameEqualTo(user.getUsername());
		int num = userMapper.countByExample(userExample);
		if(num == 0) {
			userMapper.insert(user);
			return 0;			
		} else {
			return -1;
		}
	}

}
