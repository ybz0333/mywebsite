package com.ybz.myWebsite.service;

import java.util.List;

import com.ybz.myWebsite.po.User;

public interface UserService {
	
	public boolean VerifyUser(User user) throws Exception;
	
	public List<User> findUsers() throws Exception;
	
	public void inserUser(User user) throws Exception;
	
	public void updateUser(User user) throws Exception;
	
	public void deleteUserById(Integer id) throws Exception;
	
}
