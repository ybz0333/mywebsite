<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统登陆</title>
<script type="text/javascript">
	function change() {
		var ele = document.getElementById("vCode");
		ele.src = "<c:url value='/manage/getVerifyCode.action'/>?time=" + new Date().getTime();
	}
</script>
</head>
<body>
<form action="${pageContext.request.contextPath }/manage/login.action" method="post">
用户账号：<input type="text" name="username" />${errors.userError }<br/>
用户密码 ：<input type="password" name="password" /><br/>
  验证码：<input type="text" name="verifyCode" size="3"/>
        <img id="vCode" src="<c:url value='/manage/getVerifyCode.action'/>" border="2"/>
        <a href="#" onclick="change()">换一张</a>${errors.verifyCodeError }<br/>
<input type="submit" value="登陆"/>
</form>
</body>
</html>