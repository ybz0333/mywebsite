<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>关于我</title>
	<link rel="shortcut icon" href="<c:url value='/img/favicon.ico'/>">
	<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">

	<!--[if lt IE 9]>
	<script src="<c:url value='/js/html5shiv.js'/>"></script>
	<script src="<c:url value='/js/respond.min.js'/>"></script>
	<![endif]-->

	<!-- 标签云所用css -->
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/jqcloud.css'/>" />

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

</style>
	<script src="<c:url value='/js/jquery-1.11.3.js'/>"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
	<!-- 标签云所用js -->
	<script type="text/javascript" src="<c:url value='/js/jqcloud-1.0.4.min.js'/>"></script>
	<script type="text/javascript">
    $(function(){
        $("#mynav").load("<c:url value='mynav.action'/>", function() {
            $("#aboutMe").addClass("active");    
        });
        //$("#blog_left").load("blog_left.html");
        //$("#blog_right").load("blog_content.html");
        //$("#blog_right").load("blog_order.html");

	    // 标签云
	    /*
 		var word_array = [
		  {text: "Lorem", weight: 15},
		  {text: "Ipsum", weight: 9, link: "http://jquery.com/"},
		  {text: "Dolor", weight: 6, html: {title: "I can haz any html attribute"}},
		  {text: "Sit", weight: 7},
		  {text: "Amet", weight: 5}
		  // ...as many words as you want
		]; 
	    */
		var word_array = [
		  {text: "Java", weight: 12},
		  {text: "C++", weight: 10},
		  {text: "前端", weight: 6},
		  {text: "大数据", weight: 6},
		  {text: "机器学习", weight: 8},
		  {text: "深度学习", weight: 6},
		  {text: "图像处理", weight: 8},
		  {text: "流媒体", weight: 6},
		  {text: "互联网", weight: 8},
		  {text: "通信", weight: 8}
		  // ...as many words as you want
		];

		// When DOM is ready, select the container element and call the jQCloud method, passing the array of words as the first argument.
		$("#tagCloud").jQCloud(word_array);
    });
    
    function surveySubmit() {
    	var senderName = $("#senderName").val();
    	//alert(senderName);
    	if($.trim(senderName).length == 0) {
    		$("html,body").animate({scrollTop:0},0);
    		alert("请输入您的身份信息(^_^)");
    		$("html,body").animate({scrollTop:$("#senderName").offset().top},1000);
    		return;
    	}
    	//删除下方的提交按钮
    	var newSurveyForm = jQuery.extend(true, {}, $("#surveyForm"));
    	newSurveyForm.find("#submitButton").remove();
    	//alert(newSurveyForm.html());
    	
		$.ajax({
			url : "<c:url value='/survey/surveySubmit.action'/>",
			data : { senderName : senderName, surveyData : $("#surveyForm").html()},
			type : "POST",
			success : function(data) {
				if (data == "success") {
					alert("提交成功，感谢您的填写(^_^)");
					location.href = "<c:url value='/aboutMe.action'/>";
				} else {
					alert("提交失败");
				}
			}
		});
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
			<!--
			<div class="col-sm-3 col-md-2 col-xs-3 sidebar" id ="blog_left"></div>
			-->

			<!--右侧管理控制台-->
			<!--
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 col-xs-9 col-xs-offset-3 main" style="font-family:'Microsoft Yahei'" id="blog_right">
			-->
			<div class="col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-1 main" style="font-family:'Microsoft Yahei'" id="blog_right">
				<div style="margin: 15px 15px">
					<h1 class="page-header">个人页</h1>
					<!--panel面板，里面放置一些控件，下同-->
					<div class="row">
						<div class="col-md-6" style="font-size: 18px">
							<p>本人90后，南京某邮电类高校小硕</p>
							<p>热爱技术，热爱生活，热爱分享</p>
							<p>标签云显示了我的部分兴趣领域</p>
							<p>可以在首页给我留言&nbsp&nbsp^_^</p>
							<p>
								<strong>Github</strong>:
								<a href="https://github.com/ybz0333/">https://github.com/ybz0333/</a>
							</p>
						</div>
						<div class="col-md-6">
							<div id="tagCloud" style="width: 300px; height: 200px;margin-left: -40px;"></div>
						</div>
					</div>
					<hr/>
					<div class="row">
						<div class="col-md-10" style="font-size: 18px">
							<h3>帮助博主填写调查问卷吧</h3>
							<div class="mySeperator" style="margin: 20px auto;"></div>
							<form role="form" id="surveyForm">
								<div>
									<p>1.您的姓名或昵称（必填）</p>
									<input id="senderName" type="text" class="form-control" style="width: 150px" id="name" 
         							placeholder="您的姓名或昵称">
         						</div>
								<div class="mySeperator" style="margin: 25px auto;"></div>
								<div class="form-group">
									<p>2. 您的性别</p>
									<div class="row">
										<div class="col-md-2">
											<label class="radio-inline">
												<input type="radio" name="question1" value="option1">男</label>
										</div>
										<div class="col-md-2">
											<label class="radio-inline">
												<input type="radio" name="question1" value="option2">女</label>
										</div>
									</div>
								</div>
								<div class="mySeperator" style="margin: 25px auto;"></div>
								<div class="form-group">
									<p>3. 您的年龄</p>
									<div class="row">
										<div class="col-md-2">
											<label class="radio-inline">
												<input type="radio" name="question2" value="option1">20岁以下</label>
										</div>
										<div class="col-md-2">
											<label class="radio-inline">
												<input type="radio" name="question2" value="option2">20-30</label>
										</div>
										<div class="col-md-2">
											<label class="radio-inline">
												<input type="radio" name="question2" value="option3">30-40</label>
										</div>
										<div class="col-md-2">
											<label class="radio-inline">
												<input type="radio" name="question2" value="option4">40-50</label>
										</div>
										<div class="col-md-2">
											<label class="radio-inline">
												<input type="radio" name="question2" value="option5">50以上</label>
										</div>
									</div>
								</div>
								<div class="mySeperator" style="margin: 25px auto;"></div>
         						<div>
									<p>4. 可以谈谈您对互联网和通信行业的看法吗？</p>
									<textarea class="form-control" rows="3"></textarea>
								</div>
								<div class="mySeperator" style="margin: 25px auto;"></div>
         						<div>
									<p>5. 您有什么意见和建议吗？</p>
									<textarea class="form-control" rows="3"></textarea>
								</div>
								<div class="mySeperator" style="margin: 25px auto;"></div>
								<div>
									<p>6. 可以留下您的联系方式吗？</p>
									<textarea class="form-control" rows="2"></textarea>
								</div>
								<div id="submitButton">
									<div class="mySeperator" style="margin: 25px auto;"></div>
									<!-- <button type="submit" class="btn btn-info" onclick="surveySubmit()">提交</button> -->
									<button type="button" class="btn btn-info" onclick="surveySubmit()">提交</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

		<!-- <script src="js/jquery-1.11.1.min.js"></script>
	-->
	<!-- <script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.min.js"></script>
-->
</body>
</html>