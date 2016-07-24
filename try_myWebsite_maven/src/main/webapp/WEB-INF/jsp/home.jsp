<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">


    <title>ybz's blog</title>
    <link rel="shortcut icon" href="<c:url value='/img/favicon.ico'/>">


    <!-- Bootstrap Core CSS -->
    <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value='/css/agency.css'/>" rel="stylesheet">
	<!-- 文字闪烁特效 -->
	<link href="<c:url value='/css/word-display-custom.css'/>" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<c:url value='/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css">
    
    <!-- 
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
    -->
    <link href="<c:url value='/css/fonts_googleapis_com/family_Montserrat_400_700.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/fonts_googleapis_com/family_Kaushan_Script.css'/>" rel='stylesheet' type='text/css'>
    <link href="<c:url value='/css/fonts_googleapis_com/family_Droid_Serif_400_700_400italic_700italic.css'/>" rel='stylesheet' type='text/css'>
    <link href="<c:url value='/css/fonts_googleapis_com/family_Roboto_Slab_400_100_300_700.css'/>" rel='stylesheet' type='text/css'>
    
	<%-- 
	这里的兼容js原来使用的是下面两个：
    <script src="<c:url value='/js/html5shiv.js'/>"></script>
    <script src="<c:url value='/js/respond.min.js'/>"></script>
	但在ie上兼容的不好（背景图不显示）
	于是换成了：
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	 --%>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
    body {
        font-family: "Microsoft Yahei";
    }

    .navbar-default .nav li a {
        font-size: 15px;
        font-family: "Microsoft Yahei";
    }
    </style>
    
    <script type="text/javascript">
	    function sendMessage() {
			$.ajax({
				url : "<c:url value='/email.action'/>",
				data : $("#contactForm").serialize(),
				type : "POST",
				success : function(data) {
					if (data == "success") {
						alert("发送成功");
						location.href = "<c:url value='/home.action'/>";
					} else {
						alert("发送失败，请检查您的邮箱地址");
					}
				}
			});
	    }
    </script>

</head>

