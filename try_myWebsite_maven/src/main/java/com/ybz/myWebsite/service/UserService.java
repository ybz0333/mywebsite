package com.ybz.myWebsite.service;

import java.util.List;

import com.ybz.myWebsite.po.User;

public interface UserService {
	/**
	 * 验证用户是否存在，若存在返回true，并补全user的各个成员变量
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public boolean VerifyUser(User user) throws Exception;
	
	public List<User> findUsers() throws Exception;
	
	public void inserUser(User user) throws Exception;
	
	public void updateUser(User user) throws Exception;
	
	public void deleteUserById(Integer id) throws Exception;

	public int registUser(User user) throws Exception;

}
