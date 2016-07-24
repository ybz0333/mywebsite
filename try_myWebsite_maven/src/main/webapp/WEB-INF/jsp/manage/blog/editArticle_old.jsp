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
    });
    
    // 实例化编辑器
    $(function() {
		//ueditor编辑器设置
		//window.UEDITOR_HOME_URL = "/testGrammar/ueditor/";
		var editor = UE.getEditor('container');
		
		//给checkbox中已选的文章类型打上勾
		$("#articleTypeDiv > input").each(function(){
		<c:forEach items="${articleVo.articleTypeList }" var="articleType">
		//console.log($(this).val());
		console.log(${articleType.id} );
			if($(this).val() == "${articleType.id }") {
				$(this).attr("checked","checked");
			}
		</c:forEach>
		});
		//为时间输入框设置初始值
		var createtimeStr = "<fmt:formatDate value="${articleVo.createtime }" pattern="yyyy-MM-dd HH:mm:ss" />";
		$("#createtimeInput").val(createtimeStr);
		
		//根据${articleVo}是否为空来判断是添加新文章还是修改文章
		var option = "${articleVo}";
		if(option == "") {
			$("#articleEditor").attr("action","${pageContext.request.contextPath }/manage/blog/addNewArticle.action");
		} else {
			$("#articleEditor").attr("action","${pageContext.request.contextPath }/manage/blog/updateArticle.action");
		}
		
	});
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
        	<h2 class="page-header">编辑文章</h2>
			<form id="articleEditor" role="form" action="#" method="post">
				<!-- 文章id -->
				<input type="hidden" name="id" value="${articleVo.id }" /><br />
				 标题：<input name="title" value="${articleVo.title }" /><br />
				作者：<input name="authorName" value="${articleVo.authorName }" /><br />
				<div id="articleTypeDiv">
					类型：<br/>
					<c:forEach items="${articleTypeList }" var="articleType" varStatus="status">
						<input type="checkbox" name="articleTypeList[${status.index }].id" value="${articleType.id }"/>${articleType.typeName }
					</c:forEach><br />
				</div>
				新增类型（请用逗号分隔）：<input type="text" name="newArticleTypeText" /><br />
				标签（请用逗号分隔）：<input name="tags" value="${articleVo.tags }"/><br/>
				状态：
				<select name="state">
					<option value="1" selected="selected">草稿</option>
					<option value="2">已发布</option>
				</select>
				<br/>
				<label>摘要：</label><br/>
				<textarea name="introduction" rows="6" cols="40">${articleVo.introduction }</textarea><br/>
				时间（格式：yyyy-MM-dd HH:mm:ss，不填则设置为当前时间）：<br/>
				<input id="createtimeInput" type="text" name="createtime"/><br/>	
				<label>备注：</label><br/>
				<textarea name="note" rows="3" cols="20">${articleVo.note }</textarea><br/>
				<!-- ueditor编辑器 -->
				<!-- 加载编辑器的容器 -->
				<script id="container" name="content" type="text/plain">${articleVo.content }</script><br/>
				<input type="submit" value="保存">
			</form>
        </div>
	</div>
</div>


<!-- <script src="js/jquery-1.11.1.min.js"></script> -->
<!-- <script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.min.js"></script> -->

</body>
</html>