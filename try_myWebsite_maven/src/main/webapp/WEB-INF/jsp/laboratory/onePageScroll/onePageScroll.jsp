<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="shortcut icon" href="<c:url value='/img/favicon.ico'/>">
	<link rel="stylesheet" href="<c:url value='/laboratory/onePageScroll/css/onepage-scroll_change.css'/>" />
	<style type="text/css">
	*{
		padding: 0;
		margin: 0;
	}

	/*
	通过CSS使div实现全屏效果
	全屏要素
	- 全屏的元素及其父元素都要设置height:100%
	- 将html、body标签设置height:100%
	（注：height:100%是跟随其父元素高度变化而变化的）
	*/
	html,body{
		height: 100%;
		/*这样设置可以去掉滚动条*/
		overflow: hidden;
	}
	#container,.sections,.section{
		height: 100%;
	}
	#section0,
	#section1,
	#section2,
	#section3{
		/*使背景图始终位于屏幕中心*/
		background-color: #000;
		background-size: cover;
		background-position: 50% 50%;
		text-align: center;
		color: white;
	}

	#section0{
		background-image: url(<c:url value='/laboratory/onePageScroll/img/1.jpg'/>);
	}
	#section1{
		background-image: url(<c:url value='/laboratory/onePageScroll/img/2.jpg'/>);
	}
	#section2{
		background-image: url(<c:url value='/laboratory/onePageScroll/img/3.jpg'/>);
	}
	#section3{
		background-image: url(<c:url value='/laboratory/onePageScroll/img/4.jpg'/>);
	}

	/*
#section0 { background-color: #1bbc9b;}
#section1 { background-color: #FF7F50;}
#section2 { background-color: #4BBFC3;}
#section3 { background-color: #f90;}
*/
	</style>
	<script src="<c:url value='/laboratory/onePageScroll/js/jquery-1.11.3.js'/>"></script>
	<script src="<c:url value='/laboratory/onePageScroll/js/jquery.onepage-scroll.min.js'/>"></script>
	<script>
	$(function(){
		$('.container').onepage_scroll({
			sectionContainer: '.section',
			//easing: "ease",
			easing: "ease-in-out",
    		animationTime: 1000,
			loop: false
		});
	});
	</script>
</head>
<body>
	<div class="container">
		<div class="section" id="section0">
			<h3>this is the page</h3>
			<div onclick="$('.container').moveDown();">点击滚动</div>
		</div>
		<div class="section" id="section1">
			<h3>this is the page</h3>
		</div>
		<div class="section" id="section2">
			<h3>this is the page</h3>
		</div>
		<div class="section" id="section3">
			<h3>this is the page</h3>
		</div>
	</div>

</body>
</html>