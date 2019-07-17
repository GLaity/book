<%--
  Created by IntelliJ IDEA.
  User: 郭文佐
  Date: 2019/7/17
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>排行榜</title>
    <meta name="keywords"  content="DeathGhost" />
    <meta name="description" content="DeathGhost" />
    <meta name="author" content="DeathGhost,deathghost@deathghost.cn">
    <link rel="icon" href="images/icon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="css/style.css" /><script src="js/html5.js"></script>
    <script src="js/html5.js"></script>
    <script src="js/jquery.js"></script>
    <script>
        $(document).ready(function(){
            $("nav .indexAsideNav").hide();
            $("nav .category").mouseover(function(){
                $(".asideNav").slideDown();
            });
            $("nav .asideNav").mouseleave(function(){
                $(".asideNav").slideUp();
            });
        });
    </script>
    <style  type="text/css">
        .atc_list dl{
            display: block;
            width: 27%;
            float: left;
            margin: 20px 20px;
        }
    </style>
</head>
<body>
<!--header-->
<header>
    <!--topNavBg-->
    <div class="topNavBg">
        <div class="wrap">
            <!--topLeftNav-->
            <c:if test="${empty(sessionScope.user)}">
                <ul class="topLtNav">
                    <li><a href="login.jsp" class="obviousText">亲，请登录</a></li>
                    <li><a href="register.jsp">注册</a></li>
                </ul>
            </c:if>
            <c:if test="${!empty(sessionScope.user)}">
                <ul class="topLtNav">
                    <li><a href="/personal" class="obviousText">您好！<c:out value="${sessionScope.user.getUser_Username()}"></c:out></a></li>
                </ul>
            </c:if>
            <!--topRightNav-->
            <ul class="topRtNav">
                <c:if test="${empty(sessionScope.user)}">
                    <li><a href="login.jsp">个人中心</a></li>
                    <li><a href="#" class="favorIcon">收藏夹</a></li>
                </c:if>
                <c:if test="${!empty(sessionScope.user)}">
                    <li><a href="/personal">个人中心</a></li>
                    <li><a href="#" class="favorIcon">收藏夹</a></li>
                </c:if>
                <li><a href="#" class="srvIcon">客户服务</a></li>
            </ul>
        </div>
    </div>
    <!--logoArea-->
    <div class="wrap logoSearch">
        <!--logo-->
        <div class="logo"><h1><img src="images/logo.png"/></h1></div>
        <!--search-->
        <div class="search">
            <ul class="switchNav">
                <li class="active" id="chanpin">小说</li>
                <li id="shangjia">作者</li>
            </ul>
            <div class="searchBox">
                <form>
                    <div class="inputWrap">
                        <input type="text" placeholder="输入小说关键词"/>
                    </div>
                    <div class="btnWrap">
                        <input type="submit" value="搜索"/>
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
                        <a href="/booktype?_method=type&typeId=1"><span><i>玄幻</i></span></a>
                    </dd>
                    <dd>
                        <a href="/booktype?_method=type&typeId=2"><span><i>武侠</i></span></a>
                    </dd>
                    <dd>
                        <a href="/booktype?_method=type&typeId=3"><span><i>都市</i></span></a>
                    </dd>
                    <dd>
                        <a href="/booktype?_method=type&typeId=4"><span><i>军事</i></span></a>
                    </dd>
                    <dd>
                        <a href="/booktype?_method=type&typeId=5"><span><i>历史</i></span></a>
                    </dd>
                    <dd>
                        <a href="/booktype?_method=type&typeId=6"><span><i>游戏</i></span></a>
                    </dd>
                    <dd>
                        <a href="/booktype?_method=type&typeId=7"><span><i>悬疑</i></span></a>
                    </dd>
                    <dd>
                        <a href="/booktype?_method=type&typeId=8"><span><i>科幻</i></span></a>
                    </dd>
                    <dd>
                        <a href="/booktype?_method=type&typeId=9"><span><i>言情</i></span></a>
                    </dd>
                    <dd>
                        <a href="/booktype?_method=type&typeId=10"><span><i>青春</i></span></a>
                    </dd>
                </dl>

            </li>
            <li><a href="/" class="active">首页</a></li>
            <li><a href="/ranking">排行</a></li>
            <li><a href="/list">完本</a></li>
            <li><a href="/list">书库</a></li>
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
</script>

<!--导航指向-->
<section class="wrap atc_list">
    <dl class="idxRtAtc">
        <dt>
            <em class="obviousText">访问量排行</em>
        </dt>
        <c:forEach items="${queueBookVisited}" var="bookBasic" varStatus="vs">
            <dd>
                <a href="/book?bookId=${bookBasic.getBook_Id()}">${bookBasic.getBook_Title()}</a>
                <span>${numVisited[vs.count-1]}</span>
            </dd>
        </c:forEach>
    </dl>
    <dl class="idxRtAtc">
        <dt>
            <em class="obviousText">收藏量排行</em>
        </dt>
        <c:forEach items="${queueBookCollected}" var="bookBasic" varStatus="vs">
            <dd>
                <a href="/book?bookId=${bookBasic.getBook_Id()}">${bookBasic.getBook_Title()}</a>
                <span>${numCollected[vs.count-1]}</span>
            </dd>

        </c:forEach>
    </dl>
    <dl class="idxRtAtc">
        <dt>
            <em class="obviousText">购买量排行</em>
        </dt>
        <c:forEach items="${queueBookBought}" var="bookBasic" varStatus="vs">
            <dd>
                <a href="/book?bookId=${bookBasic.getBook_Id()}">${bookBasic.getBook_Title()}</a>
                <span>${numBought[vs.count-1]}</span>
            </dd>
        </c:forEach>
    </dl>
</section>
<!--footer-->
<footer>
    <!--help-->
    <ul class="wrap help">
        <li>
            <dl>
                <dt>关于我们</dt>
                <dd><a href="#">小说小说</a></dd>
                <dd><a href="#">小说小说</a></dd>
                <dd><a href="#">小说小说</a></dd>
                <dd><a href="#">小说小说</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>关于我们</dt>
                <dd><a href="#">小说小说</a></dd>
                <dd><a href="#">小说小说</a></dd>
                <dd><a href="#">小说小说</a></dd>
                <dd><a href="#">小说小说</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>关于我们</dt>
                <dd><a href="#">小说小说</a></dd>
                <dd><a href="#">小说小说</a></dd>
                <dd><a href="#">小说小说</a></dd>
                <dd><a href="#">小说小说</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>关于我们</dt>
                <dd><a href="#">小说小说</a></dd>
                <dd><a href="#">小说小说</a></dd>
                <dd><a href="#">小说小说</a></dd>
                <dd><a href="#">小说小说</a></dd>
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

