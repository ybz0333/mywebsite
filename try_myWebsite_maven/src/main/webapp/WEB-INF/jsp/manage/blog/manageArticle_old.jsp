<%@page import="java.util.List"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.ybz.myWebsite.po.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
    location.href = "${pageContext.request.contextPath}/manage/manageArticle.action?pageNum=" + (new_page_index+1);
    return false;
}
//删除确认
function deleteConfirm(urlStr) {
	var result = confirm("您确定要删除该文章吗？");
	if(result == true) {
		$.ajax({
			type : 'get',
			async : false,
			url : urlStr,
			//data : "",
			success : function(data){
				if(data == "success") {
					alert("删除成功");
				}
			}
		});
	}
	location.href = "${pageContext.request.contextPath}/manage/manageArticle.action?pageNum=${articleVoPager.currentPage}";
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
	
	//设置下拉列表ArticleTypeSelect的默认选中项
	var articleTypeId = "${articleSearchVo.articleType.id }";
	if(articleTypeId == "") {
		articleTypeId = 1;
	}
	/*
	//测试代码
	$("#ArticleTypeSelect option").each(function() {
		alert($(this).val());
	});
	alert($("#ArticleTypeSelect option[value=1]").val());
	*/
	var selectorString = "#ArticleTypeSelect option[value='" + articleTypeId + "']";
	$(selectorString).attr("selected","selected");
	//设置下拉列表ArticleTypeSelect的动作
	$("#ArticleTypeSelect").change(function() {
		$("#ArticleTypeForm").submit();
	});
	//设置下拉列表ArticleStateSelect的默认选中项
	var state = "${articleSearchVo.article.state }";
	if(state == "") {
		state = 0;
	}
	selectorString = "#ArticleStateSelect option[value='" + state + "']";
	$(selectorString).attr("selected","selected");
	//设置下拉列表ArticleStateSelect的动作
	$("#ArticleStateSelect").change(function() {
		$("#ArticleTypeForm").submit();
	});
	//设置下拉列表ArticleStateSelect的默认选中项
	//var chosenCreateTime = "${chosenCreateTime }";
	//alert("chosenCreateTime:"+chosenCreateTime);
	selectorString = "#ArticleTimeSelect option[value='" 
	     + "<fmt:formatDate value="${chosenCreateTime }" pattern="yyyy-MM-dd HH:mm:ss" />" 
	     + "']";
	$(selectorString).attr("selected","selected");
	//设置下拉列表ArticleTimeSelect的动作
	$("#ArticleTimeSelect").change(function() {
		$("#ArticleTypeForm").submit();
	});
});
</script>
</head>
<body>
	This is my JSP page.
	<br>
	<a href="${pageContext.request.contextPath}/manage/manageArticle.action">TEST</a>
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

	<form action="${pageContext.request.contextPath }/manage/manageArticle.action" id="ArticleTypeForm" >
		<label>文章类型</label>
		<select id="ArticleTypeSelect" name="articleType.id">
			<c:forEach items="${articleTypeVoList }" var="articleTypeVo">
				<option value="${articleTypeVo.id }">${articleTypeVo.typeName }	( ${articleTypeVo.numTotal }: ${articleTypeVo.numPublish }发布/${articleTypeVo.numDraft }草稿 )</option>
			</c:forEach>
		</select>
		
		<label>状态</label>
		<select id="ArticleStateSelect" name="article.state">
			<option value="0">全部</option>
			<option value="1">草稿</option>
			<option value="2">已发布</option>
		</select>
		
		<label>创建时间</label>
		<select id="ArticleTimeSelect" name="chosenCreateTime">
			<option value="">全部</option>
			<c:forEach items="${articleTimeVoList }" var="articleTimeVo">
				<%-- value要取以下格式，使配置的springmvc转换器能够解析该时间 --%>
				<option value="<fmt:formatDate value="${articleTimeVo.createtime }" pattern="yyyy-MM-dd HH:mm:ss" />">
				<fmt:formatDate value="${articleTimeVo.createtime }" pattern="yyyy年MM月" />
					( ${articleTimeVo.numTotal }: ${articleTimeVo.numPublish }发布/${articleTimeVo.numDraft }草稿 )
				</option>
			</c:forEach>
		</select>
	</form>

	<table width="100%" border=1>
		<c:forEach items="${articleTypeVoList }" var="articleTypeVo">
			<tr>
				<td>${articleTypeVo.id }</td>
				<td><a href="${pageContext.request.contextPath }/manage/manageArticle.action?articleType.id=${articleTypeVo.id }">${articleTypeVo.typeName }</a></td>
				<td>${articleTypeVo.numTotal }: ${articleTypeVo.numPublish }发布/${articleTypeVo.numDraft }草稿</td>
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
					<c:forEach items="${article.articleTypeList}" var="articleType">
						${articleType.id} ${articleType.typeName} ${articleType.description}
					</c:forEach>
				</td>
				<td>${article.tags }</td>
				<td>${article.introduction }</td>
				<td>
				<a href="${pageContext.request.contextPath }/manage/editArticle.action?id=${article.id }">编辑</a>
				</td>
				<td>
					<!-- 这里不添加href属性 -->
					<!-- 
					<a href="#" onclick="deleteConfirm()"><input type="hidden" value="${pageContext.request.contextPath }/manage/deleteArticle.action?id=${article.id }">删除</a>
					 -->
					 <a href="#" onclick="var urlStr='${pageContext.request.contextPath }/manage/deleteArticle.action?id=${article.id }';deleteConfirm(urlStr)">删除</a>
				</td>
				<td>
					<a href="#" onclick="var urlStr = '${pageContext.request.contextPath }/manage/previewArticle.action?id=${article.id }';window.open(urlStr,'预览')">预览</a>
				</td>
				<td>
				<c:choose>
					<c:when test="${article.state == 1 }">
						草稿   <a href="${pageContext.request.contextPath }/manage/changeState.action?id=${article.id}&stateChangeTo=2&pageNum=${articleVoPager.currentPage}">提交</a>
					</c:when>
					<c:when test="${article.state == 2 }">
						已提交   <a href="${pageContext.request.contextPath }/manage/changeState.action?id=${article.id}&stateChangeTo=1&pageNum=${articleVoPager.currentPage}">转为草稿</a>
					</c:when>
				</c:choose>
				</td>
			</tr>
		</c:forEach>
	</table>
	<br/> 
	<div id="News-Pagination"></div>
	<!-- 
	<form action="${pageContext.request.contextPath}/jdbcSql/JdbcSqlServlet"   id="stuForm"  method="post">
	</form>
	 -->
</body>
</html>
