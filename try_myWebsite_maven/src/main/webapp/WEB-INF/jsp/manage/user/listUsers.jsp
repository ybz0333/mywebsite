<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ybz's blog</title>
    <link rel="shortcut icon" href="<c:url value='/img/favicon.ico'/>">
    <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="<c:url value='/js/html5shiv.js'/>"></script>
    <script src="<c:url value='/js/respond.min.js'/>"></script>
    <![endif]-->
    <script src="<c:url value='/js/jquery-1.11.3.js'/>"></script>
    <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
    <script type="text/javascript">
    $(function(){
        $("#mynav").load("<c:url value='/mynav.action'/>", function() {
            $("#manager").addClass("active");    
        });
        /*
        $("#blog_left").load("blog_left_admin.html");
        //$("#blog_right").load("blog_content.html");
        //$("#blog_right").load("blog_order.html");
        */
    });
    
  //删除确认
    function deleteConfirm(userId) {
    	var result = confirm("您确定要删除该用户吗？");
    	if(result == true) {
    		$.ajax({
    			type : 'get',
    			async : false,
    			url : "<c:url value='/manage/user/deleteUser.action?userId='/>" + userId,
    			//data : "",
    			success : function(data){
    				if(data == "success") {
    					alert("删除成功");
    				} else {
    					alert("删除失败");
    				}
    			}
    		});
    	}
    	location.href = "<c:url value='/manage/user/listUsers.action'/>";
    }
</script>
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
       
       /*覆盖bootstrap的表格样式，使表头和内容的文字都居中*/
       table th, table td {
       	text-align: center;
       }
</style>

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
        <%@ include file="../manage_left.jsp" %>
        </div>

        <!--右侧管理控制台-->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 col-xs-9 col-xs-offset-3 main" id="blog_right">
        	<h2 class="page-header">查看用户</h2>
			<table class="table table-striped terable-hover">
			    <tr>
			      <th>id</th>
			      <th>用户名</th>
			      <th>昵称</th>
			      <th>权限</th>
			      <th>注册时间</th>
			      <th>操作</th>
			    </tr>
			  </thead>
			  <tbody>
				<c:forEach items="${userList }" var="user">
				  <tr>
				    <td>${user.id }</td>
				    <td>${user.username }</td>
				    <td>${user.nickname }</td>
				    <td>${user.permission }</td>
				    <td>
				    	<fmt:formatDate value="${user.registtime }"
						pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
				    <td><a href="#" onclick="var userId=${user.id }; deleteConfirm(userId)">删除</a></td>
				  </tr>
				</c:forEach>
			  </tbody>
			</table>
        </div>
    </div>
</div>


<!-- <script src="js/jquery-1.11.1.min.js"></script> -->
<!-- <script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.min.js"></script> -->

</body>
</html>