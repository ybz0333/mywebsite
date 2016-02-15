<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑文章类型信息</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.js"></script>
<script type="text/javascript">

	function clickSubmit() {
		//根据${articleType}是否为空来判断是添加新文章类型还是修改文章类型
		var option = "${articleType}";
		var urlStr;
		if (option == "") {
			//$("#articleTypeForm").attr("action","${pageContext.request.contextPath }/manage/addNewArticleType.action");
			urlStr = "${pageContext.request.contextPath }/manage/addNewArticleType.action";
		} else {
			//$("#articleTypeForm").attr("action","${pageContext.request.contextPath }/manage/updateArticleType.action");
			urlStr = "${pageContext.request.contextPath }/manage/updateArticleType.action";
		}
		
		$.ajax({
			url : urlStr,
			data : $("#articleTypeForm").serialize(),
			type : "POST",
			success : function(data) {
				if (data == "success") {
					alert("提交成功");
					opener.location.href = "${pageContext.request.contextPath}/manage/queryArticleTypesWithNum.action";
					window.close();
				} else if (data == "duplicate") {
					alert("类型名称重复");
				} else {
					alert("提交失败");
				}
			}
		});
	}

	function clickCancel() {
		window.close();
	}

	$(function() {

		/*
		//设置表单提交的回调函数
		$("#articleTypeForm").submit(function() {
			jQuery.ajax({
				url : urlStr,
				data : $("#articleTypeForm").serialize(),
				type : "POST",
				success : function() {
					alert("OK");
				}
			});
		});
		 */
	});
	/*
	//设置窗口关闭的回调函数
	window.onunload = function() {
		opener.location.href = "${pageContext.request.contextPath}/manage/queryArticleTypesWithNum.action";
	};
	*/
</script>
</head>
  <body>
    This is my JSP page. <br>
    <form id="articleTypeForm" action="#" method="post">
    	<input type="hidden" name="id" value="${articleType.id }"/>
    	类型名称：<input name="typeName" value="${articleType.typeName }" /><br />
		<label>类型描述：</label><br/>
		<textarea name="description" rows="3" cols="20">${articleType.description }</textarea><br/>    
    	<input type="button" value="提交" onclick="clickSubmit()"/>
    	<input type="button" value="取消" onclick="clickCancel()"/>
    </form>
    
  </body>
</html>
