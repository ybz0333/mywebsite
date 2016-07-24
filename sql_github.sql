/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 5.6.16 : Database - mywebsite
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`mywebsite` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mywebsite`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_name` varchar(30) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(20000) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  `state` int(11) DEFAULT '1',
  `click_count` int(11) DEFAULT '0',
  `praise_count` int(11) DEFAULT '0',
  `tags` varchar(80) DEFAULT NULL,
  `introduction` varchar(400) DEFAULT NULL,
  `img_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

/*Data for the table `article` */

insert  into `article`(`id`,`author_name`,`title`,`content`,`createtime`,`note`,`state`,`click_count`,`praise_count`,`tags`,`introduction`,`img_name`) values (11,'test','test','test',NULL,'test',1,0,0,NULL,NULL,NULL),(15,'test','test','test',NULL,'test',1,0,0,NULL,NULL,NULL),(18,'test','testFromEditor','<p><strong>test from editor</strong></p><p><strong><img src=\"/try_springmvc_mybatis_20160110/ueditor/jsp/upload/image/20160124/1453642947577078521.png\" title=\"1453642947577078521.png\" alt=\"æ?¹è¯»è·¯å¾?è¦?å?&nbsp;ä¸?å?¥.png\"/></strong></p>','2016-06-04 15:36:22','test from editor',2,6,1,'','','29.jpeg'),(27,'test','完全是一篇测试文章','<p>测试2，这里写一篇测试文章</p><p>这里我要多写一点内容了</p><ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p><img src=\"http://o8r9omg0x.bkt.clouddn.com/img/test/head_test_sm.jpg\"/>文章需要多写一点内容</p></li></ol><blockquote><p>引用一句话</p></blockquote><h1 label=\"标题居中\" style=\"font-size: 32px; font-weight: bold; border-bottom-color: rgb(204, 204, 204); border-bottom-width: 2px; border-bottom-style: solid; padding: 0px 4px 0px 0px; text-align: center; margin: 0px 0px 20px;\">测试<br/></h1><h3>这一段这样写<br/></h3><p style=\"margin-bottom: 5px;\"><span label=\"强调\" style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px;\">testestse</span></p><pre class=\"brush:cpp;toolbar:false\">#include</pre><p style=\"margin-bottom: 5px;\"><span label=\"强调\" style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px;\"></span><br/></p><p style=\"margin-bottom: 5px;\">再写一段代码</p><pre class=\"brush:java;toolbar:false\">public&nbsp;static&nbsp;void&nbsp;main(String[]&nbsp;args)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(&quot;test&quot;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(&quot;testtesttesttesttesttesttestesttesttesttesttesttesttesttesttesttesttesttesttesttestttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest&quot;);\r\n}</pre><p style=\"margin-bottom: 5px;\"><br/></p>','2016-06-03 23:09:09','test',2,155,17,'Tag1,testTag2,testTag3','测试2 这里我来完完整整地写一次摘要，用来测试我的摘要。凑齐50字、50字、50字、50字、50字。。。\r\n测试2 这里我来完完整整地写一次摘要，用来测试我的摘要。凑齐50字、50字、50字、50字、50字。。。\r\n测试2 这里我来完完整整地写一次摘要，用来测试我的摘要。','2.png'),(28,'test','testDelete','<p>????</p>','2016-02-02 17:16:50','test',2,4,2,'','testIntroduction','1.png'),(29,'test','testDelete',NULL,'2016-06-05 09:44:55','test',2,9,5,'','','1.png'),(31,'admin','建站文章','<p>这是一篇建站文章。</p><p>这个网站是基于<strong>javaWeb</strong>构建的，后端基于<strong>springmvc+spring+mybatis</strong>，前端基于<strong>bootstrap+jquery</strong>，服务器使用<strong>nginx+tomcat</strong>。</p><p><br/></p><p>博主今年还是学生，水平比较有限。之前做过一段时间C++，最近在做Java。博主也知道现在的个人博客用java构建的不多，后端大多使用PHP、Python或NodeJs，而且偏重前端。因为近期在使用javaWeb，就写一个这样的网站作为练习。</p><p>网站的源码可以从博主的Github上获取：<a href=\"https://github.com/ybz0333/mywebsite\" target=\"_blank\">https://github.com/ybz0333/mywebsite</a></p><p>博主从今年寒假开始写这个网站的，当时边学边写，把后端的基本模块写完了，前端只是写了几个测试页面。后来想做上线，就翻新了一下前端，扩充了后端的功能，又买了阿里云的服务器和域名。网站上线蛮有成就感的<img src=\"http://img.baidu.com/hi/jx2/j_0028.gif\"/>。</p><p><br/></p><p>最近到了求职季，博主也在整理一些代码，上传到github上，同时同步到网站的博客中。</p><p>希望求职季能找一个好工作 ^_^。</p><p><br/></p>','2016-07-24 11:05:13','',2,2,0,'建站,javaWeb','这篇文章是对本站的概述','29.jpeg'),(32,'admin','C++变音程序','<p>基于C++和Qt的变音程序<img src=\"http://img.baidu.com/hi/jx2/j_0057.gif\"/></p><p>项目见博主的Github:<a href=\"https://github.com/ybz0333/qt_audio\" target=\"_blank\">https://github.com/ybz0333/qt_audio</a></p><p><br/></p><p>这几天整理程序时，把几个源代码集中上传到github上 &nbsp;</p><p>我们实验室有人开发机器人项目，其中用到变音程序，可以在后台讲话，将语音变音后传输到前台，就听不出讲话人的身份了。觉得很有趣，就想也写一个出来。 &nbsp;</p><p>这里实现了基本的功能，即变音部分。语音数据包的传输功能还没实现。</p><p><br/></p><p><strong><span style=\"font-size: 20px;\">使用：</span></strong></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p dir=\"ltr\"><span style=\"font-size: 16px;\">上传了Windows下VS2010+Qt4.8.6环境的C++程序。由于使用qt，应该方便移植到Linux上。 &nbsp;</span></p></li><li><p dir=\"ltr\"><span style=\"font-size: 16px;\">程序打开后就是一个空白界面，如果想完全在后台运行，可将窗口隐藏。 &nbsp;</span></p></li><li><p style=\"white-space: normal;\">程序在运行时，会采集默认音频输入设备的PCM声音数据，进过变音处理后，从默认音频输出设备输出。如果直接使用笔记本电脑的麦克风，会有回波问题。使用带麦克风的耳机可以解决这个问题。最好的方案是使用外接麦克风和音响。</p></li></ul><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><strong><span style=\"font-size: 20px;\">程序结构：</span></strong><br/></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p style=\"white-space: normal;\"><span style=\"font-size: 16px;\">这个小程序结构很简单。对音频的处理使用了Qt中的QAudioInput、QAudioOutput类，配合QByteArray类（这里起缓冲区的作用）。</span></p></li><li><p style=\"white-space: normal;\"><span style=\"font-size: 16px;\">变音部分使用了SoundTouch库。这个库可以实现声音数据的变调、变速。底层应该是用了频谱搬移。</span></p></li><li><p style=\"white-space: normal;\">Qt的音频处理部分直接参考了这个博客：<a href=\"http://blog.csdn.net/jdh99/article/details/39204129\" target=\"_blank\">http://blog.csdn.net/jdh99/article/details/39204129</a></p></li><li><p style=\"white-space: normal;\">使用SoundTouch库时发现一个问题，它的receiveSamples函数是异步处理的。即放入的音频数据不是马上就能处理好取出的，而是积累到一定长度再处理、返回，所以receiveSamples有时取不到数据，有时能取到比刚刚放入的数据更长的结果数据。</p></li></ul>','2016-07-24 11:48:15','',2,4,0,'github,C++,qt','博主上传到Github的一个项目，基于C++和Qt的变音程序','12.png'),(33,'admin','人脸识别算法服务器','<p>使用C++、opencv、Qt4.8.6编写的人脸识别算法服务器<img src=\"http://img.baidu.com/hi/jx2/j_0057.gif\"/></p><p>github地址：<a href=\"https://github.com/ybz0333/algServer\" target=\"_blank\">https://github.com/ybz0333/algServer</a></p><p><br/></p><p>这几天整理程序时，把几个源代码集中上传到github上 &nbsp;</p><p>这个程序算是之前项目的一个实验程序，一些具体细节还没开发、调试完，先上传上来。</p><p><br/></p><p><span style=\"font-size: 20px;\"><strong>主要功能</strong></span></p><p>算法开发中遇到这样的问题：人脸检测这样实时性要求高的算法可以直接在前端跑，而人脸识别这样的算法有时对平台依赖性强，有的还有加密的需求，且算法开销大，无法跟上人脸检测的速度。 &nbsp;</p><p>后来看到Face++提供算法的模式：人脸检测部分使用离线SDK打包给用户，人脸识别部分采取http协议远程调用的方式提供服务 &nbsp;</p><p>这里想模仿这种模式，把检测算法做成工具类，把识别算法做成请求/响应的模式。 &nbsp;</p><p><br/></p><p><strong><span style=\"font-size: 20px;\">使用</span></strong></p><p>开发时用的环境为VS2010、opencv2.4.6、Qt4.8.6。</p><p>上传前试了一下，程序框架写好了，没有完全调试好。 &nbsp;</p><p>程序包括一个服务端和一个客户端。服务端即solution try_tcpservser中的try_tcpservser工程，客户端即test_socket中的TestTCPClient工程。</p><p>先运行服务端程序，会出现下面这个简单的窗口： &nbsp;</p><p><br/></p><p><img src=\"http://o8r9omg0x.bkt.clouddn.com/img/try_github/algServer/server.png\"/>) &nbsp;</p><p>连接和日志信息都打印在窗口上。 &nbsp;</p><p>再运行客户端，连接上之后就是采集摄像头图像进行人脸检测，然后和服务端通信进行人脸识别，接收识别结果（这里只是一个测试用的控制台程序）。</p><p><br/></p><p><strong><span style=\"font-size: 20px;\">程序结构</span></strong></p><p>这是程序的框图： &nbsp;</p><p><img src=\"http://o8r9omg0x.bkt.clouddn.com/img/try_github/algServer/algServer.png\"/></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>左边是服务端，TCPServer监听端口，每路连接请求创建一个clientsocket对象。 &nbsp;</p><p>clientsocket对象可能收到两种包：人脸数据包和心跳包。人脸数据包中包含待识别的人脸对，每张人脸由GUID和图片数据组成。心跳包则为了维持连接而发送。 &nbsp;</p><p>使用CFace提供的静态方法可以将数据包转换成对象，使用CIFaceRecog类做人脸识别。CIFaceRecog类，是抽象类，继承了CIRunnable接口；CFaceRecogSURF是它的一个实现类，使用SURF算法进行人脸识别，实际使用中可提供其它人脸识别类。 &nbsp;</p><p>人脸识别的请求用CFaceRecog接口包装送入线程池中。线程池使用pthread库实现。识别完成将识别结果发送回客户端。 &nbsp;</p></li><li><p>右边是客户端。main线程负责从摄像机采集视频，进行人脸检测，并将结果放入人脸队列中；同时负责从结果队列中取出人脸识别结果。</p><p>CFaceRecogTest类包装了TCPClient类，继承了线程类，在另一个线程中运行；其中的TCPClient类负责通信功能，包括从人脸队列中取得人脸数据并发送，接收服务端响应的结果数据并送入结果队列以提供给main线程，向向服务端定时发送心跳包。</p></li></ul><p><br/></p>','2016-07-24 11:55:54','',2,5,0,'github,C++,qt,opencv,线程池','博主上传到Github的一个项目，人脸识别算法服务器','25.jpeg'),(35,'admin','个人博客所用前端页面','<p>这是前一段时间写的前端页面，用于个人博客系统。<img src=\"http://img.baidu.com/hi/jx2/j_0057.gif\"/></p><p>github地址：<a href=\"https://github.com/ybz0333/try_mywebsite_pages\" target=\"_blank\">https://github.com/ybz0333/try_mywebsite_pages</a></p><p><span style=\"font-size: 20px;\"><strong>概述：</strong></span></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>之前完成了个人博客后端的基础功能，使用简单的jsp+jstl写了测试页面。继续开发时考虑单独写一个体面一点的前端页面，再和原来的后端做对接。由于前期前端水平有限，考虑使用bootstrap框架，使用jquery来做javascript和ajax方面的功能，难度不大，又能了解前端开发。</p></li><li><p>在写的过程中发现，感觉前端开发比想象中的复杂，自己缺乏很多知识和经验。开始写的时候，很多css、js代码都直接和html页面耦合在一起。有时不满意bootstrap的样式，就直接就地覆盖了。</p></li><li><p>在写的过程中还遇到一些问题。比如现在框架页逐渐用的少了，就想用一下div+css的方法去拆分页面，每一块div用ajax异步加载，通用性强，用户体验好，页面代码方便复用，还能在调试时脱离后端服务器的依赖。后来发现本地调试时ajax在有的浏览器上出问题，需要部署到服务器上。又发现使用这种模式，页面分成几块，原先后端向页面的数据传递变得不方便了（在数据传递的便利性上不如@include去组织页面）。因为时间原因，就把两种方式混用了。不知道前端程序员在开发时怎么解决这方面的问题。</p></li><li><p>拼拼凑凑写出来一个能用的前端，就拿去对接了。还是有必要总结一下其中的细节的。</p></li></ul><p><strong><span style=\"font-size: 20px;\">具体描述：</span></strong></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>html页面都放在pages目录下，其中home.html是入口，可以跳转到其它模块；admin、blog、laboratory分别对应管理后台、博客、实验室三个模块。support中是错误页，user中是登录、注册页</p></li><li><p>css、font-awesome、fonts、img、js存储了页面中用到的前端资源</p></li><li><p>css中的word-display-custom.css文件是首页的闪光字体所用样式</p></li><li><p>jqcloud是一个标签云库</p></li><li><p>menu是一个找来的手风琴菜单</p></li><li><p>从start bootstrap网站上下载了bootstrap模板，经过改造成为目前的首页</p></li><li><p>从慕课网上找了三栏式布局的例子，经过改造成为当前三栏式的基础</p></li><li><p>和后端对接后，还做了许多修改</p></li><li><p>使用boostrap是尝试实现响应式布局的，许多地方做得还不够好。</p></li><li><p>请尝试使用谷歌和火狐浏览器，IE浏览器在兼容性上处理得不够好，主要是首页背景图片在IE中的样式有问题。这种问题还没有找到好的解决方法。</p></li><li><p>后期还需要补充前端的知识，还需要看看AngularJs、ReactJs等前端框架</p></li></ul><p><br/></p><p>附首页图：</p><p><img src=\"http://o8r9omg0x.bkt.clouddn.com/img/try_github/try_mywebsite_pages/home_sm.jpg\"/></p><p><br/></p>','2016-07-24 15:54:51','',2,2,0,'github,前端,bootstrap,jquery','博主上传到Github的一个项目，个人博客所用前端页面','29.jpeg'),(40,'admin','牛客网java编程练习','<p>牛客网java编程练习<img src=\"http://img.baidu.com/hi/jx2/j_0057.gif\"/></p><p>github地址：<a href=\"https://github.com/ybz0333/java_program_practice\" target=\"_blank\">https://github.com/ybz0333/java_program_practice</a></p><p><span style=\"font-size: 20px;\"><strong>2016.02.27</strong></span></p><p>第一次上传，主要是八大排序算法。</p><p>位于com.ybz.sort包中，</p><p>*Try.java是自己对算法的编写尝试，没有Try的文件是网络上的答案。</p><p><strong>经典排序算法的时间复杂度</strong></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>插入排序、选择排序、冒泡排序：O(N^2)</p></li><li><p>归并排序、快速排序、堆排序、希尔排序：O(N*logN)</p></li><li><p>计数排序、基数排序：O(N)</p></li></ul><p><br/></p><p><strong>经典排序算法的空间复杂度</strong></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>插入排序、选择排序、冒泡排序、堆排序、希尔排序：O(1)</p></li><li><p>快速排序：O(logN)~O(N)（取决于划分情况）</p></li><li><p>归并排序：O(N)（有方法可以优化到O(1)，但时间复杂度会上升）</p></li><li><p>计数排序、基数排序：O(M)（取决于选择桶的数量）</p></li></ul><p><br/></p><p><strong>稳定性的概念：</strong></p><p>假定待排序的记录序列中，存在多个具有相同的关键字的记录，若经过排序，这些记录的相对次序保持不变，称这种排序算法是稳定的，否则称为不稳定的。</p><p><br/></p><p><strong>稳定的排序算法：</strong></p><p>冒泡排序、插入排序 归并排序 计数排序、基数排序（桶排序）</p><p><br/></p><p><strong>不稳定的排序算法：</strong></p><p>选择排序 快速排序、希尔排序、堆排序</p><p><br/></p><p><strong>补充说明：</strong></p><p>1. 对于人的年龄排序或者身高排序，因为这种数据范围通常比较小，可以考虑采用计数排序，但是对于均匀分布的证书，计数排序就不合适了。</p><p>2. 快速排序之所以叫快速排序，并不代表它比堆排序和归并排序优良。在最好情况下，它的渐进复杂度与堆排序和归并排序是相同的。只是快速排序的常量系数比较小而已。</p><p>3. 工程上的排序：</p><p>&nbsp;- 工程上的排序是综合排序</p><p>&nbsp;- 数组较小时，插入排序</p><p>&nbsp;- 数组较大时，快速排序或其它O(N*logN)的排序</p><p><br/></p><p><span style=\"font-size: 20px;\"><strong>2016.07.22</strong></span></p><p>这次继续之前的编程练习</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>string和stringAndTree包中是有关字符串和树的题目</p></li><li><p>stackAndQueue是有关堆栈和队列的题目</p></li><li><p>list包中是有关链表的题目</p></li><li><p>binarySearch包中是有关二分搜索的题目</p></li></ul><p><br/></p>','2016-07-24 16:23:37','',2,2,0,'github,java','博主上传到Github的一个项目，牛客网java编程练习','1.png'),(41,'admin','JavaWeb练习项目——我的博客系统','<p>我的javaWeb练习项目，个人博客管理系统。后端基于springmvc+spring+mybatis+mysql，前端使用jquery+bootstrap。<br/></p><p>网址：<a href=\"http://www.yuanbuzhou.com\" target=\"_blank\" textvalue=\"www.yuanbuzhou.com\">www.yuanbuzhou.com</a></p><p>github地址：<a href=\"https://github.com/ybz0333/mywebsite\" target=\"_blank\">https://github.com/ybz0333/mywebsite</a></p><p><span style=\"font-size: 20px;\"><strong>2016.02.15</strong></span></p><p>第一次上传，上传了整个工程的源码，需要部署到tomcat等服务器上才能运行。</p><p>完成了后端的基础功能，包括：</p><p>SSM的环境搭建和使用，分层编程的练习，分层单元测试的练习。</p><p>后台部分：</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>ueditor编辑器的嵌入，图片文件上传等功能的配置，图片暂时直接保存在web服务器上。</p></li><li><p>文章的按类型、状态、年月查询与管理。</p></li><li><p>文章的新增、修改、删除等功能，对文章类型、标签、创建时间、内容等进行编辑，存草稿等功能。</p></li><li><p>文章类型的管理，增改删查。</p></li><li><p>后台登录功能，验证码功能</p></li><li><p>发送邮件功能</p></li></ul><p>前台部分：</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>文章分页展示</p></li><li><p>点击率统计，点赞</p></li><li><p>文章按时间归档</p></li><li><p>留言功能（邮件）</p></li></ul><p><br/></p><p><strong>预期的改进：</strong></p><p>目前的前端水平较低。页面使用jsp+jstl做了最原始的内容展现。考虑使用基于bootstrp的前端模板做前台和后台的页面。可借助于github pages，建一个新的仓库。</p><p>博客功能的扩展：</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>引入markdown编辑器</p></li><li><p>用户验证的加密</p></li><li><p>微信接口开发</p></li><li><p>实验室栏目</p></li></ul><p>&nbsp; &nbsp;。。。</p><p>项目部署的改进：</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>使用其它的web服务器部署项目</p></li><li><p>使用maven做项目管理</p></li><li><p>项目的上线</p></li></ul><p><br/></p><p><span style=\"font-size: 20px;\"><strong>2016.07.22</strong></span></p><p>这次上传做了比较大的修改</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>网站上线了，可以访问这个网址查看<a href=\"http://www.yuanbuzhou.com\" target=\"_blank\" textvalue=\"www.yuanbuzhou.com\">www.yuanbuzhou.com</a></p></li><li><p>翻新了前端页面部分，基于bootstrap+jquery，响应式布局</p></li><li><p>扩充、完善了各个模块的功能：</p></li><li><p>首页对接了邮件发送的功能</p></li><li><p>文章模块：前台展示与归档，点赞；后台ueditor编辑器，分类查询与管理，草稿功能，点击量统计</p></li><li><p>聊天室模块：基于javaWeb组件的聊天室。在session中维护聊天用户列表，使用浏览器端轮询的方式实现内容的刷新。用于练习，实际使用中有很多更好的方案。后台有对应的聊天信息修改和聊天记录备份的功能。</p></li><li><p>实验室模块：做Web实验用，目前有音乐可视化和全屏滚动两个实验</p></li><li><p>个人页和问卷，后台有对应的管理功能</p></li><li><p>使用Maven做项目管理，使用Nginx+tomcat部署，阿里云CentOS环境</p></li></ul><p><strong>存在的问题：</strong></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>前端有浏览器兼容性问题：首页的背景图在IE浏览器中有样式问题</p></li><li><p>文章图片存储问题：想借助七牛云，没来得及实现，目前直接存储在服务端。有时直接在本地更新文章，要同步图片</p></li></ul><p><strong>预期的改进：</strong></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>可以尝试使用Restful风格</p></li><li><p>实验室栏目可以做WebService的实验，可以做Red5流媒体服务器的实验</p></li><li><p>聊天室的技术可以改进</p></li><li><p>相册模块还没有做好</p></li><li><p>分页实现上可以试一试新的技术</p></li><li><p>前端页面还有许多可以改进和优化的地方</p></li><li><p>可以试用缓存技术和其它提高并发性、可用性的方案</p></li></ul><p>其它边想边做</p><p><br/></p><p><strong>下面是网站的截图：</strong></p><p>首页</p><p><img src=\"http://o8r9omg0x.bkt.clouddn.com/img/try_github/try_mywebsite_pages/home_sm.jpg\"/></p><p>博客</p><p><img src=\"http://o8r9omg0x.bkt.clouddn.com/img/try_github/mywebsite/blog_sm.jpg\" width=\"820\" height=\"315\" border=\"0\" vspace=\"0\" title=\"\" alt=\"\" style=\"width: 820px; height: 315px;\"/></p><p>实验室</p><p><img src=\"http://o8r9omg0x.bkt.clouddn.com/img/try_github/mywebsite/laboratory_sm.jpg\"/></p><p>聊天室</p><p><img src=\"http://o8r9omg0x.bkt.clouddn.com/img/try_github/mywebsite/chatroom_sm.jpg\"/></p><p>后台管理页面1</p><p><img src=\"http://o8r9omg0x.bkt.clouddn.com/img/try_github/mywebsite/manage_article_sm.jpg\"/></p><p>后台管理页面2</p><p><img src=\"http://o8r9omg0x.bkt.clouddn.com/img/try_github/mywebsite/newArticle_sm.jpg\"/></p><p><br/></p>','2016-07-24 19:15:48','',2,4,0,'github,JavaWeb','博主上传到Github的一个项目，JavaWeb练习项目——我的博客系统','29.jpeg');

/*Table structure for table `article_type` */

DROP TABLE IF EXISTS `article_type`;

CREATE TABLE `article_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(30) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `article_type` */

