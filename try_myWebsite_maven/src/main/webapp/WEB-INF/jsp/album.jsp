<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>相册</title>
<link rel="shortcut icon" href="<c:url value='img/favicon.ico'/>">
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/css/picture_wall.css'/>" rel="stylesheet">

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
        $("#mynav").load("<c:url value='mynav.action'/>", function() {
            $("#album").addClass("active");    
        });
        //$("#blog_left").load("blog_left.html");
        //$("#blog_right").load("blog_content.html");
        //$("#blog_right").load("blog_order.html");
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
        <!--
        <div class="col-sm-3 col-md-2 col-xs-3 sidebar" id ="blog_left">
        </div>
        -->

        <!--右侧管理控制台-->
        <!--
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 col-xs-9 col-xs-offset-3 main" id="blog_right">
        -->
        <div class="col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-1 main" id="blog_right">
        	<div style="margin: 15px 15px">
	        	<h1 class="page-header">相册</h1>
				<!--panel面板，里面放置一些控件，下同-->
				<div class="row">
				    <div class="col-md-9" style="font-size: 16px">
						<p>该栏目正墙在建造中，先看看照片墙吧</p>
					</div>
					<div class="picture_wall">
						<img class="pic pic1" src="<c:url value='/img/picture_wall/1.jpg'/>">
						<img class="pic pic4" src="<c:url value='/img/picture_wall/2.jpg'/>">
						<img class="pic pic9" src="<c:url value='/img/picture_wall/3.jpg'/>">
						<img class="pic pic10" src="<c:url value='/img/picture_wall/4.jpg'/>">
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