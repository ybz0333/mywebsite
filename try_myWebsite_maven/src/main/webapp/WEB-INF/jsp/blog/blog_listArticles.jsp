<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
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
</style>
<script src="<c:url value='/js/jquery-1.11.3.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.pagination.js'/>"></script>
<script type="text/javascript">
    $(function(){
        $("#mynav").load("<c:url value='/mynav.action'/>", function() {
            $("#navbar_blog").addClass("active");    
        });
        /*
        $("#blog_left").load("<c:url value='/blog/blog_left.action'/>");
        //$("#blog_right").load("blog_content.html");
        //$("#blog_right").load("blog_order.html");
        */
    });
    
  //点击分页按钮以后触发的动作
    function handlePaginationClick(new_page_index, pagination_container) {
        //$("#stuForm").attr("action", "${pageContext.request.contextPath}/article/queryArticles.action?pageNum=" + (new_page_index+1));
        //$("#stuForm").submit();
        
        //$.get("${pageContext.request.contextPath}/article/queryArticles.action?pageNum=" + (new_page_index+1));
        location.href = "${pageContext.request.contextPath}/blog/queryArticles.action?pageNum=" + (new_page_index+1);
        return false;
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
    });
</script>

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
        <%@ include file="blog_left.jsp" %>
        </div>

        <!--右侧管理控制台-->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 col-xs-9 col-xs-offset-3 main" id="blog_right">
        	<div style="margin: 15px 15px">
	        	<!-- <h1 class="page-header">所有文章</h1> -->
	        	<!-- articleSearchVo来自数据回显 -->
	        	<h1 class="page-header">${articleTypeName }</h1>
	        	<c:forEach items="${articleVoPager.dataList}" var="article">
				<!--panel面板，里面放置一些控件，下同-->
				<div class="row">
				    <div class="col-md-10">
						<div class="panel panel-primary" style="border-color: #D9EDF7">
							<!--panel面板的标题，下同-->
							<div class="panel-heading" style="color: #000;background-color: #D9EDF7;border-color: #D9EDF7">
								<!-- <h1 class="panel-title" style="color: #000;text-indent: 100px;">最新提醒</h1> -->
								<div class="row">
									<!-- <div class="col-md-7 col-md-offset-1"> -->
									<div class="col-md-7">
										<h3 style="font-weight:bold; margin: 0px 20px; display: inline">
											${article.title }
										</h3>
									</div>
									<!-- <div class="col-md-4"> -->
									<div class="col-md-3 col-md-offset-2">
										<h4 style="margin: 5px auto 0px; font-style: italic"><fmt:formatDate value="${article.createtime}" pattern="yyyy年MM月dd日" /></h4>
									</div>
								</div>
							</div>
							<!--panel面板的内容，下同-->
							<div class="panel-body" style="color: #000;">
								<div class="row">
									<div class="col-md-8">
										<div style="margin-top: 0px; margin-bottom: 15px;margin-left: 20px">
											<c:if test="${empty article.tags }">
												<div style="height: 10px">
												</div>
											</c:if>
											<c:forEach items="${article.tags }" var="tag">
												<span class="label label-info">${fn:trim(tag) }</span>&nbsp;
											</c:forEach>
										</div>
										<p style="font-size: 1.4em; text-indent: 2em; height: 140px;">
											<!-- 这里是摘要内容 -->
											${article.introduction }
										</p>
										<!-- <div style="margin: 15px auto"> -->
										<div style="margin: 10px auto">
											<a href="<c:url value='/blog/read.action?id=${article.id }'/>" style="font-size: 18px; font-family: 'Microsoft Yahei'">阅读全文&nbsp;&gt;&gt;</a>
										</div>
									</div>
									<div class="col-md-3 col-md-offset-1">
										<img class="img-rounded" alt="ybz's blog" src="<c:url value='/img/article_picture/${article.imgName }'/>" width="180" height="180" style="margin: 20px auto"/>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div style="height: 15px">
				</div>
				</c:forEach>
				<div id="article-Pagination"></div>
	        </div>
	    </div>
    </div>
</div>


<!-- <script src="js/jquery-1.11.1.min.js"></script> -->
<!-- <script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.min.js"></script> -->

</body>
</html>