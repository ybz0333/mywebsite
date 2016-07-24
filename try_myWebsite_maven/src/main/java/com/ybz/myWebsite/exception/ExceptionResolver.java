package com.ybz.myWebsite.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

public class ExceptionResolver implements HandlerExceptionResolver {

	@Override
	public ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex) {
		//错误信息
		String message = ex.getMessage();
		ModelAndView modelAndView = new ModelAndView();
		//将错误信息传到页面
		modelAndView.addObject("message", message);
		//指向错误页面
		modelAndView.setViewName("support/error");
		return modelAndView;
	}

}
