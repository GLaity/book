<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/7/16
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>小说分类—类别</title>
    <meta name="keywords"  content="DeathGhost" />
    <meta name="description" content="DeathGhost" />
    <meta name="author" content="DeathGhost,deathghost@deathghost.cn">
    <link rel="icon" href="images/icon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="css/style.css" /><script src="js/html5.js"></script>
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
            //冒泡
            // $(".favorite_list li a").click(function(){
            //     alert("链接");
            //     window.location.href='product.jsp';
            // });
            $(".favorite_list li .shop_collect_goods").click(function(){
                alert("收藏小说");
                event.stopPropagation();
            });
        });
    </script>
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
                    <li><a href="/user?_method=quit" >退出登录</a></li>
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
                <form action="<c:url value="/list"/>" method="get">
                    <div class="inputWrap">
                        <input type="hidden" name="condition" value="search"/>
                        <input type="text" name="value" placeholder="输入小说关键词"/>
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
                    <!-- <dt><a href="channel.jsp">分类</a></dt> -->
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
    $(document).ready(function(){
        //测试效果，程序对接如需变动重新编辑
        $(".switchNav li").click(function(){
            $(this).addClass("active").siblings().removeClass("active");
        });
        $("#chanpin").click(function(){
            $(".inputWrap input[type='text']").attr("placeholder","输入小说关键词");
        });
        $("#shangjia").click(function(){
            $(".inputWrap input[type='text']").attr("placeholder","输入作者姓名");
        });
    });

</script>

<section class="wrap shop_header">

</section>
<section class="wrap shop_goods_li">
    <h2>${bookType.getType_Name()}小说</h2>
    <ul class="favorite_list">

        <c:forEach items="${bookBasicList}" var="bookBasic">
            <li>
                <a href="/book?bookId=${bookBasic.getBook_Id()}">
                    <img src="../../../../bookimg/${bookBasic.getBook_Id()}.jpg"/>
                    <h3>${bookBasic.getBook_Title()}</h3>
                    <p class="price"><span class="rmb_icon">${bookBasic.getBook_Price()}</span></p>
                    <p class="shop_collect_goods" title="收藏该小说"><span>&#115;</span></p>
                </a>
            </li>
        </c:forEach>
<%--    <%--%>

<%--    %>--%>
<%--        <c:forEach items="${pathList}" var="path">--%>
<%--            <li>--%>
<%--                <a>--%>
<%--                    <img src= "${path}/17.jpg"/>--%>

<%--&lt;%&ndash;                    <h3>${}</h3>&ndash;%&gt;--%>
<%--                    <p class="price"><span class="rmb_icon">298.00</span></p>--%>
<%--                    <p class="shop_collect_goods" title="收藏该小说"><span>&#115;</span></p>--%>
<%--                </a>--%>
<%--            </li>--%>
<%--        </c:forEach>--%>
    </ul>
    <!--分页-->
<%--    <div class="paging">--%>
<%--        <a>第一页</a>--%>
<%--        <a class="active">2</a>--%>
<%--        <a>3</a>--%>
<%--        <a>...</a>--%>
<%--        <a>89</a>--%>
<%--        <a>最后一页</a>--%>
<%--    </div>--%>
</section>
<!--footer-->
<footer>
    <!--help-->

    <dl class="wrap otherLink">

        <dd><a href="//www.qidian.com">起点中文网</a></dd>
        <dd><a href="//www.qdmm.com" target="_blank">起点女生网</a></dd>
        <dd><a href="http://chuangshi.qq.com" target="_blank">创世中文网</a></dd>
        <dd><a href="http://yunqi.qq.com" target="_blank">云起书院</a></dd>
        <dd><a href="//www.hongxiu.com" target="_blank">红袖添香</a></dd>
        <dd><a href="//www.readnovel.com" target="_blank">小说阅读网</a></dd>
        <dd><a href="//www.xs8.cn" target="_blank">言情小说吧</a></dd>
        <dd><a href="http://www.xxsy.net" target="_blank">潇湘书院</a></dd>
        <dd><a href="http://www.lrts.me" target="_blank">懒人听书</a></dd>
        <dd><a href="http://yuedu.yuewen.com" target="_blank">阅文悦读</a></dd>
        <dd><a href="//www.yuewen.com/app.html#appqq" target="_blank">QQ阅读</a></dd>
        <dd><a href="//www.yuewen.com/app.html#appqd" target="_blank">起点读书</a></dd>
        <dd><a href="//www.yuewen.com/app.html#appzj" target="_blank">作家助手</a></dd>
        <dd><a href="//www.webnovel.com" target="_blank" title="Qidian International">起点国际版</a></dd>
        <dd><a href="http://www.tingbook.com" target="_blank">天方听书网</a></dd>
    </dl>
    <ul class="wrap help" style="margin-left:35%;">
        <li>
            <a href="#" target="_blank">关于我们</a>
        </li>
        <li>
            <a href="#" target="_blank">联系我们</a>
        </li>
        <li>
            <a href="#" target="_blank">加入我们</a>
        </li>
        <li>
            <a href="#" target="_blank">联系客服</a>
        </li>

    </ul>
    <div class="wrap btmInfor">
        <p>本站所收录的作品、社区话题、用户评论、用户上传内容或图片等均属用户个人行为。如前述内容侵害您的权益，欢迎举报投诉，一经核实，立即删除，本站不承担任何责任</p>
        <p>© 2019 DeathGhost.cn 版权所有 网络文化经营许可证：晋网文[2019]***-02号 增值小说经营许可证：晋B2-200***24-1 信息网络传播阅读许可证：1109***4号</p>
        <p>请所有作者发布作品时务必遵守国家互联网信息管理办法规定，我们拒绝任何色情小说，一经发现，即作删除！举报电话：010-59357051</p>
        <address>联系地址：山西省太原市尖草坪区</address>
    </div>
</footer>
</body>
</html>
