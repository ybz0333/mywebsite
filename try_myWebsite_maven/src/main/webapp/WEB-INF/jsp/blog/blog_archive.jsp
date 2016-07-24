<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script type="text/javascript">
    $(function(){
        $("#mynav").load("<c:url value='/mynav.action'/>", function() {
            $("#navbar_blog").addClass("active");    
        });
        /*
        $("#blog_left").load("blog_left.html");
        //$("#blog_right").load("blog_content.html");
        //$("#blog_right").load("blog_order.html");
        */
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
        	<div style="margin: 15px">
	        	<h1 class="page-header">文章归档</h1>
					<p style="font-size: 16px">
						将所有文章整理归档，以便查看。
					</p>
					<c:forEach items="${articleArchiveVoList }" var="articleArchiveVo">
						<h3>
							<fmt:formatDate
								value="${articleArchiveVo.articleTimeGroup.createtime }"
								pattern="yyyy年MM月" />
						</h3>
						<ul>
							<c:forEach items="${articleArchiveVo.articleVoList}" var="article">
								<li>
									<a href="<c:url value='/blog/read.action?id=${article.id }'/>"
									 style="font-size: 20px">${article.title }</a>
									<!-- <span style="margin-left: 24px">(2016年5月14日，显示英文)</span> -->
									<span style="margin-left: 24px">
										<fmt:formatDate value="${article.createtime}"
										 pattern="yyyy-MM-dd" />
									</span>
								</li>
							</c:forEach>
						</ul>
					</c:forEach>
				</div>
        </div>
    </div>
</div>


<!-- <script src="js/jquery-1.11.1.min.js"></script> -->
<!-- <script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.min.js"></script> -->

</body>
</html>



