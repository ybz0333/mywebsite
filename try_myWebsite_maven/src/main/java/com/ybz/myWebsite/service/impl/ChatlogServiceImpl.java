package com.ybz.myWebsite.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ybz.myWebsite.mapper.ChatlogMapper;
import com.ybz.myWebsite.po.Chatlog;
import com.ybz.myWebsite.service.ChatlogService;

@Service
public class ChatlogServiceImpl implements ChatlogService{
	
	@Autowired
	ChatlogMapper chatlogMapper;

	@Override
	public void addNewChatlog(Chatlog chatlog) throws Exception {
		chatlogMapper.insert(chatlog);
	}

	@Override
	public List<Chatlog> findChatlogsWithoutContent() throws Exception {
		return chatlogMapper.selectWithoutContent();
	}

	@Override
	public Chatlog findChatlogById(Integer id) throws Exception {
		return chatlogMapper.selectByPrimaryKey(id);
	}

	@Override
	public void deleteChatlogById(Integer id) throws Exception {
		chatlogMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void updateChatlog(Chatlog chatlog) throws Exception {
		chatlogMapper.updateByPrimaryKeySelective(chatlog);
	}

}
