<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
    /* 下面是左侧导航栏的代码 */
.sidebar {
            position: fixed;
            top: 51px;
            bottom: 0;
            left: 0;
            z-index: 1000;
            display: block;
            /* padding: 20px; */
            padding: 25px;
            overflow-x: hidden;
            overflow-y: auto;
            border-right: 1px solid #eee;
            /*background-color: #ddd;*/
            background-image: url(<c:url value='/img/blog_bg5_cut_sm.jpg'/>);
            background-repeat: none;
            background-attachment: scroll;
            background-position: center center;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            background-size: cover;
            -o-background-size: cover;
        }

        .nav-sidebar {
            /* margin-right: -21px; */
            margin-right: -25px;
            margin-bottom: 20px;
            /* margin-left: -20px; */
            margin-left: -25px;
        }

        .nav-sidebar > li > a {
            text-indent: 30px;
            padding-right: 20px;
            padding-left: 20px;
            color: #fff;
        }

        .nav-sidebar > li > a:hover {
            color: #fff;
            background-color: #f0ad4e;
        }

        .nav-sidebar > .active > a,
        .nav-sidebar > .active > a:hover,
        .nav-sidebar > .active > a:focus {
            color: #fff;
            background-color: #428bca;
        }
</style>

<!-- 
<script type="text/javascript">
    function goto(address) {
        $("#blog_right").load(address);
    }
</script>
 -->

    <img class="img-circle" alt="YBZ" src="<c:url value='/img/home/kola_test_sm.jpg'/>" width="150" height="150" style="border: 2px solid #fff;margin: 10px 0px;"/>
    <div style="text-indent: 35px;margin: 0px 0px 10px 0px;font-size: 35px;">
        <a href="#" style="font-weight: bold;color: #222;">YBZ</a>
    </div>
    <ul class="nav nav-sidebar">
        <!-- <li style="margin-right: 0px;margin-bottom: 0px;margin-left: 0px;">
        -->
        <!-- <li class="active"> -->
        <li>
            <!-- <a href="#" onclick="goto('blog_content0.html')">首页</a> -->
            <a href="<c:url value='/home.action'/>">首页</a>
        </li>
        <li>
	        <c:forEach items="${articleTypeVoList }" var="articleTypeVo">
				<a href="<c:url value='/blog/queryArticles.action?articleType.id=${articleTypeVo.id }'/>">
					${articleTypeVo.typeName }&nbsp;(${articleTypeVo.numPublish })
				</a>
			</c:forEach>
		</li>
        <li>
            <!-- <a href="#" onclick="goto('')">文章归档</a> -->
            <a href="<c:url value='/blog/archiveArticle.action'/>">文章归档</a>
        </li>
    </ul>
    <!--
    <ul class="nav nav-sidebar">
        <li>
            <a href="#">设置</a>
        </li>
        <li>
            <a href="#">帮助</a>
        </li>
    </ul>
    -->