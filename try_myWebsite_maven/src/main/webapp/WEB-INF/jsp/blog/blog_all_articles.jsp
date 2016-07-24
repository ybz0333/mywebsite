<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ybz's blog</title>
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
        $("#blog_left").load("<c:url value='/blog/blog_left.action'/>");
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
        	<div style="margin: 15px 15px">
	        	<h1 class="page-header">所有文章</h1>
				<!--panel面板，里面放置一些控件，下同-->
				<div class="row">
				    <div class="col-md-9">
						<div class="panel panel-primary" style="border-color: #D9EDF7">
							<!--panel面板的标题，下同-->
							<div class="panel-heading" style="color: #000;background-color: #D9EDF7;border-color: #D9EDF7">
								<!-- <h1 class="panel-title" style="color: #000;text-indent: 100px;">最新提醒</h1> -->
								<div class="row">
									<div class="col-md-7 col-md-offset-1">
										<h2 style="font-weight:bold;margin: 0px auto;display: inline">文章1
										</h2>
									</div>
									<div class="col-md-4">
										<h4>2016年5月13日</h4>
									</div>
								</div>
							</div>
							<!--panel面板的内容，下同-->
							<div class="panel-body" style="color: #000;">
								<p style="font-size: 1.4em;text-indent: 2em;">
								这里是摘要内容
								</p>
								<div style="margin: 15px auto">
									<a href="blog_content.html" style="font-size: 1.8em;">阅读全文</a>
								</div>
								<!-- <div class="alert alert-success" role="alert"> <strong>提示</strong>
									您的订单（2014001）已经审批通过！
								</div>
								<div class="alert alert-danger" role="alert"> <strong>提示</strong>
									您的订单（2014002）被打回！
								</div>
								<div class="alert alert-warning" role="alert">
									<strong>提示</strong>
									您的订单（2013001）客户付款延迟！
								</div> -->
							</div>
						</div>
					</div>
				</div>
	        </div>
	    </div>
    </div>
</div>


<!-- <script src="js/jquery-1.11.1.min.js"></script> -->
<!-- <script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.min.js"></script> -->

</body>
</html>