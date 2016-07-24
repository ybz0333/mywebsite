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
            /*padding: 20px;*/
            padding: 0px;
            overflow-x: hidden;
            overflow-y: auto;
            /* background-color: #ddd; */
            background-color: #A1A1A1;
            border-right: 1px solid #eee;
        }

        /*
        .nav-sidebar {
            margin-right: -21px;
            margin-bottom: 20px;
            margin-left: -20px;
        }

        .nav-sidebar > li > a {
            text-indent: 30px;
            padding-right: 20px;
            padding-left: 20px;
        }

        .nav-sidebar > .active > a,
        .nav-sidebar > .active > a:hover,
        .nav-sidebar > .active > a:focus {
            color: #fff;
            background-color: #428bca;
        }
        */
</style>
<!-- 手风琴菜单 -->
<script type="text/javascript" src="<c:url value='/menu/mymenu.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/menu/mymenu.css'/>" type="text/css" media="all">
<script type="text/javascript">
	/*
    function goto(address) {
        $("#blog_right").load(address);
    }
    */
    
    var bar1;
    
    $(function(){
        /*
         * bar1：必须与对象名相同！不要问为什么！！！
           ITCAST网络图书商城：大标题
         */
        //var bar1 = new Q6MenuBar("bar1", "ITCAST网络图书商城");
        bar1 = new Q6MenuBar("bar1", "博客管理平台");
        
        /*
        设置本色方案！
        配置方案一共4种：0、1、2、3
        */
        bar1.colorStyle = 2;
        /*
        指定图片目录
        */
        bar1.config.imgDir = "<c:url value='/menu/img/'/>";
        /*
        菜单之间是否相互排斥
        */
        bar1.config.radioButton=true;
        /*
        分类管理：指定要添加的菜单名称（如果这个名称的菜单已经存在，不会重复添加）
        查看分类：指定要添加的菜单项名称
        <c:url value='/adminjsps/admin/category/list.jsp'/>：指定菜单项时要请求的地址
        body：结果的显示框架页名称
        */
        bar1.add("文章管理", "新文章", "<c:url value='/manage/blog/editNewArticle.action'/>", "body");
        bar1.add("文章管理", "文章列表", "<c:url value='/manage/blog/manageArticle.action'/>", "body");
        bar1.add("文章管理", "文章类型管理", "<c:url value='/manage/blog/queryArticleTypesWithNum.action'/>", "body");

        bar1.add("用户管理", "查看用户", "<c:url value='/manage/user/listUsers.action'/>", "body");
        
        bar1.add("问卷管理", "查看问卷", "<c:url value='/manage/survey/listSurveys.action'/>", "body");
        
        bar1.add("聊天记录管理", "当前消息", "<c:url value='/manage/chatroom/currentChatMessage.action'/>", "body");
        bar1.add("聊天记录管理", "备份记录", "<c:url value='/manage/chatroom/listChatlogs.action'/>", "body");

        // 获取div元素
        var d = document.getElementById("menu");
        // 把菜单对象转换成字符串，赋给<div>元素做内容
        d.innerHTML = bar1.toString();
    });
</script>

    <div style="padding: 20px 20px 0px 20px">
        <img class="img-circle" alt="YBZ" src="<c:url value='/img/head_test_sm.jpg'/>" width="150" height="150" style="border: 2px solid #fff;margin: 10px 0px;"/>
        <div style="text-indent: 35px;margin: 0px 0px 10px 0px;font-size: 35px;">
            <a href="#" style="font-weight: bold;color: #222;">YBZ</a>
        </div>
    </div>
    <div id="menu"></div>
    <!--
    <ul class="nav nav-sidebar">
        <li class="active">
            <a href="index.html">首页</a>
        </li>
        <li>
            <a href="blog_all_articles.html">所有文章</a>
        </li>
        <li>
            <a href="#">信息查询</a>
        </li>
        <li>
            <a href="blog_order.html">文章归档</a>
        </li>
    </ul>
    -->
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