# JavaWeb练习项目——我的博客系统
我的javaWeb练习项目，个人博客管理系统。后端基于springmvc+spring+mybatis+mysql，前端使用jquery+bootstrap。
## 2016.02.15
第一次上传，上传了整个工程的源码，需要部署到tomcat等服务器上才能运行。
完成了后端的基础功能，包括：
- SSM的环境搭建和使用，分层编程的练习，分层单元测试的练习。
  + 后台部分：
    - ueditor编辑器的嵌入，图片文件上传等功能的配置，图片暂时直接保存在web服务器上。
    - 文章的按类型、状态、年月查询与管理。
    - 文章的新增、修改、删除等功能，对文章类型、标签、创建时间、内容等进行编辑，存草稿等功能。
    - 文章类型的管理，增改删查。
    - 后台登录功能，验证码功能
    - 发送邮件功能
  + 前台部分：
    - 文章分页展示
    - 点击率统计，点赞
    - 文章按时间归档
    - 留言功能（邮件）

### 预期的改进：
- 目前的前端水平较低。页面使用jsp+jstl做了最原始的内容展现。考虑使用基于bootstrp的前端模板做前台和后台的页面。可借助于github pages，建一个新的仓库。
- 博客功能的扩展：
  + 引入markdown编辑器
  + 用户验证的加密
  + 微信接口开发
  + 实验室栏目
   。。。
- 项目部署的改进：
  + 使用其它的web服务器部署项目
  + 使用maven做项目管理
  + 项目的上线

## 2016.07.22
这次上传做了比较大的修改
- 网站上线了，可以访问这个网址查看[www.yuanbuzhou.com](www.yuanbuzhou.com)
- 翻新了前端页面部分，基于bootstrap+jquery，响应式布局
- 扩充、完善了各个模块的功能：
- 首页对接了邮件发送的功能
- 文章模块：前台展示与归档，点赞；后台ueditor编辑器，分类查询与管理，草稿功能，点击量统计
- 聊天室模块：基于javaWeb组件的聊天室。在session中维护聊天用户列表，使用浏览器端轮询的方式实现内容的刷新。用于练习，实际使用中有很多更好的方案。后台有对应的聊天信息修改和聊天记录备份的功能。
- 实验室模块：做Web实验用，目前有音乐可视化和全屏滚动两个实验
- 个人页和问卷，后台有对应的管理功能
- 使用Maven做项目管理，使用Nginx+tomcat部署，阿里云CentOS环境
### 存在的问题：
- 前端有浏览器兼容性问题：首页的背景图在IE浏览器中有样式问题
- 文章图片存储问题：想借助七牛云，没来得及实现，目前直接存储在服务端。有时直接在本地更新文章，要同步图片
### 预期的改进：
- 可以尝试使用Restful风格
- 实验室栏目可以做WebService的实验，可以做Red5流媒体服务器的实验
- 聊天室的技术可以改进
- 相册模块还没有做好
- 分页实现上可以试一试新的技术
- 前端页面还有许多可以改进和优化的地方
- 可以试用缓存技术和其它提高并发性、可用性的方案
其它边想边做
### 下面是网站的截图：
首页
![home](http://o8r9omg0x.bkt.clouddn.com/img/try_github/try_mywebsite_pages/home_sm.jpg)
博客
![home](http://o8r9omg0x.bkt.clouddn.com/img/try_github/mywebsite/blog_sm.jpg)
实验室
![home](http://o8r9omg0x.bkt.clouddn.com/img/try_github/mywebsite/laboratory_sm.jpg)
聊天室
![home](http://o8r9omg0x.bkt.clouddn.com/img/try_github/mywebsite/chatroom_sm.jpg)
后台管理页面1
![home](http://o8r9omg0x.bkt.clouddn.com/img/try_github/mywebsite/manage_article_sm.jpg)
后台管理页面2
![home](http://o8r9omg0x.bkt.clouddn.com/img/try_github/mywebsite/newArticle_sm.jpg)