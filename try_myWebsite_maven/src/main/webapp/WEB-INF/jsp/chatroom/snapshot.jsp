<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>聊天室</title>
    <link rel="shortcut icon" href="<c:url value='/img/favicon.ico'/>">
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

/* 下面是左侧导航栏的代码 */
.sidebar {
            position: fixed;
            top: 51px;
            bottom: 0;
            left: 0;
            z-index: 1000;
            display: block;
            padding: 20px;
            overflow-x: hidden;
            overflow-y: auto;
            border-right: 1px solid #eee;
            /*background-color: #ddd;*/
            background-image: url(<c:url value='/img/chatroom/left_cut_sm.jpg'/>);
            background-repeat: none;
            background-attachment: scroll;
            /*background-position: center center;*/
            background-position: center left;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            background-size: cover;
            -o-background-size: cover;
        }

        
/*         .chat-sidebar > li {
    text-indent: 30px;
    padding-right: 20px;
    padding-left: 20px;
    color: #fff;
} */

        .main {
            padding: 20px;
        }

        .main .page-header {
            margin-top: 0;
         }
         
         
          #content p {
        	margin: 0 0 7px;
        }
</style>
    <script src="<c:url value='/js/jquery-1.11.3.js'/>"></script>
    <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
	<!-- ueditor相关 -->
	<!-- 配置文件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/ueditor/ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/ueditor/ueditor.all.js"></script>
    <script type="text/javascript">
    var editor;
    $(function(){
        $("#mynav").load("<c:url value='/mynav.action'/>", function() {
            $("#chatroom").addClass("active");    
        });
        
    	// 实例化编辑器
		//ueditor编辑器设置
		//window.UEDITOR_HOME_URL = "/testGrammar/ueditor/";
		//editor = UE.getEditor('container');
        editor = UE.getEditor('container',{
        	toolbars: [
        	           ['source', 'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc','spechars','emotion','insertcode']
        	       ],
        	maximumWords: 200,
        	autoHeightEnabled: false
        });
        //限制编辑器字数在200字范围内
        editor.addListener("keyup", function(type, event) {
        	var count = editor.getContentLength(true);
        	if(count>200){
        	var contentText = editor.getContentTxt();
        	editor.setContent(contentText.substring(0, 200));
        	}
        });
        //添加Ctrl+Enter键发送的监听器
        editor.addListener("keydown", function(type, event) {
        	if(event.keyCode==13 && event.ctrlKey){
        		send();
        	}
        });
    });
	
	function set(selectedUserId, selectedNickname){	//自动添加聊天对象
		/*
		if(selectedUserId != ${sessionScope.user.id}){
				form1.to.value = selectedNickname;
		}else{
			alert("请重新选择聊天对象！");
		}
	*/
	}
	
	function send() {
		alert("您尚未登录");
	}
	
	function exit(){
		alert("欢迎您下次光临！");
		window.location.href="${pageContext.request.contextPath}/home.action";
	}
    </script>
</head>

<body>
    <!--下面是顶部导航栏的代码-->
    <div id="mynav"></div>

    <!--自适应布局-->
    <div class="container-fluid">
        <div class="row">
            <!--左侧导航栏-->
            <div class="col-sm-3 col-md-2 sidebar">
                <table class="chat-sidebar" style="text-align: center;font-weight: bold;line-height: 2em;color: #000;margin: 0px auto;">
                    <tr><td>
                        <img alt="YBZ" src="<c:url value='/img/chatroom/chatroom1_sm.png'/>" width="150" height="150" style="border: 3px solid #fff;margin: 10px auto 30px;"/>
                    </td></tr>
                    <!-- <tr id="online"></tr> -->
                    <%@ include file="online.jsp" %>
                    <!-- 
                    <tr><td>所有人</td></tr>
                    <tr><td>test1</td></tr>
                    <tr><td>test2</td></tr>
                    <tr><td>test3</td></tr>
                     -->
                </table>
            </div>
        </div>
        <!--右侧管理控制台-->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 col-xs-9 col-xs-offset-3 main"  id="blog_right">
            <div>
                <!--panel面板，里面放置一些控件，下同-->
                <div class="row">
                    <div class="col-md-9" style="position: fixed;top: 65px;bottom: 200px;overflow-x: hidden; word-break: break-all; overflow-y: scroll">
                        <h2 class="page-header">聊天室（快照）</h2>
                        <!-- 聊天内容 -->
                        <div id="content">
                        	<span style='font-size:14px; line-height:30px;'>欢迎光临聊天室。您尚未登录，无法获取各项权限。</span><br><span style='line-height:22px;'>
                        		${applicationScope.chatMessage }
                        	</span>
                        </div>
                        
                    </div>
                </div>
                <!-- <div class="row" style="position: fixed; bottom: 0px;"> -->
                <div class="row">
                	<div class="col-md-9" style="position: fixed; bottom: 5px;">
                		<form role="form" action="" id="form1" name="form1" method="post">
                			<input type="hidden" name="method" value="sendMessage"/>                
                			<input name="from" type="hidden" value="${sessionScope.user.nickname}">
                			<div class="row">
                				<div style="margin: 5px">
	                			[${sessionScope.user.nickname} ]对
	                			<input class="form-control" style="width: 150px; background-color: #FFF; display: inline;" name="to" type="text" value="" readonly="readonly">说：
	                			</div>
	                		</div>
		                	<div class="row">
			                	<div style="margin: 5px">
			                		<!-- <textarea class="form-control" rows="2" name="content" onKeyDown="if(event.keyCode==13 && event.ctrlKey){send();}"></textarea> -->
			                		<!-- 加载编辑器的容器 -->
			                		<!-- <script id="container" name="content" type="text/plain" style="width:100%; height:3.5em" onKeyDown="if(event.keyCode==13 && event.ctrlKey){send();}"></script> -->
			                		<script id="container" name="content" type="text/plain" style="width:100%; height:3.5em"></script>
			                	</div>
		                	</div>
		                	<div class="row">
		                		<div style="margin: 5px">
			                		<div class="col-md-1">
			                			<button type="button" class="btn btn-primary" style="font-weight: bold;" value="发送" onClick="send()">提交</button>
			                		</div>
			                		<div class="col-md-1 col-md-offset-8">
				                		<button name="button_exit" type="button" class="btn btn-info" style="font-weight: bold;" value="退出聊天室" onClick="exit()">退出聊天室</button>
				                	</div>
			                	</div>
		                	</div>
		                </form>
            	    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
