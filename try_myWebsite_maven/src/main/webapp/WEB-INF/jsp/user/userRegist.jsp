<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>注册</title>
	<link rel="shortcut icon" href="<c:url value='/img/favicon.ico'/>">
    <!-- Bootstrap -->
    <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="<c:url value='/js/html5shiv.min.js'/>"></script>
      <script src="<c:url value='/js/respond.min.js'/>"></script>
    <![endif]-->
    <script src="<c:url value='/js/jquery-1.11.3.js'/>"></script>
    <script src="<c:url value='/js/bootstrap.min.js'/>"></script>

    <style type="text/css">
        body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-signin {
            max-width: 300px;
            padding: 19px 29px 29px;
            margin: 0 auto 20px;
            background-color: #fff;
            border: 1px solid #e5e5e5;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
            -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
            box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
        }

        .form-signin .form-signin-heading,
        .form-signin .checkbox {
            margin-bottom: 15px;
        }

        .form-signin input[type="text"],
        .form-signin input[type="password"] {
            font-size: 16px;
            height: auto;
            margin-bottom: 15px;
            padding: 7px 9px;
        }

    </style>
    <script type="text/javascript">
		function change() {
			var ele = document.getElementById("vCode");
			ele.src = "<c:url value='/user/getVerifyCode.action'/>?time=" + new Date().getTime();
		}
	</script>
  </head>

<body>
<div class="container">

    <form role="form" class="form-signin" method="post" action="<c:url value='/user/doUserRegist.action'/>">
        <h2 class="form-signin-heading" style="font-weight: bold;">注册</h2>
        <!-- <input type="text" name="username" class="input-block-level" placeholder="账号">
        <input type="password" name="password" class="input-block-level" placeholder="密码">
        <input type="text" name="verify" class="input-medium" placeholder="验证码"> -->
        <div style="color: #ED1C24">${errors.usernameError }</div>
        <input type="text" name="username" class="form-control" placeholder="用户名">
        <input type="text" name="nickname" class="form-control" placeholder="昵称">
        <div style="color: #ED1C24">${errors.passwordError }</div>
        <input type="password" name="password" class="form-control" placeholder="密码">
        <div style="color: #ED1C24">${errors.passwordAgainError }</div>
        <input type="password" name="passwordAgain" class="form-control" placeholder="再次输入密码">
        <div style="color: #ED1C24">${errors.verifyCodeError }</div>
        <input type="text" name="verifyCode" class="form-control" style="width: 7em; display: inline" placeholder="验证码">
        <img id="vCode" src="<c:url value='/user/getVerifyCode.action'/>" border="2"/>
        <a href="#" onclick="change()">换一张</a>
        <p style="margin-top: 5px"><button class="btn btn-large btn-primary" type="submit">提交</button></p>
    </form>

</div>
</body>
</html>