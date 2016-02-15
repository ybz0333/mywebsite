package com.ybz.myWebsite.controller.manage;

import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.itcast.vcode.utils.VerifyCode;

import com.ybz.myWebsite.controller.BaseController;
import com.ybz.myWebsite.po.User;

@Controller
@RequestMapping("/manage")
public class LoginController extends BaseController {

	// 登录
	@RequestMapping("/login")
	public String login(HttpSession session, Model model, String username,
			String password, String verifyCode) throws Exception {

		if (username == null || password == null || verifyCode == null) {
			return "login";
		}
		
		//用来装载错误信息
		Map<String,String> errors = new HashMap<String,String>();
		// 对用户进行校验
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		boolean hasUser = userService.VerifyUser(user);
		if (!hasUser) {
			errors.put("userError", "用户名或密码错误");
			model.addAttribute("errors", errors);
			return "login";
		}
		// 对验证码进行校验
		String sessionVerifyCode = (String) session
				.getAttribute("session_vcode");
		session.removeAttribute("session_vcode");
		if (sessionVerifyCode == null) {
			throw new RuntimeException("sessionVerifyCode == null");
		} else if (!verifyCode.equalsIgnoreCase(sessionVerifyCode)) {
			errors.put("verifyCodeError", "验证码错误");
			model.addAttribute("errors", errors);
			return "login";
		}

		// 在session中保存用户身份信息
		session.setAttribute("username", username);
		// 重定向到管理页面
		return "redirect:/manage/manageArticle.action";
	}
	
	// 退出
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		
		session.removeAttribute("username");
		// 重定向到管理页面
		return "redirect:/manage/manageArticle.action";
	}
	
	//生成验证码
	@RequestMapping("/getVerifyCode")
	public void getVerifyCode(HttpSession session, HttpServletResponse response) throws Exception {
		//1. 创建验证码类
		VerifyCode vc = new VerifyCode();
		//2. 得到验证码图片
		BufferedImage image = vc.getImage();
		//3. 把图片上的文本保存到session中
		session.setAttribute("session_vcode", vc.getText());
		//4. 把图片响应给客户端
		VerifyCode.output(image, response.getOutputStream());
	}
}
