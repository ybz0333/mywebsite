<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ybz's blog</title>
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


        .main {
            /* padding: 20px; */
            padding: 35px 60px;
        }

        .main .page-header {
            margin-top: 0;
        }
</style>
<script src="<c:url value='/js/jquery-1.11.3.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/ueditor/ueditor.parse.js'/>"></script>
<!-- UEditor代码高亮 -->
<link href="<c:url value='/ueditor/third-party/SyntaxHighlighter/shCoreDefault.css'/>" rel="stylesheet">
<script src="<c:url value='/ueditor/third-party/SyntaxHighlighter/shCore.js'/>"></script>
<script type="text/javascript">
    $(function(){
        $("#mynav").load("<c:url value='/mynav.action'/>", function() {
            $("#navbar_blog").addClass("active");    
        });
        /*
        $("#blog_left").load("blog_left.html");
        //$("#blog_right").load("blog_content.html");
        //$("#blog_right").load("blog_order.html");
        */
        
        //UEditor代码高亮
        SyntaxHighlighter.all();
    });
    
    function praiseArticle() {
    	$.ajax({
    		type : 'post',
    		url : "${pageContext.request.contextPath }/blog/praiseArticle.action",
    		data : "id=${articleVo.id }",
    		success : function(data){
    			if(data.result == "success") {
    				$("#praiseButton").text("已赞    " + data.praiseCount).attr("disabled","disabled");
    			}
    		}
    	});
    }

    $(function(){
    	//判断文章是否已被点赞
    	var flagPraised = "${flagPraised }";
    	if(flagPraised == "true") {
    		$("#praiseButton").text("已赞    "+ ${articleVo.praiseCount }).attr("disabled","disabled");
    	}
    	//显示文章内容
    	/*
    	uParse('#content',{
    		rootPath: '${pageContext.request.contextPath}/ueditor/'
    	});
    	*/
    })
</script>

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
        <%@ include file="blog_left.jsp" %>
        </div>

        <!--右侧管理控制台-->
        <div id="blog_right" class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 col-xs-9 col-xs-offset-3 main">
        <!-- <div style="padding: 0px; border: 20px solid gray"> -->
        	<div class="row">
				<div class="col-md-8">
					<h2 style="font-weight:bold;margin: 0px auto;display: inline">
						${articleVo.title }
					</h2>
				</div>
				<div class="col-md-4">
					<h4 style="font-style: italic"><fmt:formatDate value="${articleVo.createtime}"
					 pattern="yyyy-MM-dd" /></h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div style="margin: 10px auto 15px">
						分类：
						<c:forEach items="${articleVo.articleTypeList }" var="articleType">
							<c:if test="${articleType.id != 1 }">
								<a href="<c:url value='/blog/queryArticles.action?articleType.id=${articleTypeVo.id }'/>">
									${articleType.typeName }
								</a>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div>
						<c:forEach items="${articleVo.tags }" var="tag">
							<span class="label label-info">${fn:trim(tag) }</span>&nbsp;
						</c:forEach>
					</div>
				</div>
			</div>
			<hr/>
			<div class="row">
				<div id="content" style="margin: 15px; font-size: 1.3em;">
					${articleVo.content }
				</div>
			</div>
			<hr/>
			<div class="row">
				<div style="margin: auto 15px">
					<button id="praiseButton" type="button" class="btn btn-lg btn-primary" onclick="praiseArticle()">点赞 ${praiseCount }</button>
				</div>
			</div>
        <!-- </div> -->
        </div>
    </div>
</div>


<!-- <script src="../../js/jquery-1.11.1.min.js"></script> -->
<!-- <script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.min.js"></script> -->

</body>
</html>



