package com.ybz.myWebsite.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.ybz.myWebsite.service.ArticleService;
import com.ybz.myWebsite.service.ArticleTypeService;
import com.ybz.myWebsite.service.EmailService;
import com.ybz.myWebsite.service.UserService;

/**
 * BaseController集合了所有Service对象，并实现自动注入
 * BaseController包含了Logger记录器
 * @author lenovo
 */
public class BaseController {
	//Logger
	protected static Logger LOGGER = LoggerFactory.getLogger(BaseController.class);
	
	//文章service
	@Autowired
	protected ArticleService articleService;
	
	//文章类型service
	@Autowired
	protected ArticleTypeService articleTypeService;
	
	//用户service
	@Autowired
	protected UserService userService;
	
	//邮件service
	@Autowired
	protected EmailService emailService;
}
