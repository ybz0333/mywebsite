<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章类型管理测试</title>
<link href="${pageContext.request.contextPath}/css/pagination.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
<script type="text/javascript">
//弹出窗口
/*
function openwin(url,width,height){   
	var l=window.screen.width ;   
	var w= window.screen.height;    
	var al=(l-width)/2;   
	var aw=(w-height)/2;   
	var OpenWindow=window.open(url,"编辑文章类型信息","modal=yes,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,width="+width+",height="+height+",top="+aw+",left="+al+"");       
	OpenWindow.focus();
if(OpenWindow!=null){ //弹出窗口关闭事件
//if(window.attachEvent) OpenWindow.attachEvent("onbeforeunload",   quickOut); 
if(window.attachEvent) OpenWindow.attachEvent("onunload",   quickOut); 
}
}

//关闭触发方法
function quickOut()
{
alert("窗口已关闭");
}
*/

function openwin(url,width,height){   
	var l=window.screen.width ;   
	var w= window.screen.height;    
	var al=(l-width)/2;   
	var aw=(w-height)/2;   
	var OpenWindow=window.open(url,"编辑文章类型信息","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,width="+width+",height="+height+",top="+aw+",left="+al+"");       
	OpenWindow.focus();
	//阻止父窗口得到焦点
	window.onfocus = function() {
		OpenWindow.focus();
	};
	window.onclick = function() {
		OpenWindow.focus();
	};
	window.document.onfocus=function() {
		OpenWindow.focus();
	};
	window.document.onclick=function() {
		OpenWindow.focus();
	};
	window.document.ondbclick=function() {
		OpenWindow.focus();
	};
}

//删除确认
function deleteConfirm(numTotal, urlStr) {
	if(numTotal > 0) {
		alert("要删除的文章类型对应的文章总数大于0");
		return;
	}
	var result = confirm("您确定要删除该文章类型吗？");
	if(result == true) {
		$.ajax({
			type : 'get',
			async : false,
			url : urlStr,
			//data : "",
			success : function(data){
				if(data == "success") {
					alert("删除成功");
				} else if(data == "still_have_articles") {
					alert("要删除的文章类型对应的文章总数大于0");
				} else {
					alert("删除出错");
				}
			}
		});
	}
	location.href = "${pageContext.request.contextPath}/manage/queryArticleTypesWithNum.action";
}

</script>

</head>
  <body>
    This is my JSP page. <br>
    
	<table width="100%" border=1>
		
		<c:forEach items="${articleTypeVoList}" var="articleTypeVo">
			<tr>
				<td>${articleTypeVo.id }</td>
				<td>${articleTypeVo.typeName }</td>
				<td>${articleTypeVo.description }</td>
				<td>${articleTypeVo.numTotal }</td>
				<td>${articleTypeVo.numPublish }发布</td>
				<td>${articleTypeVo.numDraft }草稿</td>
				<td><input type="button" value="修改" onclick="openwin('${pageContext.request.contextPath }/manage/editArticleType.action?id=${articleTypeVo.id }',600,500)"/></td>
				<td><input type="button" value="删除" onclick="var urlStr='${pageContext.request.contextPath }/manage/deleteArticleType.action?id=${articleTypeVo.id }';deleteConfirm(${articleTypeVo.numTotal }, urlStr)"/></td>
			</tr>
		</c:forEach>
	</table>
	<input type="button" value="新增" onclick="openwin('${pageContext.request.contextPath }/manage/editNewArticleType.action',600,500)"/>
  </body>
</html>
