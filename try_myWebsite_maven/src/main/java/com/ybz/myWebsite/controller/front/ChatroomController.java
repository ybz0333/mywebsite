package com.ybz.myWebsite.controller.front;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ybz.myWebsite.constants.Constant;
import com.ybz.myWebsite.controller.BaseController;
import com.ybz.myWebsite.po.Chatlog;
import com.ybz.myWebsite.po.User;
import com.ybz.myWebsite.vo.ChatMessageVo;

@Controller
@RequestMapping("/chatroom")
public class ChatroomController extends BaseController{
	
	// 跳转到聊天室
	@RequestMapping("/main")
	public String gotoChatroom(HttpSession session, HttpServletRequest request, Model model) {
		// 用户访问聊天室页面时进行聊天室自动登录
		User user = (User)session.getAttribute("user");
		if(user == null) {
			model.addAttribute("showSnapshotLink", true);
			return "user/userLogin";
		}
		
		ServletContext application = request.getSession().getServletContext();
		@SuppressWarnings("unchecked")
		Map<User, HttpSession> chatUserMap = (Map<User, HttpSession>) application.getAttribute("chatUserMap");
		// 若用户不在chatUserMap集合中，则添加用户；若存在，则更新其对应的session对象
		chatUserMap.put(user, session);
		// 设置用于聊天室列表检查的时间戳
		session.setAttribute("lastChatCheckTime", (Long)System.currentTimeMillis());
		
		// 发布走进聊天室公告
		StringBuffer sourceMessage = new StringBuffer("");
		StringBuffer chatMessage = (StringBuffer)application.getAttribute("chatMessage");
		if (null != chatMessage) {
			sourceMessage.append(chatMessage);
		}
		sourceMessage.append("系统公告：<font color='gray'>")
				.append(user.getNickname()).append("走进了聊天室！</font><br>");
		application.setAttribute("chatMessage", sourceMessage);		
		return "chatroom/main";
	}
	
	// 聊天室快照
	@RequestMapping("/snapshot")
	public String gotoSnapShot() {
		return "chatroom/snapshot";
	}
	
	// 响应在线人员列表
	@RequestMapping("/online")
	public String gotoOnline() {
		return "chatroom/online";
	}
	
	// 检查用户是否在聊天室列表中
	@RequestMapping("/check")
	public @ResponseBody String check(HttpSession session, HttpServletRequest request) throws Exception{
		User user = (User)session.getAttribute("user");
		if(user == null) {
			return "redirect:/user/userLogin.action";
		}
		@SuppressWarnings("unchecked")
		Map<User, HttpSession> chatUserMap = (Map<User, HttpSession>) request.getSession().getServletContext().getAttribute("chatUserMap");
		if(!chatUserMap.containsKey(user)) {
			// 用户不在聊天室列表中
			return "1";
		} else {
			// 用户在聊天室列表中
			// 设置用于聊天室列表检查的时间戳
			session.setAttribute("lastChatCheckTime", (Long)System.currentTimeMillis());
			return "2";
		}
	}
	
	// 退出聊天室
	@RequestMapping("/exit")
	public @ResponseBody String exit(HttpSession session, HttpServletRequest request) throws Exception{
		// 从chatUserMap中移除用户
		@SuppressWarnings("unchecked")
		Map<User, HttpSession> chatUserMap = (Map<User, HttpSession>) request.getSession().getServletContext().getAttribute("chatUserMap");
		User user = (User)session.getAttribute("user");
		chatUserMap.remove(user);
		System.out.println("user " + user.getUsername() + " exit");
		return "success";
	}
	
	// 发送聊天内容
	@RequestMapping("/sendMessage")
	public String sendMessage(HttpServletRequest request, ChatMessageVo chatMessage) throws Exception{
		// 发言时间 
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd hh:mm:ss");
		String sendTime = sdf.format(new Date()); // 发言时间
		// 获得ServletContext对象.
		ServletContext application = request.getSession().getServletContext();;
		//  从ServletContext中获取消息
		StringBuffer sourceMessage = (StringBuffer) application.getAttribute("chatMessage");
		// 拼接发言的内容:xx 对 yy 说 xxx
		StringBuffer newMessage = new StringBuffer();
		newMessage.append("<!-- msg_begin -->")
				.append("<font color='blue'><strong>").append(chatMessage.getFrom()).append("</strong></font>") 
				.append("对<font color='green'>[").append(chatMessage.getTo()).append("]</font>说")
				.append("（").append(sendTime).append("）：")
				.append("<font color='").append(chatMessage.getColor()).append("'>").append(chatMessage.getContent()).append("</font>");
		sourceMessage.append(newMessage);

		// 聊天记录系统备份判断
		Integer lengthChatMessage = (Integer)application.getAttribute("lengthChatMessage");
		lengthChatMessage += newMessage.length();
		if(lengthChatMessage >= Constant.LengthChatMsgClearTH) {
			Chatlog chatlog = new Chatlog();
			// type取0为系统备份
			chatlog.setType(0);
			chatlog.setCreatetime(new Date());
			chatlog.setContent(sourceMessage.toString());
			chatlogService.addNewChatlog(chatlog);
			// 保留聊天消息的后一半的第一条完整消息以后的部分
			String strSourceMessage = sourceMessage.substring(sourceMessage.length()/2);
			sourceMessage = new StringBuffer(strSourceMessage.indexOf("<!-- msg_begin -->"));
			lengthChatMessage = sourceMessage.length();
		}
		
		// 将消息存入到application的范围
		application.setAttribute("chatMessage", sourceMessage);
		application.setAttribute("lengthChatMessage", lengthChatMessage);
		
		return "forward:getMessage.action";
	}
	
	// 获取消息的方法
	//这样配置以解决@ResponseBody返回中文乱码问题
	@RequestMapping(value="/getMessage", produces="text/plain; charset=utf-8")
	public @ResponseBody String getMessage(HttpServletRequest request) throws Exception{
		StringBuffer chatMessage = (StringBuffer) request.getSession().getServletContext().getAttribute("chatMessage");
		if(chatMessage != null){
			return chatMessage.toString();
		}
		return "";
	}
	
	// 踢人的功能
	@RequestMapping("/kick")
	public String kick(HttpServletRequest request,Integer userId) throws Exception{
		if(userId == null) {
			throw new RuntimeException("踢人时用户id为空");
		}
		// 踢人:从chatUserMap中将用户对应session的聊天标记删除.
		// 获得chatUserMap集合(聊天室在线列表)
		@SuppressWarnings("unchecked")
		Map<User, HttpSession> chatUserMap = (Map<User, HttpSession>) request.getSession().getServletContext()
				.getAttribute("chatUserMap");
		// 获得这个用户对应的session.如何知道是哪个用户呢? id已经传递过来.去数据库中查询.
		// 重写user的equals 和 hashCode 方法 那么只要用户的id相同就认为是同一个用户.
		User user = new User();
		user.setId(userId);
		// 删除用户
		chatUserMap.remove(user);
		return "chatroom/main";
	}
}
