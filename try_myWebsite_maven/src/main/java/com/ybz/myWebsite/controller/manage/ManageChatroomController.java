package com.ybz.myWebsite.controller.manage;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ybz.myWebsite.controller.BaseController;
import com.ybz.myWebsite.po.Chatlog;

@Controller
@RequestMapping("/manage/chatroom")
public class ManageChatroomController extends BaseController{

	// 跳转到“当前消息”选项 
	@RequestMapping("/currentChatMessage")
	public String gotoCurrentChatlog() throws Exception {
		return "manage/chatroom/currentChatMessage";
	}
	
	// 保存修改的当前聊天消息
	@RequestMapping("/saveChatMessage")
	public String saveChatMessage(HttpServletRequest request, String chatMessage) throws Exception {
		request.getSession().getServletContext().setAttribute("chatMessage", new StringBuffer(chatMessage));
		return "manage/chatroom/currentChatMessage";
	}
	
	// 清空当前聊天消息 
	@RequestMapping("/clearChatMessage")
	public @ResponseBody String clearChatMessage(HttpServletRequest request) throws Exception {
		request.getSession().getServletContext().setAttribute("chatMessage", new StringBuffer(""));
		return "success";
	}
	
	// 备份当前聊天消息
	@RequestMapping("/backupChatMessage")
	public @ResponseBody String backupChatMessage(String chatMessage) throws Exception {
		Chatlog chatlog = new Chatlog();
		// type取1为手动备份
		chatlog.setType(1);
		chatlog.setCreatetime(new Date());
		chatlog.setContent(chatMessage);
		chatlogService.addNewChatlog(chatlog);
		return "success";
	}
	
	// 跳转到“备份记录”选项 
	@RequestMapping("/listChatlogs")
	public String listChatlog(Model model) throws Exception {
		List<Chatlog> chatlogList = chatlogService.findChatlogsWithoutContent();
		model.addAttribute("chatlogList", chatlogList);
		return "manage/chatroom/listChatlogs";
	}
	
	// 查看聊天记录
	// 这样配置以解决@ResponseBody返回中文乱码问题
	@RequestMapping(value="/checkChatlog", produces="text/plain; charset=utf-8")
	public @ResponseBody String checkChatlog(Integer id) throws Exception {
		if(id == null) {
			throw new RuntimeException("按id查询聊天记录时id为空");
		}
		Chatlog chatlog = chatlogService.findChatlogById(id);
		return chatlog.getContent();
	}

	// 恢复该聊天记录备份到当前聊天消息中
	@RequestMapping("/recoverChatlog")
	public @ResponseBody String recoverChatlog(HttpServletRequest request, Integer id) throws Exception {
		if(id == null) {
			throw new RuntimeException("要恢复的备份Id为空");
		}
		Chatlog chatlog = chatlogService.findChatlogById(id);
		request.getSession().getServletContext().setAttribute("chatMessage", chatlog.getContent());
		return "success";
	}
	
	//编辑聊天记录
	@RequestMapping("/editChatlog")
	public String editChatlog(Model model, Integer id) throws Exception {
		if(id == null) {
			throw new RuntimeException("编辑聊天记录时id为空");
		}
		Chatlog chatlog = chatlogService.findChatlogById(id);
		model.addAttribute("chatlog", chatlog);
		return "manage/chatroom/editChatlog";
	}
	
	//更新聊天记录
	@RequestMapping("/updateChatlog")
	public @ResponseBody String updateChatlog(Chatlog chatlog) throws Exception{
		if(chatlog.getId() == null) {
			throw new RuntimeException("更新聊天记录时id为空");
		}
		if(chatlog.getCreatetime() == null) {
			chatlog.setCreatetime(new Date());
		}
		chatlogService.updateChatlog(chatlog);
		return "success";
	}
	
	@RequestMapping("/deleteChatlog")
	public @ResponseBody String deleteChatlog(Integer id) throws Exception {
		if(id == null) {
			throw new RuntimeException("要删除的备份Id为空");
		}
		chatlogService.deleteChatlogById(id);
		return "success";
	}
}
