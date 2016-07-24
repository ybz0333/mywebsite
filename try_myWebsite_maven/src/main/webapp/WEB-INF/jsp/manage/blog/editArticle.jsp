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
    });
    
    
    $(function() {
    	// 实例化编辑器
		//ueditor编辑器设置
		//window.UEDITOR_HOME_URL = "/testGrammar/ueditor/";
		var editor = UE.getEditor('container');
		
		//给checkbox中已选的文章类型打上勾
		$("#articleTypeDiv input").each(function(){
		<c:forEach items="${articleVo.articleTypeList }" var="articleType">
		//console.log($(this).val());
		//console.log(${articleType.id} );
			if($(this).val() == "${articleType.id }") {
				$(this).attr("checked","checked");
			}
		</c:forEach>
		});
		
		//为时间输入框设置初始值
		var createtimeStr = "<fmt:formatDate value="${articleVo.createtime }" pattern="yyyy-MM-dd HH:mm:ss" />";
		$("#createtimeInput").val(createtimeStr);
		
		//设置下拉列表ImgNameSelect的默认选中项
		var imgName = "${articleVo.imgName }";
		if(imgName != "") {
			selectorString = "#ImgNameSelect option[value='" + imgName + "']";
			$(selectorString).attr("selected","selected");
		}
		
		/*
		//根据${articleVo}是否为空来判断是添加新文章还是修改文章
		var option = "${articleVo}";
		if(option == "") {
			$("#articleEditor").attr("action","${pageContext.request.contextPath }/manage/blog/addNewArticle.action");
		} else {
			$("#articleEditor").attr("action","${pageContext.request.contextPath }/manage/blog/updateArticle.action");
		}
		*/
	});
    
	function clickSave() {
		//根据${articleVo.id}是否为空来判断是添加新文章还是修改文章
		var option = "${articleVo.id}";
		var urlStr;
		if(option == "") {
			urlStr = "<c:url value='/manage/blog/addNewArticle.action'/>";
		} else {
			urlStr = "<c:url value='/manage/blog/updateArticle.action'/>";
		}
		$.ajax({
			url : urlStr,
			data : $("#articleEditor").serialize(),
			type : "POST",
			success : function(data) {
				if (data == "success") {
					alert("保存成功");
					location.href = "${pageContext.request.contextPath}/manage/blog/manageArticle.action";
				} else {
					alert("保存失败");
				}
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
        	<div class="row">
        		<div class="col-md-11">
		        	<h2 class="page-header">编辑文章</h2>
					<form id="articleEditor" class="form-horizontal" role="form" action="#" method="post">
						<!-- 文章id -->
						<input type="hidden" name="id" value="${articleVo.id }" /><br />
						<!-- 标题 -->
						<div class="form-group">
							<label for="article-title" class="col-sm-1 control-label">
								标题：
							</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="article-title" name="title" value="${articleVo.title }" />
							</div>
						</div>
						<!-- 作者 -->
						<div class="form-group">
							<label for="article-author" class="col-sm-1 control-label">
								作者：
							</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="article-author" name="authorName" value="${articleVo.authorName }" />
							</div>
						</div>
						<!-- 类型 -->
						<div class="form-group" id="articleTypeDiv">
							<label for="article-type" class="col-sm-1 control-label">
								类型：
							</label>
							<div id="article-type">
								<c:forEach items="${articleTypeList }" var="articleType" varStatus="status">
									<label>
										<input type="checkbox" name="articleTypeList[${status.index }].id" value="${articleType.id }"/>${articleType.typeName }
									</label>
								</c:forEach>
							</div>
						</div>
						<!-- 新增类型 -->
						<div class="form-group">
							<label for="article-newType" class="col-sm-1 control-label">
								新增类型：
							</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="article-newType" name="newArticleTypeText" placeholder="请用逗号分隔"/>
							</div>
						</div>
						<!-- 标签 -->
						<div class="form-group">
							<label for="article-tags" class="col-sm-1 control-label">
								标签：
							</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="article-tags" name="tags" value="${articleVo.tags }" placeholder="请用逗号分隔" />
							</div>
						</div>
						<!-- 状态 -->
						<div class="form-group">
							<label for="article-state" class="col-sm-1 control-label">
								状态：
							</label>
							<div class="col-sm-2">
								<select id="article-state" class="form-control" name="state">
									<option value="1" selected="selected">草稿</option>
									<option value="2">已发布</option>
								</select>
							</div>
						</div>
						<!-- 摘要 -->
						<div class="form-group">
							<label for="article-abstract" class="col-sm-1 control-label">
								摘要：
							</label>
							<div class="col-sm-8">
								<textarea id="article-abstract" class="form-control" name="introduction" rows="5">${articleVo.introduction }</textarea><br/>
							</div>
						</div>
						<!-- 时间 -->
						<div class="form-group">
							<label for="createtimeInput" class="col-sm-1 control-label">
								时间：
							</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="createtimeInput" name="createtime"
								 value="${articleVo.createtime }" placeholder="（格式：yyyy-MM-dd HH:mm:ss，不填则设置为当前时间）：" />
							</div>
						</div>
						<!-- 文章配图名 -->
						<div class="form-group" id="articleTypeDiv">
							<label for="ImgNameSelect" class="col-sm-1 control-label">
								文章配图：
							</label>
							<div class="col-sm-2">
								<select id="ImgNameSelect" class="form-control" name="imgName">
									<c:forEach items="${articleImgNames }" var="imgName">
										<option value="${imgName }">${imgName }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<!-- 备注 -->
						<div class="form-group">
							<label for="article-note" class="col-sm-1 control-label">
								备注：
							</label>
							<div class="col-sm-8">
								<textarea id="article-note" class="form-control" name="note" rows="2">${articleVo.note }</textarea><br/>
							</div>
						</div>
						<div class="col-sm-11">
							<!-- 加载编辑器的容器 -->
							<script id="container" name="content" type="text/plain">${articleVo.content }</script>
						</div>
						<div class="col-sm-2">
							<button type="button" class="btn btn-primary" onclick="clickSave()">保存</button>
						</div>
					</form>
				</div>
			</div>
        </div>
	</div>
</div>


<!-- <script src="js/jquery-1.11.1.min.js"></script> -->
<!-- <script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.min.js"></script> -->

</body>
</html>