<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发送邮件</title>
<script type="text/javascript">

</script>
</head>
<body>
	<form action="${pageContext.request.contextPath }/email.action"
		method="post">
		<label for="name"> Name</label>
		<input type="text" id="name" name="name"/><br/>
		<label for="senderEmail"> Email Address</label>
		<input type="text" id="senderEmail" name="senderEmail"/><br/>
		<label for="subject"> Subject</label>
		<input type="text" id="subject" name="subject"/><br/>
		<textarea name="message" rows="9" cols="25"></textarea><br/>
		<input type="submit" value="发送" />
	</form>
</body>
</html>