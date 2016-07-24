package com.ybz.myWebsite.controller.front;

import java.awt.image.BufferedImage;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ybz.myWebsite.constants.Constant;
import com.ybz.myWebsite.controller.BaseController;
import com.ybz.myWebsite.po.User;
import com.ybz.myWebsite.util.CodeUtil;
import com.ybz.myWebsite.util.VerifyCodeUtil;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
	
	// 登录（跳转）
	@RequestMapping("/userLogin")
	public String gotoUserLogin() {
		return "user/userLogin";
	}
	// 登录（执行）
	@RequestMapping("/doUserLogin")
	public String login(HttpSession session, HttpServletRequest request, Model model, User user, String verifyCode) throws Exception {
		
		//用来装载错误信息
		Map<String,String> errors = new HashMap<String,String>();
		
		if (user.getUsername() == null || user.getUsername().trim().length() == 0
				|| user.getPassword() == null || user.getPassword().trim().length() == 0 ) {
			errors.put("userError", "用户名或密码不能为空");
		}
		if(verifyCode == null || verifyCode.trim().length() == 0) {
			errors.put("verifyCodeError", "验证码不能为空");
		}
		
		// 判断是否存在错误信息
		if(errors.size() > 0) {
			model.addAttribute("errors", errors);
			// user对象会自动数据回显
			return "user/userLogin";
		}
		
		// 对验证码进行校验
		String sessionVerifyCode = (String) session
				.getAttribute("session_vcode");
		session.removeAttribute("session_vcode");
		if (!verifyCode.equalsIgnoreCase(sessionVerifyCode)) {
			errors.put("verifyCodeError", "验证码错误");
		}
		
		// 判断是否存在错误信息
		if(errors.size() > 0) {
			model.addAttribute("errors", errors);
			// user对象会自动数据回显
			return "user/userLogin";
		}

		// 对密码加密
		String password = user.getPassword();
		password = CodeUtil.encryptBase64(password, Constant.DEFAULT_KEY);
		user.setPassword(password);
		// 对用户进行校验
		boolean hasUser = userService.VerifyUser(user);
		if (!hasUser) {
			errors.put("userError", "用户名或密码错误");
			model.addAttribute("errors", errors);
			return "user/userLogin";
		}
		
		// 判断是否存在错误信息
		if(errors.size() > 0) {
			model.addAttribute("errors", errors);
			// user对象会自动数据回显
			return "user/userLogin";
		}
		
		// 若用户已在在线列表中，则销毁用户原来的session
		@SuppressWarnings("unchecked")
		Map<User,HttpSession> userMap = (Map<User,HttpSession>)request.getSession().getServletContext().getAttribute("userMap");
		if(userMap.containsKey(user)) {
			HttpSession sessionTemp = userMap.get(user);
			sessionTemp.invalidate();
		}
		// 在session中保存用户身份信息
		session.setAttribute("user", user);
		// 更新用户列表
		userMap.put(user, session);
		// 重定向到主页
		return "redirect:/home.action";
	}
	
	// 退出
	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request) throws Exception {
		User user = (User)session.getAttribute("user");
		// 从在线用户列表中删除该用户
		@SuppressWarnings("unchecked")
		Map<User,HttpSession> userMap = (Map<User,HttpSession>)request.getSession().getServletContext().getAttribute("userMap");
		userMap.remove(user);
		// 从session中删除用户
		session.removeAttribute("user");
		// 重定向到主页
		return "redirect:/home.action";
	}
	
	//生成验证码
	@RequestMapping("/getVerifyCode")
	public void getVerifyCode(HttpSession session, HttpServletResponse response) throws Exception {
		//1. 创建验证码类
		VerifyCodeUtil vc = new VerifyCodeUtil();
		//2. 得到验证码图片
		BufferedImage image = vc.getImage();
		//3. 把图片上的文本保存到session中
		session.setAttribute("session_vcode", vc.getText());
		//4. 把图片响应给客户端
		VerifyCodeUtil.output(image, response.getOutputStream());
	}
	
	// 用户注册（跳转）
	@RequestMapping("/userRegist")
	public String gotoUserRegist() {
		return "user/userRegist";
	}
	
	// 用户注册（执行）
	@RequestMapping("/doUserRegist")
	public String regist(HttpSession session, Model model, User user,
			String passwordAgain, String verifyCode) throws Exception {
		
		//用来装载错误信息
		Map<String,String> errors = new HashMap<String,String>();
		
		if(user.getUsername() == null || user.getUsername().trim().isEmpty()) {
			errors.put("usernameError", "用户名不能为空！");
		} else if(user.getUsername().length() < 3 || user.getUsername().length() > 10) {
			errors.put("usernameError", "用户名长度必须在3~10之间！");
		}
		
		if(user.getPassword() == null || user.getPassword().trim().isEmpty()) {
			errors.put("passwordError", "密码不能为空！");
		} else if(user.getPassword().length() < 3 || user.getPassword().length() > 10) {
			errors.put("passwordError", "密码长度必须在3~10之间！");
		}
		
		if(passwordAgain == null || passwordAgain.trim().isEmpty()) {
			errors.put("passwordAgainError", "密码不能为空！");
		} else if(passwordAgain.length() < 3 || passwordAgain.length() > 10) {
			errors.put("passwordAgainError", "密码长度必须在3~10之间！");
		} else if(!passwordAgain.equals(user.getPassword())) {
			errors.put("passwordAgainError", "两次输入的密码不一致！");
		}
		
		if(verifyCode == null || verifyCode.trim().isEmpty()) {
			errors.put("verifyCodeError", "验证码不能为空");
		}
		
		// 判断是否存在错误信息
		if(errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("username", user.getUsername());
			model.addAttribute("nickname", user.getNickname());
			return "user/userRegist";
		}
		
		// 对验证码进行校验
		String sessionVerifyCode = (String) session
				.getAttribute("session_vcode");
		session.removeAttribute("session_vcode");
		if (!verifyCode.equalsIgnoreCase(sessionVerifyCode)) {
			errors.put("verifyCodeError", "验证码错误");
		}
		
		// 判断是否存在错误信息
		if(errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("username", user.getUsername());
			model.addAttribute("nickname", user.getNickname());
			return "user/userRegist";
		}
		
		// 用户注册
		// 如果用户昵称为空，则将昵称设置成与用户名一样
		if(user.getNickname() == null || user.getNickname().trim().length() == 0) {
			user.setNickname(user.getUsername());	
		}
		// 对密码加密
		user.setPassword(CodeUtil.encryptBase64(user.getPassword(), Constant.DEFAULT_KEY));
		user.setPermission(0);
		user.setRegisttime(new Date());
		if(userService.registUser(user) == -1) {
			errors.put("usernameError", "用户名已被注册");
		}

		// 判断是否存在错误信息
		if(errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("username", user.getUsername());
			model.addAttribute("nickname", user.getNickname());
			return "user/userRegist";
		}

		// 保存成功信息，转发到消息页面
		model.addAttribute("msg", "注册成功");
		return "msg";
	}
	
	// 更改名称（跳转）
	@RequestMapping("/changeNames")
	public String gotoChangeUsername(HttpSession session, Model model) {
		User user = (User)session.getAttribute("user");
		if(user == null) {
			return "redirect:userLogin.action";
		}
		model.addAttribute("username", user.getUsername());
		model.addAttribute("nickname", user.getNickname());
		return "user/changeNames";
	}
	
	// 更改名称（执行）
	@RequestMapping("/doChangeNames")
	public String changeNames(HttpSession session, Model model, String newUsername, String newNickname) throws Exception {
		
		User user = (User)session.getAttribute("user");
		if(user == null) {
			return "redirect:userLogin.action";
		}
		
		//用来装载错误信息
		Map<String,String> errors = new HashMap<String,String>();
		
		if(newUsername == null || newUsername.trim().isEmpty()) {
			errors.put("usernameError", "请输入用户名！");
		} else if(newUsername.length() < 3 || newUsername.length() > 10) {
			errors.put("usernameError", "用户名长度必须在3~10之间！");
		}
		
		// 判断是否存在错误信息
		if(errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("username", newUsername);
			model.addAttribute("nickname", newNickname);
			return "";
		}
		
		// 更新用户名
		user.setUsername(newUsername);
		// 当用户昵称不为空时，才设置新昵称；否则保留原来的昵称
		if(newNickname != null && newNickname.trim().length() != 0) {
			user.setNickname(newNickname);	
		}
		userService.updateUser(user);
		// 清除session中的用户信息
		session.removeAttribute("user");
		
		// 保存成功信息，转发到消息页面
		model.addAttribute("msg", "用户信息修改成功，请重新登录");
		return "msg";
	}
	
	// 更改名称（跳转）
	@RequestMapping("/changePassword")
	public String gotoChangepassword(HttpSession session, Model model) {
		User user = (User)session.getAttribute("user");
		if(user == null) {
			return "redirect:userLogin.action";
		}
		return "user/changePassword";
	}
	
	// 更改密码（执行）
	@RequestMapping("/doChangePassword")
	public String changePassword(HttpSession session, Model model, String password,
			String newPassword, String newPasswordAgain) throws Exception {
		
		User user = (User)session.getAttribute("user");
		if(user == null) {
			return "redirect:userLogin.action";
		}
		
		//用来装载错误信息
		Map<String,String> errors = new HashMap<String,String>();
		
		if(password == null || password.trim().isEmpty()) {
			errors.put("passwordError", "请输入原密码！");
		} else if(password.length() < 3 || password.length() > 10) {
			errors.put("passwordError", "密码长度必须在3~10之间！");
		}
		
		if(newPassword == null || newPassword.trim().isEmpty()) {
			errors.put("newPasswordError", "请输入新密码！");
		} else if(newPassword.length() < 3 || newPassword.length() > 10) {
			errors.put("newPasswordError", "密码长度必须在3~10之间！");
		}
		
		if(newPasswordAgain == null || newPasswordAgain.trim().isEmpty()) {
			errors.put("passwordAgainError", "请再次输入原密码！");
		} else if(newPasswordAgain.length() < 3 || newPasswordAgain.length() > 10) {
			errors.put("passwordAgainError", "密码长度必须在3~10之间！");
		} else if(!newPasswordAgain.equals(newPassword)) {
			errors.put("passwordAgainError", "两次输入的密码不一致！");
		}
		
		// 判断是否存在错误信息
		if(errors.size() > 0) {
			model.addAttribute("errors", errors);
			return "user/changePassword";
		}
		
		// 验证输入的原密码
		if(!password.equals(user.getPassword())) {
			errors.put("passwordError", "原密码错误！");
		}
		
		// 判断是否存在错误信息
		if(errors.size() > 0) {
			model.addAttribute("errors", errors);
			return "user/changePassword";
		}
		
		// 对密码加密
		newPassword = CodeUtil.encryptBase64(newPassword, Constant.DEFAULT_KEY);
		// 更新密码
		user.setPassword(newPassword);
		userService.updateUser(user);
		// 清除session中的用户信息
		session.removeAttribute("user");
		
		// 保存成功信息，转发到消息页面
		model.addAttribute("msg", "密码修改成功，请重新登录");
		return "msg";
	}
}
