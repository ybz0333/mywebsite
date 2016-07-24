package com.ybz.myWebsite.service;

import java.util.List;

import com.ybz.myWebsite.po.Chatlog;

public interface ChatlogService {
	
	public void addNewChatlog(Chatlog chatlog) throws Exception;
	
	/**
	 * 查询所有聊天记录（不包含聊天记录的内容）（按时间降序）
	 * @param chatlog
	 * @throws Exception
	 */
	public List<Chatlog> findChatlogsWithoutContent() throws Exception;

	/**
	 * 按id查询问卷
	 * @param id
	 * @return
	 */
	public Chatlog findChatlogById(Integer id) throws Exception;

	public void updateChatlog(Chatlog chatlog) throws Exception;
	
	public void deleteChatlogById(Integer id) throws Exception;
	
}
