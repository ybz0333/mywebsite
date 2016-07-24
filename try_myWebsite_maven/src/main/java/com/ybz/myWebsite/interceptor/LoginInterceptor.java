package com.ybz.myWebsite.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ybz.myWebsite.po.User;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		//获取请求的url
		String url = request.getRequestURI();
		//判断url是否是公开 地址（实际使用时将公开 地址配置配置文件中）
		//这里公开地址是登陆提交的地址
		if(url.indexOf("snapshot.action")>0) {
			//如果进行登陆提交，放行
			return true;
		}
		
		//判断session
		HttpSession session = request.getSession();
		//从session中取出用户身份信息
		User user = (User)session.getAttribute("user");
		if(user != null) {
			//身份存在，放行
			return true;
		}
		
		//执行这里表示用户身份需要认证，跳转登陆页面
		request.getRequestDispatcher("/user/userLogin.action").forward(request, response);
		//return false表示拦截，不向下执行
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler, ModelAndView modelAndView) throws Exception {
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

}
