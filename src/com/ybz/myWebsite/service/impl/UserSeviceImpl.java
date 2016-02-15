package com.ybz.myWebsite.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ybz.myWebsite.mapper.UserMapper;
import com.ybz.myWebsite.po.User;
import com.ybz.myWebsite.service.UserService;

@Service
public class UserSeviceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public boolean VerifyUser(User user) throws Exception{
		List<User> userList = userMapper.findUsers();
		boolean hasUser = false;
		for(User userTemp : userList) {
			if(user.getUsername().equals(userTemp.getUsername())
					&&user.getPassword().equals(userTemp.getPassword())) {
				hasUser = true;
				break;
			}
		}
		return hasUser;
	}
	
	@Override
	public List<User> findUsers() throws Exception {
		return userMapper.findUsers();
	}

	@Override
	public void inserUser(User user) throws Exception {
		userMapper.insertUser(user);
	}

	@Override
	public void updateUser(User user) throws Exception {
		userMapper.updateUser(user);
	}

	@Override
	public void deleteUserById(Integer id) throws Exception {
		userMapper.deleteUserById(id);
	}

}
