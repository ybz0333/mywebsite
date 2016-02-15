<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台导航栏</title>
</head>
<body>
<div>
	<ul>
		<li>
			<a href="${pageContext.request.contextPath }/manage/editNewArticle.action">编辑新文章</a>
		</li>
		<li>
			<a href="${pageContext.request.contextPath }/manage/manageArticle.action">文章管理</a>
		</li>		
		<li>
			<a href="${pageContext.request.contextPath }/manage/queryArticleTypesWithNum.action">文章类型管理</a>
		</li>
	</ul>
</div>
</body>
</html>