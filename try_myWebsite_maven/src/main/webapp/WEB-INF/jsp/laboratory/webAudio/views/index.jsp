<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
    <meta name="Keywords" content="音乐可视化,webAudio,passion,passionate,music,音乐,HTML5,canvas,CSS3,自适应"> 
    <meta name="Description" content="利用HTML5 webAudio API 和canvas API以及CSS3制作成的自适应的音乐可视化应用">
    <meta name="Author" content="Doving">
    <meta name="Robots" content= "all">
    <title>音乐可视化</title>
    <link rel="shortcut icon" href="<c:url value='/img/favicon.ico'/>">
    <link rel="stylesheet" href="<c:url value='/laboratory/webAudio/public/stylesheets/index.css'/>"/>
    <style>
	    body {
	        background-image: url(<c:url value='/laboratory/webAudio/public/img/music_visible_bg.jpg'/>);
            background-repeat: none;
            background-attachment: scroll;
            /*background-position: center center;*/
            -webkit-background-size: cover;
            -moz-background-size: cover;
            background-size: cover;
            -o-background-size: cover;
        }
        .list .music-add {
        	background: transparent;
        }
    </style>
  </head>
  <body>
  	<header>
  		<h1>音乐可视化</h1>
      <ul class="type">
        <li class="selected">Dot</li>
        <li>Column</li>
      </ul>
      <p>Volume <input id="volume" type="range" min="0" max="100" value="60"></p>
  	</header>  	
    <div class="list" id="list">
    	<button class="music-add" id="add">
    		Local music
    	</button>
      <input class="upload" type="file" id="upload" />
    	<ul class="music-list" id="music-list">
	    	<c:forEach items="${musicNames }" var="musicName">
	    		<li title="${musicName }">${musicName }</li>
	    	</c:forEach>
    	</ul>
    </div>
    <div class="canvas" id="canvas">
    </div>
    <div class="loading-box" id="loading-box">
      <ul id="loading">
        <li class='l'></li>
        <li class='o'></li>
        <li class='a'></li>
        <li class='d'></li>
        <li class='i'></li>
      </ul>
      <div class="play" id="play">PLAY</div>
    </div>
    <script type="text/javascript" src="<c:url value='/laboratory/webAudio/public/javascripts/MusicVisualizer.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/laboratory/webAudio/public/javascripts/index.js'/>"></script>
  </body>
</html>
