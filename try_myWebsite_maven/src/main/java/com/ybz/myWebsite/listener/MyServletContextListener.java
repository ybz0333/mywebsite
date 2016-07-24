package com.ybz.myWebsite.listener;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSession;

import com.ybz.myWebsite.po.User;

// 监听ServletContext对象创建和销毁
public class MyServletContextListener implements ServletContextListener{
	// ServletContext对象创建 下面这个方法就会执行
	// ServletContextEvent事件对象. 监听器对象---》ServletContext对象.(事件源)
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext application = sce.getServletContext();
		Map<User,HttpSession> chatUserMap = new HashMap<User,HttpSession>();
		//chatUserMap为聊天室在线列表
		application.setAttribute("chatUserMap", chatUserMap);
		//numChatMessage为聊天消息长度
		application.setAttribute("lengthChatMessage", 0);
		Map<User,HttpSession> userMap = new HashMap<User,HttpSession>();
		//userMap为在线用户列表
		application.setAttribute("userMap", userMap);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}

}