insert  into `article_type`(`id`,`type_name`,`description`) values (1,'所有文章',''),(2,'测试','test'),(23,'建站文章','none'),(24,'上传到github','none');

/*Table structure for table `chatlog` */

DROP TABLE IF EXISTS `chatlog`;

CREATE TABLE `chatlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `content` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `chatlog` */

/*Table structure for table `rel_article_article_type` */

DROP TABLE IF EXISTS `rel_article_article_type`;

CREATE TABLE `rel_article_article_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `article_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8;

/*Data for the table `rel_article_article_type` */

insert  into `rel_article_article_type`(`id`,`article_id`,`article_type_id`) values (215,27,1),(216,27,2),(241,31,1),(242,31,23),(257,40,1),(258,35,1),(259,33,1),(260,33,24),(261,32,1),(262,32,24),(263,41,1);

/*Table structure for table `survey` */

DROP TABLE IF EXISTS `survey`;

CREATE TABLE `survey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_name` varchar(50) DEFAULT NULL,
  `sender_ip` varchar(50) DEFAULT NULL,
  `submit_time` datetime DEFAULT NULL,
  `survey_data` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `survey` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `permission` int(11) DEFAULT NULL,
  `registtime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`nickname`,`password`,`permission`,`registtime`) values (15,'test','test','slQR48pOifg=',1,'2016-07-24 17:02:58');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
