<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ybz's blog</title>
    <link rel="shortcut icon" href="<c:url value='/img/favicon.ico'/>">
    <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/pagination.css'/>" rel="stylesheet" type="text/css"/>

    <!--[if lt IE 9]>
    <script src="<c:url value='/js/html5shiv.js'/>"></script>
    <script src="<c:url value='/js/respond.min.js'/>"></script>
    <![endif]-->
    <script src="<c:url value='/js/jquery-1.11.3.js'/>"></script>
    <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/jquery.pagination.js'/>"></script>
    <script type="text/javascript">
    $(function(){
        $("#mynav").load("<c:url value='/mynav.action'/>", function() {
            $("#manager").addClass("active");    
        });
        /*
        $("#blog_left").load("blog_left_admin.html");
        //$("#blog_right").load("blog_content.html");
        //$("#blog_right").load("blog_order.html");
        */
    });

	//点击分页按钮以后触发的动作
	function handlePaginationClick(new_page_index, pagination_container) {
	    //$("#stuForm").attr("action", "${pageContext.request.contextPath}/article/queryArticles.action?pageNum=" + (new_page_index+1));
	    //$("#stuForm").submit();
	    
	    //$.get("${pageContext.request.contextPath}/article/queryArticles.action?pageNum=" + (new_page_index+1));
	    location.href = "${pageContext.request.contextPath}/manage/blog/manageArticle.action?pageNum=" + (new_page_index+1);
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
		location.href = "${pageContext.request.contextPath}/manage/blog/manageArticle.action?pageNum=${articleVoPager.currentPage}";
	}
	
	$(function(){
		$("#article-Pagination").pagination(${articleVoPager.totalRecord}, {
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
<style>
       body {
           padding-top: 50px;
           padding-bottom: 40px;
           color: #5a5a5a;
       }
       

       .main {
           padding: 20px;
       }

       .main .page-header {
           margin-top: 0;
       }
       
       /*覆盖bootstrap的表格样式，使表头和内容的文字都居中*/
       table th, table td {
       	text-align: center;
       }
</style>

</head>

<body>
    <!--下面是顶部导航栏的代码-->
<div id="mynav">
</div>

<!--自适应布局-->
<div class="container-fluid">
    <div class="row">
        <!--左侧导航栏-->
        <div class="col-sm-3 col-md-2 col-xs-3 sidebar" id ="blog_left">
        <%@ include file="../manage_left.jsp" %>
        </div>

        <!--右侧管理控制台-->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 col-xs-9 col-xs-offset-3 main" id="blog_right">
        	<h2 class="page-header">文章列表</h2>
       		<form action="${pageContext.request.contextPath }/manage/blog/manageArticle.action" id="ArticleTypeForm" >
				<label>文章类型</label>
				<select id="ArticleTypeSelect" name="articleType.id">
					<c:forEach items="${articleTypeVoList }" var="articleTypeVo">
						<option value="${articleTypeVo.id }">${articleTypeVo.typeName }	( ${articleTypeVo.numTotal }: ${articleTypeVo.numPublish }发布/${articleTypeVo.numDraft }草稿 )</option>
					</c:forEach>
				</select>&nbsp;&nbsp;&nbsp;&nbsp;
				
				<label>状态</label>
				<select id="ArticleStateSelect" name="article.state">
					<option value="0">全部</option>
					<option value="1">草稿</option>
					<option value="2">已发布</option>
				</select>&nbsp;&nbsp;&nbsp;&nbsp;
				
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
			<br/>
        	
			<table class="table table-striped terable-hover">
			  <thead>
			    <tr>
			      <th>id</th>
			      <th>作者</th>
			      <th>标题</th>
			      <th>创建时间</th>
			      <th>文章类型</th>
			      <th>标签</th>
			      <th>点击量</th>
			      <th>点赞数</th>
			      <th>操作</th>
			      <th>状态</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<c:forEach items="${articleVoPager.dataList}" var="article">
					<tr>
						<td>${article.id }</td>
						<td>${article.authorName }</td>
						<td><a href="${pageContext.request.contextPath }/blog/read.action?id=${article.id }">${article.title }</a></td>
						<td><fmt:formatDate value="${article.createtime}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>
							<c:forEach items="${article.articleTypeList}" var="articleType">
								${articleType.typeName}&nbsp;
							</c:forEach>
						</td>
						<td>${article.tags }</td>
						<td>${article.clickCount }</td>
						<td>${article.praiseCount }</td>
						<td>
							<a href="${pageContext.request.contextPath }/manage/blog/editArticle.action?id=${article.id }">编辑</a>
							&nbsp;&nbsp;
							<!-- 这里不添加href属性 -->
							<!-- 
							<a href="#" onclick="deleteConfirm()"><input type="hidden" value="${pageContext.request.contextPath }/manage/deleteArticle.action?id=${article.id }">删除</a>
							 -->
							<a href="#" onclick="var urlStr='${pageContext.request.contextPath }/manage/blog/deleteArticle.action?id=${article.id }';deleteConfirm(urlStr)">删除</a>
							&nbsp;&nbsp;
							<a href="#" onclick="var urlStr = '${pageContext.request.contextPath }/manage/blog/previewArticle.action?id=${article.id }';window.open(urlStr,'预览')">预览</a>
						</td>
						<td>
						<c:choose>
							<c:when test="${article.state == 1 }">
								草稿   <a href="${pageContext.request.contextPath }/manage/blog/changeState.action?id=${article.id}&stateChangeTo=2&pageNum=${articleVoPager.currentPage}">发布</a>
							</c:when>
							<c:when test="${article.state == 2 }">
								已发布   <a href="${pageContext.request.contextPath }/manage/blog/changeState.action?id=${article.id}&stateChangeTo=1&pageNum=${articleVoPager.currentPage}">转为草稿</a>
							</c:when>
						</c:choose>
						</td>
					</tr>
				</c:forEach>
			  </tbody>
			</table>
			<br/> 
			<div id="article-Pagination"></div>
        </div>

	</div>
</div>


<!-- <script src="js/jquery-1.11.1.min.js"></script> -->
<!-- <script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.min.js"></script> -->

</body>
</html>