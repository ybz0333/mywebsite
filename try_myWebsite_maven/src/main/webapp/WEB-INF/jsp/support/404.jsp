<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>出错了</title>
  <link rel="shortcut icon" href="<c:url value='/img/favicon.ico'/>">
  <STYLE type=text/css>
  .font1 {
    FONT-SIZE: 20px
  }
  .font2 {
    FONT-SIZE: 20px
  }
</STYLE>
</head>
<body>
  <TABLE height="500" cellSpacing="0" cellPadding="0" width="500" align="center" 
background="<c:url value='/img/error/yelang.gif'/>" border="0">
    <TBODY>
      <TR>
        <TD height="330">&nbsp;</TD>
      </TR>
      <TR>
        <TD vAlign="top">
	      <DIV style="text-align: center; font-size: 45px; font-weight: bold; margin: -10px auto 15px">
	      	404
	      </DIV>
          <DIV class="font1" align="center">
            <STRONG>
              你访问的页面
              <FONT color="#0099ff">不存在</FONT>
              或被
              <FONT color="#ff0000">
                删除
                <BR></FONT>
            </STRONG>
          </DIV>
          <DIV class="font2" align="center" style="margin-top: 15px">
            <!-- <SPAN class="font2"> -->
              <FONT color="#666666">
                点击这里返回
                <STRONG>
                <A href="<c:url value='/home.action'/>">ybz的博客</A>
                </STRONG>
                首页
              </FONT>
            <!-- </SPAN> -->
          </DIV>
        </TD>
      </TR>
    </TBODY>
  </TABLE>
</body>
</html>