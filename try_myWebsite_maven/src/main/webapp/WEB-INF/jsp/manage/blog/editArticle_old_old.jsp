<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑文章</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.js"></script>
<!-- ueditor相关 -->
<!-- 配置文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/ueditor/ueditor.all.js"></script>
<!-- 实例化编辑器 -->
<script type="text/javascript">
	$(function() {
		//ueditor编辑器设置
		//window.UEDITOR_HOME_URL = "/testGrammar/ueditor/";
		var editor = UE.getEditor('container');
		
		//给checkbox中已选的文章类型打上勾
		$("#articleTypeDiv > input").each(function(){
		<c:forEach items="${articleVo.articleTypeList }" var="articleType">
		//console.log($(this).val());
		console.log(${articleType.id} );
			if($(this).val() == "${articleType.id }") {
				$(this).attr("checked","checked");
			}
		</c:forEach>
		});
		//为时间输入框设置初始值
		var createtimeStr = "<fmt:formatDate value="${articleVo.createtime }" pattern="yyyy-MM-dd HH:mm:ss" />";
		$("#createtimeInput").val(createtimeStr);
		
		//根据${articleVo}是否为空来判断是添加新文章还是修改文章
		var option = "${articleVo}";
		if(option == "") {
			$("#articleEditor").attr("action","${pageContext.request.contextPath }/manage/addNewArticle.action");
		} else {
			$("#articleEditor").attr("action","${pageContext.request.contextPath }/manage/updateArticle.action");
		}
		
	});
</script>
</head>
<body>
	<form id="articleEditor" action="#" method="post">
		<!-- 文章id -->
		<input type="hidden" name="id" value="${articleVo.id }" /><br />
		 标题：<input name="title" value="${articleVo.title }" /><br />
		作者：<input name="authorName" value="${articleVo.authorName }" /><br />
		<div id="articleTypeDiv">
			类型：<br/>
			<c:forEach items="${articleTypeList }" var="articleType" varStatus="status">
				<input type="checkbox" name="articleTypeList[${status.index }].id" value="${articleType.id }"/>${articleType.typeName }
			</c:forEach><br />
		</div>
		新增类型（请用逗号分隔）：<input type="text" name="newArticleTypeText" /><br />
		标签（请用逗号分隔）：<input name="tags" value="${articleVo.tags }"/><br/>
		状态：
		<select name="state">
			<option value="1" selected="selected">草稿</option>
			<option value="2">已发布</option>
		</select>
		<br/>
		<label>摘要：</label><br/>
		<textarea name="introduction" rows="6" cols="40">${articleVo.introduction }</textarea><br/>
		时间（格式：yyyy-MM-dd HH:mm:ss，不填则设置为当前时间）：<br/>
		<input id="createtimeInput" type="text" name="createtime"/><br/>	
		<label>备注：</label><br/>
		<textarea name="note" rows="3" cols="20">${articleVo.note }</textarea><br/>
		<!-- ueditor编辑器 -->
		<!-- 加载编辑器的容器 -->
		<script id="container" name="content" type="text/plain">${articleVo.content }</script><br/>
		<input type="submit" value="保存">
	</form>
</body>
</html>