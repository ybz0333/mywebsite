package com.ybz.myWebsite.controller.manage;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ybz.myWebsite.controller.BaseController;
import com.ybz.myWebsite.po.User;

@Controller
@RequestMapping("/manage/user")
public class ManageUserController extends BaseController{

	//查询所有用户
	@RequestMapping("/listUsers")
	public String listUsers(Model model) throws Exception {
		List<User> userList = userService.findUsers();
		model.addAttribute("userList", userList);
		return "manage/user/listUsers";
	}
	
	//删除用户
	@RequestMapping("/deleteUser")
	public @ResponseBody String deleteUser(Model model, Integer userId) throws Exception {
		if(userId == null) {
			throw new RuntimeException("要删除的用户Id为空");
		}
		userService.deleteUserById(userId);
		return "success";
	}
}