<body id="page-top" class="index">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">YBZ's blog</a>
            </div>


            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <!-- <ul class="nav navbar-nav navbar-right"> -->
                <ul class="nav navbar-nav" style="margin-left: 50px">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <!--
                        <a class="page-scroll" href="#services">Services</a>
                        -->
                        <a class="page-scroll" href="<c:url value='/home.action'/>">首页</a>
                    </li>
                    <li>
                        <!--
                        <a class="page-scroll" href="#portfolio">Portfolio</a>
                        -->
                        <a class="page-scroll" href="<c:url value='/blog/queryArticles.action'/>">博客</a>
                    </li>
                    <li>
                        <!--
                        <a class="page-scroll" href="#about">About</a>
                        -->
                        <a class="page-scroll" href="<c:url value='/laboratory/laboratory.action'/>">实验室</a>
                    </li>
                    <li>
                        <!--
                        <a class="page-scroll" href="#team">Team</a>
                        -->
                        <a class="page-scroll" href="<c:url value='/chatroom/main.action'/>">聊天室</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="<c:url value='/album.action'/>">相册</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="https://github.com/ybz0333">Github</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="<c:url value='/aboutMe.action'/>">关于我</a>
                    </li>
                    <c:if test="${sessionScope.user.permission==1 }">
	                    <li>
	                        <a class="page-scroll" href="<c:url value='/manage/manage_main.action'/>">管理平台</a>
	                    </li>
                    </c:if>
                    <!--
                    <li>
                        <a class="page-scroll" href="#contact">Contact</a>
                    </li>
                    -->
                </ul>
                <c:choose>
					<c:when test="${empty sessionScope.user }">
		                <div class="navbar-right" style="padding: 10px 0">
			              	<a href="<c:url value='/user/userLogin.action'/>"><button type="button" class="btn btn-warning">登录</button></a>
			                <a href="<c:url value='/user/userRegist.action'/>"><button type="button" class="btn btn-warning">注册</button></a>                    
		                </div>
		            </c:when>
		            <c:otherwise>
		                <div class="dropdown navbar-right" style="font-size: 16px; color: #FEC503; padding: 15px 0">
		                    <div class="dropdown-toggle" data-toggle="dropdown">
		                    	欢迎您，<c:if test="${sessionScope.user.permission==1 }">管理员 </c:if>${sessionScope.user.nickname }
		                        <span class="caret"></span>
		                    </div>
		                    <ul class="dropdown-menu" role="menu">
		                        <li>
		                            <a href="<c:url value='/user/changeNames.action'/>">信息修改</a>
		                        </li>
		                        <li>
		                            <a href="<c:url value='/user/changePassword.action'/>">密码修改</a>
		                        </li>
		                        <li>
		                            <a href="<c:url value='/user/logout.action'/>">退出</a>
		                        </li>
		                    </ul>
		                </div>
                	</c:otherwise>
                </c:choose>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Header -->
    <header>
        <div class="container">
            <div class="intro-text">
				<img class="img-circle" alt="YBZ" src="<c:url value='/img/home/kola_test_sm.jpg'/>" width="150" height="150" style="border: 3px solid #fff;margin-bottom: 10px; margin-right: 10px;"/>
                <div class="intro-lead-in">欢迎访问YBZ的博客</div>
                <div class="intro-heading word-display-custom">WELCOME!</div>
				<!-- <div class="word-display-custom">WELCOME!</div> -->
                <!-- <a href="#services" class="page-scroll btn btn-xl">Tell Me More</a> -->
				<a class="btn btn-circle page-scroll" href="#second_part">
                    <i class="fa fa-angle-double-down animated"></i>
                </a>
            </div>
        </div>
    </header>


    <!-- header Aside -->
    <!--
    <aside>
        <div class="container">
            <div class="row">
            </div>
        </div>
    </aside>
    -->

    <!-- second_part -->
    <section id="second_part">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h1 class="section-heading-custom">朋友</h1>
                    <h3 class="section-subheading text-muted">Friend and friendship.</h3>
                        <a class="btn btn-circle page-scroll" href="#contact">
                            <i class="fa fa-angle-double-down animated"></i>
                        </a>
                </div>
            </div>
        <!--
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Services</h2>
                    <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-shopping-cart fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="service-heading">E-Commerce</h4>
                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-laptop fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="service-heading">Responsive Design</h4>
                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="service-heading">Web Security</h4>
                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
                </div>
            </div>
            -->
        </div>
    </section>

    <!-- Clients Aside -->
    <aside class="clients">
        <div class="container">
            <div class="row">
            <!--
                <div class="col-md-3 col-sm-6">
                    <a href="#">
                        <img src="img/logos/envato.jpg" class="img-responsive img-centered" alt="">
                    </a>
                </div>
                <div class="col-md-3 col-sm-6">
                    <a href="#">
                        <img src="img/logos/designmodo.jpg" class="img-responsive img-centered" alt="">
                    </a>
                </div>
                <div class="col-md-3 col-sm-6">
                    <a href="#">
                        <img src="img/logos/themeforest.jpg" class="img-responsive img-centered" alt="">
                    </a>
                </div>
                <div class="col-md-3 col-sm-6">
                    <a href="#">
                        <img src="img/logos/creative-market.jpg" class="img-responsive img-centered" alt="">
                    </a>
                </div>
            -->
            </div>
        </div>
    </aside>
    
    <!-- Contact Section -->
    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Contact Me</h2>
                    <h3 class="section-subheading text-muted" style="font-style: normal; font-weight: bold; color: #FFF">请在这里给我留言(^_^)</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <form name="sentMessage" id="contactForm" novalidate>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="您的称呼 *" name="name" id="name" required data-validation-required-message="请输入您的称呼.">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control" placeholder="您的邮箱 *" name="senderEmail" id="email" required data-validation-required-message="请输入您的邮箱.">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="主题 *" name="subject" id="subject" required data-validation-required-message="请输入主题.">
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <textarea class="form-control" placeholder="您想说的 *" name="message" id="message" required data-validation-required-message="请输入消息."></textarea>
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-lg-12 text-center">
                                <div id="success"></div>
                                <!-- <button type="submit" class="btn btn-xl">Send Message</button> -->
                                <button type="button" class="btn btn-xl" onclick="sendMessage()">Send Message</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <span class="copyright">Copyright &copy; ybz's blog 2016</span>
                </div>
                <div class="col-md-4">
                    <ul class="list-inline social-buttons">
                        <li><a href="#"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a>
                        </li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <ul class="list-inline quicklinks">
                    	<!-- 
                        <li><a href="#">Privacy Policy</a>
                        </li>
                        <li><a href="#">Terms of Use</a>
                        </li>
                         -->
                        <li><a href="javascript:void(0);">thanks for your visit.</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="<c:url value='/js/jquery.js'/>"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value='/js/bootstrap.min.js'/>"></script>

    <!-- Plugin JavaScript -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="<c:url value='/js/classie.js'/>"></script>
    <script src="<c:url value='/js/cbpAnimatedHeader.js'/>"></script>

    <!-- Contact Form JavaScript -->
    <script src="<c:url value='/js/jqBootstrapValidation.js'/>"></script>
    <script src="<c:url value='/js/contact_me.js'/>"></script>


    <!-- Custom Theme JavaScript -->
    <script src="<c:url value='/js/agency.js'/>"></script>

</body>

</html>