<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章按时间归档</title>
</head>
<body>
	<c:forEach items="${articleArchiveVoList }" var="articleArchiveVo">
		<label>
			时间：
			<fmt:formatDate
				value="${articleArchiveVo.articleTimeGroup.createtime }"
				pattern="yyyy年MM月" />
		</label>
		<label>文章数量：${articleArchiveVo.articleTimeGroup.num }</label>
		<table width="100%" border=1>
			<c:forEach items="${articleArchiveVo.articleVoList}" var="article">
				<tr>
					<td>${article.id }</td>
					<td>${article.authorName }</td>
					<td><a href="${pageContext.request.contextPath }/article/read.action?id=${article.id }">${article.title }</a></td>
					<td>${article.content }</td>
					<td>${article.note }</td>
					<td><fmt:formatDate value="${article.createtime}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>
						<c:forEach items="${article.articleTypeList }" var="articleType">
							${articleType.id } ${articleType.typeName } ${articleType.description }
						</c:forEach>
					</td>
					<td>
						<c:forEach items="${article.tags }" var="tag">
							${fn:trim(tag) } 
						</c:forEach>
					</td>
					<td>${article.introduction }</td>
				</tr>
			</c:forEach>
		</table>
	</c:forEach>
</body>
</html>