package com.ybz.myWebsite.mapper;

import java.util.List;

import com.ybz.myWebsite.po.User;

public interface UserMapper {
	
	public List<User> findUsers() throws Exception;
	
	public void insertUser(User user) throws Exception;
	
	public void updateUser(User user) throws Exception;
	
	public void deleteUserById(int id) throws Exception;
	
}