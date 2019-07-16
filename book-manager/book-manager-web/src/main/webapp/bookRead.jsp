<%--
  Created by IntelliJ IDEA.
  User: Wolf
  Date: 2019/7/12
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@ page import="com.book.read.IBookReadService" %>
<%@ page import="com.book.read.impl.BookReadServiceImpl" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8" />
    <title>文章详情</title>
    <meta name="keywords" content="DeathGhost" />
    <meta name="description" content="DeathGhost" />
    <meta name="author" content="DeathGhost,deathghost@deathghost.cn">
    <link rel="icon" href="images/icon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script src="js/html5.js"></script>
    <script src="js/jquery.js"></script>
<%--    <script type="text/javascript" language="JavaScript">--%>
<%--        function readFile(filename){--%>
<%--            var fso = new ActiveXObject("Scripting.FileSystemObject");--%>
<%--            var f = fso.OpenTextFile(filename,1);--%>
<%--            var s = "";--%>
<%--            while (!f.AtEndOfStream)--%>
<%--                s += f.ReadLine()+"/n";--%>
<%--            f.Close();--%>
<%--            return s;--%>
<%--        }--%>
<%--    </script>--%>
</head>
<body>
<!--header-->
<header>
    <!--topNavBg-->
    <div class="topNavBg">
        <div class="wrap">
            <!--topLeftNav-->
            <ul class="topLtNav">
                <li><a href="login.html" class="obviousText">亲，请登录</a></li>
                <li><a href="register.html">注册</a></li>
            </ul>
            <!--topRightNav-->
            <ul class="topRtNav">
                <li><a href="user.html">个人中心</a></li>
                <li><a href="favorite.html" class="favorIcon">收藏夹</a></li>
                <li><a href="article_read.html" class="srvIcon">客户服务</a></li>
            </ul>
        </div>
    </div>
    <!--logoArea-->
    <div class="wrap logoSearch">
        <!--logo-->
        <div class="logo">
            <h1><img src="images/logo.png" /></h1>
        </div>
        <!--search-->
        <div class="search">
            <ul class="switchNav">
                <li class="active" id="chanpin">小说</li>
                <li id="shangjia">作者</li>
            </ul>
            <div class="searchBox">
                <form>
                    <div class="inputWrap">
                        <input type="text" placeholder="输入小说关键词" />
                    </div>
                    <div class="btnWrap">
                        <input type="submit" value="搜索" />
                    </div>
                </form>
                <!-- <a href="#" class="advancedSearch">高级搜索</a> -->
            </div>
        </div>
    </div>
    <!--nav-->
    <nav>
        <ul class="wrap navList">
            <li class="category">
                <a>全部小说分类</a>
                <dl class="asideNav indexAsideNav">
                    <!-- <dt><a href="product_list.html">分类</a></dt> -->
                    <dd>
                        <a href="type.html"><span><i>玄幻</i></span></a>
                    </dd>
                    <dd>
                        <a href="type.html"><span><i>武侠</i></span></a>
                    </dd>
                    <dd>
                        <a href="type.html"><span><i>都市</i></span></a>
                    </dd>
                    <dd>
                        <a href="type.html"><span><i>军事</i></span></a>
                    </dd>
                    <dd>
                        <a href="type.html"><span><i>历史</i></span></a>
                    </dd>
                    <dd>
                        <a href="type.html"><span><i>游戏</i></span></a>
                    </dd>
                    <dd>
                        <a href="type.html"><span><i>悬疑</i></span></a>
                    </dd>
                    <dd>
                        <a href="type.html"><span><i>科幻</i></span></a>
                    </dd>
                    <dd>
                        <a href="type.html"><span><i>言情</i></span></a>
                    </dd>
                    <dd>
                        <a href="type.html"><span><i>青春</i></span></a>
                    </dd>
                </dl>

            </li>
            <li><a href="index.html" class="active">首页</a></li>
            <li><a href="ranking_list.html">排行</a></li>
            <li><a href="product_list.html">完本</a></li>
            <li><a href="product_list.html">书库</a></li>
        </ul>
    </nav>
</header>
<script>
    $(document).ready(function() {
        //测试效果，程序对接如需变动重新编辑
        $(".switchNav li").click(function() {
            $(this).addClass("active").siblings().removeClass("active");
        });
        $("#chanpin").click(function() {
            $(".inputWrap input[type='text']").attr("placeholder", "输入小说关键词");
        });
        $("#shangjia").click(function() {
            $(".inputWrap input[type='text']").attr("placeholder", "输入作者姓名");
        });
    });
    $(document).ready(function() {
        $("nav .indexAsideNav").hide();
        $("nav .category").mouseover(function() {
            $(".asideNav").slideDown();
        });
        $("nav .asideNav").mouseleave(function() {
            $(".asideNav").slideUp();
        });
    });
    $(document).ready(function() {
        //焦点图
        var mySwiper = new Swiper('#slide', {
            autoplay: 5000,
            visibilityFullFit: true,
            loop: true,
            pagination: '.pagination',
        });
    })
