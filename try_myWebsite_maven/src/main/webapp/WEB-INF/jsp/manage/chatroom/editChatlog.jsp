<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- ueditor相关 -->
<!-- 配置文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/ueditor/ueditor.all.js"></script>
<script type="text/javascript">
	$(function() {
		// 实例化编辑器
		//ueditor编辑器设置
		//window.UEDITOR_HOME_URL = "/testGrammar/ueditor/";
		var editor = UE.getEditor('container');
		
		//设置下拉列表ChatlogTypeSelect的默认选中项
		var type = "${chatlog.type }";
		if(type != "") {
			selectorString = "#ChatlogTypeSelect option[value='" + type + "']";
			$(selectorString).attr("selected","selected");
		}
	});

	function clickSubmit() {
		$.ajax({
			url : "<c:url value='/manage/chatroom/updateChatlog.action'/>",
			data : $("#chatlogForm").serialize(),
			type : "POST",
			success : function(data) {
				if (data == "success") {
					alert("保存成功");
				} else {
					alert("保存失败");
				}
				location.href = "<c:url value='/manage/chatroom/listChatlogs.action'/>";
			}
		});
	}
</script>
    
<!-- 模态对话框内容 -->
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-hidden="true">&times;</button>
	<h4 class="modal-title" id="myModalLabel">编辑聊天记录备份</h4>
</div>
<div id="modal-body" class="modal-body">
	<form id="chatlogForm" role="form" action="#" method="post">
    	<input type="hidden" name="id" value="${chatlog.id }"/>
    	<!-- 备份类型 -->
    	<div class="form-group">
	    	<label for="ChatlogTypeSelect" class="col-sm-1 control-label">
	    		备份类型：
	    	</label>
			<div class="col-sm-2">
				<select id="ChatlogTypeSelect" class="form-control" name="type">
					<option value="0">系统备份</option>
					<option value="1">用户备份</option>
				</select>
			</div>
		</div>
		<!-- 备份时间 -->
		<div class="form-group">
			<label for="chatlog-createtime" class="col-sm-1 control-label">
				备份时间：
			</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="chatlog-createtime" name="createtime"
				 value="${chatlog.createtime }" placeholder="（格式：yyyy-MM-dd HH:mm:ss，不填则设置为当前时间）：" />
			</div>
		</div>
    	<!-- 聊天记录内容 -->
    	<div class="form-group">
    		<div class="col-sm-8">
    			<!-- 加载编辑器的容器 -->
				<script id="container" name="content" type="text/plain" style="width: 100%">${chatlog.content }</script>
    		</div>
		</div>
    </form>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-default"
		data-dismiss="modal">关闭</button>
	<button type="button" class="btn btn-primary" onclick="clickSubmit()">提交更改</button>
</div>