<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


  <tr>
  	<td><a href="#" onclick="set(-1, '所有人')">所有人</a></td>
  </tr>  
<c:forEach var="entry" items="${ userMap }">
  <tr>
    <td>
    	<a href="#" onclick="set(${ entry.key.id}, '${ entry.key.nickname}')">${ entry.key.nickname }</a> 
    	<c:if test="${ sessionScope.user.permission == 1 and entry.key.permission == 0}">
			<a href="${ pageContext.request.contextPath }/chatroom/kick.action?id=${ entry.key.id }">踢下线</a>
		</c:if>
	</td>
  </tr>
</c:forEach>
<tr><td height="30" align="center">当前在线[<font color="#FF6600">${ fn:length(userMap) }</font>]人</td></tr>
