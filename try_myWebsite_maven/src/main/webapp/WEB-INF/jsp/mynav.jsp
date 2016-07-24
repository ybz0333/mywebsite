<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-default navbar-inverse navbar-fixed-top" role="navigation">
<div class="container-fluid">
<div class="navbar-header" style="margin-left:20px">
<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
<span class="sr-only">Toggle navigation</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<a class="navbar-brand" href="#">ybz's blog</a>
</div>

<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
<ul class="nav navbar-nav" style="margin-left: 8%">
<li><a href="<c:url value='/home.action'/>">首页</a></li>
<!-- <li class="active"><a href="#">博客</a></li> -->
<li id="navbar_blog"><a href="<c:url value='/blog/queryArticles.action'/>">博客</a></li>
<li id="navbar_laboratory"><a href="<c:url value='/laboratory/laboratory.action'/>">实验室</a></li>
<li id="chatroom"><a href="<c:url value='/chatroom/main.action'/>">聊天室</a></li>
<li id="album"><a href="<c:url value='/album.action'/>">相册</a></li>
<li id="github"><a href="https://github.com/ybz0333">Github</a></li>
<li id="aboutMe"><a href="<c:url value='/aboutMe.action'/>">关于我</a></li>
<c:if test="${sessionScope.user.permission==1 }">
	<li id="manager"><a href="<c:url value='/manage/manage_main.action'/>">管理平台</a></li>
</c:if>
</ul>
<c:choose>
	<c:when test="${empty sessionScope.user }">
		<div class="navbar-right" style="padding: 8px 30px">
			<a href="<c:url value='/user/userLogin.action'/>"><button type="button" class="btn btn-warning">登录</button></a>
			<a href="<c:url value='/user/userRegist.action'/>"><button type="button" class="btn btn-warning">注册</button></a>
		</div>
	</c:when>
	<c:otherwise>
		<div class="dropdown navbar-right" style="font-size: 16px; color: #FEC503; padding: 14px 30px">
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
<!--
<form class="navbar-form navbar-right" role="search">
<div class="form-group">
<input type="text" class="form-control" placeholder="用户名...">
<input type="text" class="form-control" placeholder="密码...">
</div>
</div>
<button type="submit" class="btn btn-default">登录</button>
</form>
-->
</div>
</div>
</nav>