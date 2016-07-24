<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>实验室</title>
<link rel="shortcut icon" href="<c:url value='/img/favicon.ico'/>">
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">

<!--[if lt IE 9]>
<script src="<c:url value='/js/html5shiv.js'/>"></script>
<script src="<c:url value='/js/respond.min.js'/>"></script>
<![endif]-->
<style type="text/css">
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
<style type="text/css">
    
        /* 简介 */
        .summary {
            padding-right: 15px;
            padding-left: 15px;
            margin: 30px auto;
        }

        .summary .col-md-4 {
            margin-bottom: 20px;
            text-align: center;
        }

        .lab-introduction {
            margin-top: 20px;
            margin-bottom: 50px;
            font-size: 20px;
            font-weight: bold;
            line-height: 1.8;
            text-align: center;
        }
</style>
<script src="<c:url value='/js/jquery-1.11.3.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script type="text/javascript">
    $(function(){
        $("#mynav").load("<c:url value='/mynav.action'/>", function() {
            $("#navbar_laboratory").addClass("active");    
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

<!—自适应布局-->
<div class="container-fluid summary">
    <div class="row">
        <p class="lab-introduction">这里是博主用来做实验的地方，各种各样的代码实验&nbsp&nbsp^_^</p>
    </div>
<!-- 主要内容 -->
    <!-- 简介 -->
    <div class="row">
        <div class="col-md-4">
            <!-- <img class="img-circle" src="<c:url value='/img/laboratory/onePageScroll_sm.png'/>" alt="chrome"> -->
            <img src="<c:url value='/img/laboratory/onePageScroll_sm.png'/>" alt="chrome">

            <h2><strong>全屏滚动</strong></h2>

            <p>参考了慕课网课程的全屏滚动样式，<br/>结合使用了一个全屏滚动插件</p>

            <p><a class="btn btn-default" href="<c:url value='/laboratory/onePageScroll.action'/>" role="button">点击观看</a></p>
        </div>
        <div class="col-md-4">
            <!-- <img class="img-circle" src="<c:url value='/img/laboratory/music_visible_cut_sm.jpg'/>" alt="firefox"> -->
            <img src="<c:url value='/img/laboratory/music_visible_cut_sm.jpg'/>" alt="firefox">

            <h2><strong>音乐可视化</strong></h2>

            <p>这是从慕课网“音乐可视化”课程上摘下来的demo。稍微修改一下后端就能部署了。很佩服作者，做出这么炫酷的效果。</p>

            <p><a class="btn btn-default" href="<c:url value='/laboratory/webAudio.action'/>" role="button">点击观看</a></p>
        </div>
        <div class="col-md-4">
            <!-- <img class="img-circle" src="<c:url value='/img/laboratory/lock_sm.png'/>" alt="safari"> -->
            <img src="<c:url value='/img/laboratory/lock_sm.png'/>" alt="safari">

            <h2><strong>其它</strong></h2>

            <p>其它代码实验，<br/>正在实验中</p>

            <p><a class="btn btn-default" href="#" role="button">实验中</a></p>
        </div>
    </div>
</div>


<!-- <script src="js/jquery-1.11.1.min.js"></script> -->
<!-- <script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.min.js"></script> -->

</body>
</html>



