<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">

	function clickSubmit() {
		//根据${articleType}是否为空来判断是添加新文章类型还是修改文章类型
		var option = "${articleType}";
		var urlStr;
		if (option == "") {
			//$("#articleTypeForm").attr("action","${pageContext.request.contextPath }/manage/addNewArticleType.action");
			urlStr = "${pageContext.request.contextPath }/manage/blog/addNewArticleType.action";
		} else {
			//$("#articleTypeForm").attr("action","${pageContext.request.contextPath }/manage/updateArticleType.action");
			urlStr = "${pageContext.request.contextPath }/manage/blog/updateArticleType.action";
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
</script>
    
<!-- 模态对话框内容 -->
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-hidden="true">&times;</button>
	<h4 class="modal-title" id="myModalLabel">编辑文章类型信息</h4>
</div>
<div id="modal-body" class="modal-body">
	<form id="articleTypeForm" role="form" action="#" method="post">
    	<input type="hidden" name="id" value="${articleType.id }"/>
    	<div class="form-group">
	    	<label for="type-typeName">
	    		类型名称：
	    	</label>
    		<input id="type-typeName" class="form-control" name="typeName" value="${articleType.typeName }"/>
    	</div>
    	<div class="form-group">
		<label for="type-description">类型描述：</label>
		<textarea id="type-description" class="form-control" name="description" rows="2">${articleType.description }</textarea>
		</div>
    </form>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-default"
		data-dismiss="modal">关闭</button>
	<button type="button" class="btn btn-primary" onclick="clickSubmit()">提交更改</button>
</div>