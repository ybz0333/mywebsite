<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>阅读文章</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.js"></script>
<script src="${pageContext.request.contextPath}/ueditor/ueditor.parse.js"></script>
<script type="text/javascript">
function praiseArticle() {
	$.ajax({
		type : 'post',
		url : "${pageContext.request.contextPath }/article/praiseArticle.action",
		data : "id=${articleVo.id }",
		success : function(data){
			if(data.result == "success") {
				$("#praiseButton").val("已赞    " + data.praiseCount).attr("disabled","disabled");
			}
		}
	});
}

$(function(){
	//判断文章是否已被点赞
	var flagPraised = "${flagPraised }";
	if(flagPraised == "true") {
		$("#praiseButton").val("已赞").attr("disabled","disabled");
	}
	//显示文章内容
	uParse('.content',{
		rootPath: '${pageContext.request.contextPath}/ueditor/'
	});
})
</script>
</head>
<body>
<div>
	<ul>
		<li>${articleVo.title }</li>
		<li>作者：${articleVo.authorName }</li>
		<li>时间：
			<fmt:formatDate value="${articleVo.createtime}" 
			pattern="yyyy-MM-dd HH:mm:ss" />
		</li>

		<li>文章类型：
			<c:forEach items="${article.articleTypeList}" var="articleType">
				${articleType.id} ${articleType.typeName} ${articleType.description}
			</c:forEach>
		</li>
		<li>标签：
			<c:forEach items="${article.tags }" var="tag">
				${tag } 
			</c:forEach>
		</li>
		<li id="content">${articleVo.content }</li>
	</ul>
	<input id="praiseButton" type="button" value="点赞    ${praiseCount }" onclick="praiseArticle()"/>
</div>
</body>
</html>