</script>
<%--小说初始化--%>
<%--<%--%>
<%--    IBookReadService bookReadService = new BookReadServiceImpl();--%>
<%--    String path = bookReadService.readTargetBook(1,1);--%>

<%--%>--%>
<!--导航指向-->
<aside class="wrap insideLink">
    <a href="index.html">首页</a>
    <a href="article_list.html">爱情动物</a>
</aside>
<section class="wrap atc_list">
    <div class="atc_rd">
        <h2 class="atc_ttl">爱情动物（代序）</h2>
        <p class="otherInfor">
            <span>作者：DeathGhost</span>
            <time>2019-01-02 09:43</time>
        </p>

        <span class="atc_cha">
<a href="/read.do?_method=last&bookId=<c:out value="${requestScope.bookId}"></c:out>&chapterId=<c:out value="${requestScope.chapterId}"></c:out>">上一章</a>
					←<a href="/read.do?_method=dir">章节目录</a>→
					<a href="/read.do?_method=next&bookId=<c:out value="${requestScope.bookId}"></c:out>&chapterId=<c:out value="${requestScope.chapterId}"></c:out>">下一章</a>
				</span>
        <hr >
        <!--				<div class="atc_cont">-->
        <div class = "atc_cont">
            <%
                String path = (String) request.getAttribute("path");
                if(path!=null){


                //            String path ="D:\Work\HBuilderX\HBuilderXWorkSpace\BookWeb";   // 这边文件目录需改成相对路径
                File file = new File(path);
//                File file = new File("D:\\Download\\万古天帝\\0001.txt");
                FileReader fr = new FileReader(file);  //字符输入流
                BufferedReader br = new BufferedReader(fr);  //使文件可按行读取并具有缓冲功能
//                StringBuffer strB = new StringBuffer();   //strB用来存储jsp.txt文件里的内容
                String str = br.readLine();
                while(str!=null){
                    %>
                <%=str%><br>
            <%
//                    strB.append(str).append("<br>");   //将读取的内容放入strB
                    str = br.readLine();
                }
                br.close();    //关闭输入流
                }
            %>

<%--            <%=strB %>--%>
        </div>


        <span class="atc_cha">
					<a href="/read.do?_method=last&bookId=<c:out value="${requestScope.bookId}"></c:out>&chapterId=<c:out value="${requestScope.chapterId}"></c:out>">上一章</a>
					←<a href="/read.do?_method=dir">章节目录</a>→
					<a href="/read.do?_method=next&bookId=<c:out value="${requestScope.bookId}"></c:out>&chapterId=<c:out value="${requestScope.chapterId}"></c:out>">下一章</a>
				</span>

    </div>
</section>
<!--footer-->
<footer>
    <!--help-->
    <ul class="wrap help">
        <li>
            <dl>
                <dt>关于我们</dt>
                <dd><a href="article_read.html">小说小说</a></dd>
                <dd><a href="article_read.html">小说小说</a></dd>
                <dd><a href="article_read.html">小说小说</a></dd>
                <dd><a href="article_read.html">小说小说</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>关于我们</dt>
                <dd><a href="article_read.html">小说小说</a></dd>
                <dd><a href="article_read.html">小说小说</a></dd>
                <dd><a href="article_read.html">小说小说</a></dd>
                <dd><a href="article_read.html">小说小说</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>关于我们</dt>
                <dd><a href="article_read.html">小说小说</a></dd>
                <dd><a href="article_read.html">小说小说</a></dd>
                <dd><a href="article_read.html">小说小说</a></dd>
                <dd><a href="article_read.html">小说小说</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>关于我们</dt>
                <dd><a href="article_read.html">小说小说</a></dd>
                <dd><a href="article_read.html">小说小说</a></dd>
                <dd><a href="article_read.html">小说小说</a></dd>
                <dd><a href="article_read.html">小说小说</a></dd>
            </dl>
        </li>
    </ul>
    <dl class="wrap otherLink">
        <dt>友情链接</dt>

        <dd><a href="#">小说小说小说小说小说小说</a></dd>
        <dd><a href="#">小说小说小说小说小说小说</a></dd>
        <dd><a href="#">小说小说小说小说小说小说</a></dd>
        <dd><a href="#" target="_blank">小说小说</a></dd>
        <dd><a href="#" target="_blank">小说</a></dd>
        <dd><a href="#" target="_blank">小说小说</a></dd>
        <dd><a href="#" target="_blank">小说小说</a></dd>
        <dd><a href="#">小说小说小说小说</a></dd>
        <dd><a href="#">小说小说小说小说</a></dd>
        <dd><a href="#">小说小说小说小说</a></dd>

    </dl>
    <div class="wrap btmInfor">
        <p>© 2019 DeathGhost.cn 版权所有 网络文化经营许可证：晋网文[2019]***-02号 增值小说经营许可证：晋B2-200***24-1 信息网络传播阅读许可证：1109***4号</p>
        <address>联系地址：山西省太原市尖草坪区</address>
    </div>
</footer>
</body>
</html>
