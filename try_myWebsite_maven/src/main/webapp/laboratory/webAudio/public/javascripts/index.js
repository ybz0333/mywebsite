!function(){
	var $ = function(s){return document.querySelector(s);}
	var box = $("#canvas");
	var canvas = document.createElement("canvas");
	var ctx = canvas.getContext("2d");

	box.appendChild(canvas);
	
	var HEIGHT,//canvas高
	    WIDTH;//canvs 宽
	
	var SIZE = 32;//音乐片段数
	
	var ARR = [];//该数组保存canvas中各图形的x,y坐标以及他们的颜色
	ARR.dotMode = "random";
	var isMobile = false;
	var isApple = false;
	
	!function(){
		var u = window.navigator.userAgent;
		var m = /(Android)|(iPhone)|(iPad)|(iPod)/i;
		if(m.test(u)){
			isMobile = true;
		}
		var ap = /(iPhone)|(iPad)|(iPod)|(Mac)/i;
		if(ap.test(u)){
			isApple = true;
		}
	}();
	
	//Android和苹果设备则设置音乐片段为16
	isMobile && (SIZE = 16);
	
	//初始化heigth，width以及canvas的宽高
	function init(){
		HEIGHT = box.clientHeight,
		WIDTH = box.clientWidth;
		canvas.height = HEIGHT;
		canvas.width = WIDTH;
		ctx.globalCompositeOperation = "lighter";
		ctx.lineWidth = (HEIGHT > WIDTH ? WIDTH : HEIGHT) / 30;
		getArr();
	}
	
	init();
	/*
	 *  获取[min ,max]之间的随机数
	 *  若无参数则min = 0，max = 1
	 *	max < min 则返回 0
	*/
	function random(min, max){
		min = min || 0;
		max = max || 1;
		return max >= min ? Math.round(Math.random()*(max - min) + min) : 0;
	}
	
	function getArr(){
		//创建线性渐变对象，以便绘制柱状图使用
		ARR.length = 0;
		ARR.linearGradient = ctx.createLinearGradient(0, HEIGHT, 0, 0);
		ARR.linearGradient.addColorStop(0, 'green');
		ARR.linearGradient.addColorStop(0.5, '#ff0');
		ARR.linearGradient.addColorStop(1, '#f00');	
	
		for(var i = 0;i < SIZE; i++){
			var x =  random(0, WIDTH),
				y = random(0, HEIGHT),
				color = 'rgba('+random(100, 250)+','+random(50, 250)+','+random(50, 100)+',0)',
				ran = random(1, 8) * 0.2;
			ARR.push({
				x: x,
				y: y,
				color: color,
				dx: ARR.dotMode == "random" ? ran : 0,
				dx2: ran,
				dy: random(1, 5),
				cap: 0,
				cheight : 10
			});
		}
	}
	
	//窗口resize则重新计算heigth，width以及canvas的宽高
	window.onresize = init;
	
	function Render(){	
		var o = null;	
		return function(del, ave){
			ctx.fillStyle = ARR.linearGradient;
			var w = Math.round(WIDTH / SIZE),
			cgap = Math.round(w * 0.3);
			cw = w - cgap;
			ctx.clearRect(0, 0, WIDTH, HEIGHT);
			if(Render.type == 'Dot' && ((del > 3 && ave > 30) || (ave > 50 && del > 0)) ){
				var d = Math.round(del * (ave - 20) * 0.01)+4;
				for(var i = 0; i < d; i++){
					var y = random(-HEIGHT * 2, 3*HEIGHT);
					ctx.beginPath();
					ctx.moveTo(0, y);		
					ctx.lineTo(WIDTH, HEIGHT - y);
					ctx.strokeStyle = 'rgb('+random(100, 250)+','+random(50, 250)+','+random(50, 100)+')';
					ctx.stroke();
				}
				//if(del > 3){alert(del + ' == ' + ave)}
				//$('.type .selected').innerHTML = del + '=' + ave;
			}
			for(var i = 0; i < SIZE; i++){		
				o = ARR[i];
				if(Render.type == 'Dot'){
					//ctx.strokeStyle = ARR[i].color.replace(",0",","+this[i]/270);
					var x = o.x,
					y = o.y,
					r = Math.round((this[i]/2+18)*(HEIGHT > WIDTH ? WIDTH : HEIGHT)/(isMobile ? 450 : 600));
					o.x += o.dx;
					//o.x += 2;
					o.x > WIDTH && (o.x = 0);
	
					//开始路径，绘画圆
					ctx.beginPath();
					ctx.arc(x, y, r, 0, Math.PI * 2, true);
			    	var gradient = ctx.createRadialGradient(x, y, 0, x, y, r);
				    gradient.addColorStop(0, "rgb(255,255,255)");
	
				    //var per = this[i]/(isMobile ? 160 : 250);
				    //per = per > 1 ? 1 : per;
	
				    //gradient.addColorStop(per, o.color.replace("opacity",1-this[i]/(isMobile ? 160 : 220)));
				    gradient.addColorStop(1, o.color);
				    /*for(var j = 0, l = Math.round(this[i]/10); j < l; j++){
				    	//ctx.beginPath();
				    	ctx.moveTo(x ,y);
				    	ctx.quadraticCurveTo(x+random(-30, 30), y+random(-30, 30), random(x + 100), random(y + 100));			    	
				    }
				    //ctx.stroke();*/
				    ctx.fillStyle = gradient;
				    ctx.fill();			    
				}
				if(Render.type == 'Column'){
					var h = this[i] / 280 * HEIGHT;
					ARR[i].cheight > cw && (ARR[i].cheight = cw);
					if(--ARR[i].cap < ARR[i].cheight){
						ARR[i].cap = ARR[i].cheight;
					};
					if(h > 0 && (ARR[i].cap < h + 40)){
						ARR[i].cap = h + 40 > HEIGHT ? HEIGHT : h + 40;
					}
					//console.log(ARR[i].cap);
					ctx.fillRect(w * i, HEIGHT - ARR[i].cap, cw, ARR[i].cheight);			
					ctx.fillRect(w * i, HEIGHT - h, cw, h);
				}
				
			}
		}
	}
	
	Render.type = "Dot";
	var lis = document.querySelectorAll(".music-list li");
	var visualizer = new MusicVisualizer({
		size: SIZE, 
		onended: function(){
			if($(".play")){
				$(".play").nextElementSibling ? $(".play").nextElementSibling.click() : lis[0].click();
			}else{
				lis[0].click();
			}
		},
		visualizer: Render()
	});
	
	//js获取项目根路径，如： http://localhost:8083/uimcardprj
	function getRootPath(){
	    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
	    var curWwwPath=window.document.location.href;
	    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
	    var pathName=window.document.location.pathname;
	    var pos=curWwwPath.indexOf(pathName);
	    //获取主机地址，如： http://localhost:8083
	    var localhostPaht=curWwwPath.substring(0,pos);
	    //获取带"/"的项目名，如：/uimcardprj
	    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	    return(localhostPaht+projectName);
	}
	
	!function(){
		for(var i = 0; i < lis.length; i++){
			lis[i].onclick = function(){
				visualizer.play(getRootPath() + '/laboratory/webAudio/public/media/' + this.title, isMobile);
				var play = $("li.play");
				play && (play.className = "");
				this.className = "play";
			}
		}
	}()
	
	$("#add").onclick = function(){
		$("#upload").click();
	}
	
	if(isApple){
		if(isMobile){
			$("#volume").className = "range";
		}
		$("#add").style.display = "none";
		$("#music-list").style.top = 0;
		
		$("#loading-box").style.display = "block";
		visualizer.addinit(function(){
			$("#loading").style.display = "none";
			$("#play").style.display = "block";
		});
		$("#play").onclick = function(){
			$("#loading-box").style.display = "none";
			visualizer.start();
		}
	};
	
	lis[0].click();

	$("#upload").onchange = function(){
		var file = this.files[0];
		var fr = new FileReader();
	
		fr.onload = function(e){
			visualizer.play(e.target.result);
		}
		fr.readAsArrayBuffer(file);
		$(".play") && ($(".play").className = "");
	}
	
	!function(){
		var types = document.querySelectorAll(".type li");
		for(var i = 0; i < types.length; i++){
			types[i].onclick = function(){
				for(var j = 0; j < types.length; j++){
					types[j].className = "";
				}
				this.className = "selected"
				Render.type = this.innerHTML;
			}
		}
	}()
	
	canvas.onclick = function(){
		if(Render.type == 'Dot'){
			for(var i = 0;i < SIZE; i++){
				ARR.dotMode == "random" ? ARR[i].dx = 0 : ARR[i].dx = ARR[i].dx2;
			}
			ARR.dotMode = ARR.dotMode == "static" ? "random" : "static";
		}
	}
	$("#volume").oninput = function(){
		visualizer.changeVolume(this.value/this.max);
	}
	$("#volume").oninput();
}()
