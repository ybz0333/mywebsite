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
				    <div class="col-md-9">
						<div class="panel panel-primary" style="border-color: #D9EDF7">
							<!--panel面板的标题，下同-->
							<div class="panel-heading" style="color: #000;background-color: #D9EDF7;border-color: #D9EDF7">
								<!-- <h1 class="panel-title" style="color: #000;text-indent: 100px;">最新提醒</h1> -->
								<div class="row">
									<div class="col-md-7 col-md-offset-1">
										<h3 style="font-weight:bold;margin: 0px auto;display: inline">
											${article.title }
										</h3>
									</div>
									<div class="col-md-4">
										<h4 style="margin: 5px 0px auto"><fmt:formatDate value="${article.createtime}" pattern="yyyy年MM月dd日 HH:mm:ss" /></h4>
									</div>
								</div>
							</div>
							<!--panel面板的内容，下同-->
							<div class="panel-body" style="color: #000;">
								<p style="font-size: 1.4em;text-indent: 2em;">
									<!-- 这里是摘要内容 -->
									${article.introduction }
								</p>
								<!-- <div style="margin: 15px auto"> -->
								<div>
									<a href="<c:url value='/blog/read.action?id=${article.id }'/>" style="font-size: 18px;">阅读全文&nbsp;&gt;&gt;</a>
								</div>
							</div>
						</div>
					</div>
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