package com.ybz.myWebsite.listener;

import java.util.HashMap;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSession;

import com.ybz.myWebsite.po.User;

// 用于定时检查聊天室在线列表，清除掉线用户
public class ChatMoniterListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// 获取启动参数
		// 是否启用聊天室列表检查功能，0为不启用，1为启用
		String strUseChatroomMonitor = sce.getServletContext().getInitParameter("useChatroomMonitor");
		int useChatroomMonitor = Integer.parseInt(strUseChatroomMonitor);
		// 检查聊天室列表的时间间隔（秒）
		String strCheckTimeInterval = sce.getServletContext().getInitParameter("checkTimeInterval");
		int checkTimeInterval = Integer.parseInt(strCheckTimeInterval);
		// 判断用户掉线的时间阈值（秒）
		String strOfflineTimeTH = sce.getServletContext().getInitParameter("offlineTimeTH");
		final int offlineTimeMsTH = 1000 * Integer.parseInt(strOfflineTimeTH);
		
		if(useChatroomMonitor == 1) {
			System.out.println("useChatroomMonitor");
			//获取聊天室在线列表
			@SuppressWarnings("unchecked")
			Map<User, HttpSession> chatUserMapTemp = (Map<User, HttpSession>) sce
					.getServletContext().getAttribute("chatUserMap");
			if(chatUserMapTemp == null) {
				chatUserMapTemp = new HashMap<User,HttpSession>();
				sce.getServletContext().setAttribute("chatUserMap", chatUserMapTemp);
			}
			final Map<User, HttpSession> chatUserMap = chatUserMapTemp;
			
			// 设定检查聊天室列表用的定时器
			// 制定定时器相关的线程为守护线程
			Timer timer = new Timer(true);
			timer.schedule(new TimerTask() {
				/*
				定时器每隔checkTimeInterval秒检查chatUserMap中每个用户的session，取得上次调用/chatroom/check.action刷新的
				时间戳，将当前时间与该时间戳相减。若结果大于设定的掉线时间阈值，则判断用户掉线，将用户从chatUserMap中删除。
				*/
				@Override
				public void run() {
					long currentTime = System.currentTimeMillis();
					for(Map.Entry<User, HttpSession> entry : chatUserMap.entrySet()) {
						boolean isOffline = false;
						Long lastChatCheckTime = (Long)entry.getValue().getAttribute("lastChatCheckTime");
						if(lastChatCheckTime == null) {
							isOffline = true;
						} else if(currentTime - lastChatCheckTime > offlineTimeMsTH) {
							isOffline = true;
						}
						if(isOffline == true) {
							chatUserMap.remove(entry.getKey());
						}
					}
				}
			}, 1000, 1000*checkTimeInterval);
		}
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}

}
