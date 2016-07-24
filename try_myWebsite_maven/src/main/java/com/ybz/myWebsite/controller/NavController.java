package com.ybz.myWebsite.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NavController extends BaseController{

	@RequestMapping("/home")
	public String gotoHome() {
		return "home";
	}
	
	@RequestMapping("/blog/blog_all_articles")
	public String gotoBlog() {
		return "blog/blog_all_articles";
	}
	
	@RequestMapping("/laboratory/laboratory")
	public String gotoLaboratory() {
		return "laboratory/laboratory";
	}

	// 聊天室的跳转放在ChatroomController中
	/*
	@RequestMapping("/chatroom")
	public String gotoChatroom() {
		return "chatroom";
	}
	*/
	
	@RequestMapping("/album")
	public String gotoAlbum() {
		return "album";
	}
	
	@RequestMapping("/aboutMe")
	public String gotoAboutMe() {
		return "aboutMe";
	}
	
	@RequestMapping("/manage/manage_main")
	public String gotoAdmin() {
		return "manage/manage_main";
	}
	
	@RequestMapping("/mynav")
	public String getMynav() {
		return "mynav";
	}
	
}
