<%@page import="java.util.List"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.ybz.myWebsite.po.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章查询测试</title>
<link href="${pageContext.request.contextPath}/css/pagination.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
<script type="text/javascript">
//点击分页按钮以后触发的动作
function handlePaginationClick(new_page_index, pagination_container) {
    //$("#stuForm").attr("action", "${pageContext.request.contextPath}/article/queryArticles.action?pageNum=" + (new_page_index+1));
    //$("#stuForm").submit();
    
    //$.get("${pageContext.request.contextPath}/article/queryArticles.action?pageNum=" + (new_page_index+1));
    location.href = "${pageContext.request.contextPath}/article/queryArticles.action?pageNum=" + (new_page_index+1);
    return false;
}

$(function(){
	$("#News-Pagination").pagination(${articleVoPager.totalRecord}, {
        items_per_page:${articleVoPager.pageSize}, // 每页显示多少条记录
        current_page:${articleVoPager.currentPage} - 1, // 当前显示第几页数据
        num_display_entries:8, // 分页显示的条目数
        next_text:"下一页",
        prev_text:"上一页",
        num_edge_entries:2, // 连接分页主体，显示的条目数
        callback:handlePaginationClick
	});
	
	// 设置学生默认性别
	$("#gender").val("${gender}");
});
</script>
</head>
<body>
	This is my JSP page.
	<br>
	<a href="${pageContext.request.contextPath}/article/queryArticles.action">TEST</a>
	<%
	//测试代码
	/*
		Enumeration<String> enu = request.getAttributeNames();
		//out.print(enu.toString());
		while(enu.hasMoreElements())
		{
			out.println(request.getAttribute(enu.nextElement()));
		} 
	*/
		
	/*
		List<ArticleVo> articleVoList = (List<ArticleVo>)request.getAttribute("articleVoList");
		out.println(articleVoList);
		out.println(articleVoList.get(0).getArticleTypeList().get(0));
	*/
	%>
	<!--
	<h2>
		<c:forEach items="${pageContext.request.attributeNames }" var="attributeName">
		<span>${attributeName}</span>
		</c:forEach>
	</h2>
	 -->

	<table width="100%" border=1>
		<c:forEach items="${articleTypeVoList }" var="articleTypeVo">
			<tr>
				<td>${articleTypeVo.id }</td>
				<td><a href="${pageContext.request.contextPath }/article/queryArticles.action?articleType.id=${articleTypeVo.id }">${articleTypeVo.typeName }</a></td>
				<td>${articleTypeVo.numPublish }</td>
			</tr>
		</c:forEach>
	</table>

	 
	<table width="100%" border=1>
		<c:forEach items="${articleVoPager.dataList}" var="article">
			<tr>
				<td>${article.id }</td>
				<td>${article.authorName }</td>
				<td><a href="${pageContext.request.contextPath }/article/read.action?id=${article.id }">${article.title }</a></td>
				<td>${article.content }</td>
				<td>${article.note }</td>
				<td><fmt:formatDate value="${article.createtime}"
						pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td>
					<c:forEach items="${article.articleTypeList }" var="articleType">
						${articleType.id } ${articleType.typeName } ${articleType.description }
					</c:forEach>
				</td>
				<td>
					<c:forEach items="${article.tags }" var="tag">
						${fn:trim(tag) } 
					</c:forEach>
				</td>
				<td>${article.introduction }</td>
			</tr>
		</c:forEach>
	</table>
	<br> 
	<div id="News-Pagination"></div>
	<!-- 
	<form action="${pageContext.request.contextPath}/jdbcSql/JdbcSqlServlet"   id="stuForm"  method="post">
	</form>
	 -->
</body>
</html>
