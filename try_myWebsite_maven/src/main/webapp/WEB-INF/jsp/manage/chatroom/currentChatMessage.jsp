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
    <!-- ueditor相关 -->
	<!-- 配置文件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/ueditor/ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/ueditor/ueditor.all.js"></script>
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
        
    	// 实例化编辑器
		//ueditor编辑器设置
		//window.UEDITOR_HOME_URL = "/testGrammar/ueditor/";
		var editor = UE.getEditor('container');
    });
    
  // 清空确认
    function clearConfirm(id) {
    	var result = confirm("您确定要清空当前聊天消息吗？");
    	if(result == true) {
    		$.ajax({
    			type : 'get',
    			async : false,
    			url : "<c:url value='/manage/chatroom/clearChatMessage.action'/>",
    			//data : "",
    			success : function(data){
    				if(data == "success") {
    					alert("清空成功");
    				} else {
    					alert("清空失败");
    				}
    			}
    		});
    	}
    	location.href = "<c:url value='/manage/chatroom/currentChatMessage.action'/>";
    }
  
    // 备份确认
    function backupConfirm(id) {
    	var result = confirm("您确定要备份当前聊天消息吗？");
    	if(result == true) {
    		$.ajax({
    			type : 'post',
    			async : false,
    			url : "<c:url value='/manage/chatroom/backupChatMessage.action'/>",
    			data : { chatMessage : $("#chatMessage").html() },
    			success : function(data){
    				if(data == "success") {
    					alert("备份成功");
    				} else {
    					alert("备份失败");
    				}
    			}
    		});
    	}
    	location.href = "<c:url value='/manage/chatroom/currentChatMessage.action'/>";
    }
  
  	// 查看问卷
  	function checkChatlog(id) {
		$.ajax({
			type : 'get',
			async : false,
			url : "<c:url value='/manage/chatroom/checkChatlog.action?id='/>" + id,
			//data : "",
			success : function(data){
				//alert(data);
				$("#modal-body").html(data);
				$("#checkChatlog").modal("show");
			}
		});
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
        	<h2 class="page-header">当前聊天消息</h2>
	        <div>
	        	<button type="button" class="btn btn-warning" onclick="backupConfirm()">备份</button>
				<a data-toggle="modal" data-target="#checkChatlog"><button type="button" class="btn btn-warning">编辑</button></a>			
				<button type="button" class="btn btn-warning" onclick="clearConfirm()">清空</button>
			</div>
			<hr>
        	<div id="chatMessage" style="overflow: scroll">${applicationScope.chatMessage }</div>
        </div>
        <!-- 编辑聊天消息弹出的模态对话框 -->
		<div class="modal fade" id="checkChatlog" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width:60%">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">编辑聊天消息</h4>
					</div>
					<form role="form" action="<c:url value='/manage/chatroom/saveChatMessage.action'/>">
						<div id="modal-body" class="modal-body">
							<div class="form-group">
								<!-- <textarea name="chatMessage" class="form-control" rows="20">${applicationScope.chatMessage }</textarea> -->
								<!-- 加载编辑器的容器 -->
			                	<script id="container" name="chatMessage" type="text/plain" style="width:100%; height:3.5em">${applicationScope.chatMessage }</script>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-primary">保存</button>
						</div>
					</form>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>

	</div>
</div>


<!-- <script src="js/jquery-1.11.1.min.js"></script> -->
<!-- <script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.min.js"></script> -->

</body>
</html>