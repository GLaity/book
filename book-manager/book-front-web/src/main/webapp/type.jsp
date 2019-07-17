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
            <ul class="topLtNav">
                <li><a href="login.jsp" class="obviousText">亲，请登录</a></li>
                <li><a href="register.jsp">注册</a></li>
            </ul>
            <!--topRightNav-->
            <ul class="topRtNav">
                <li><a href="user.jsp">个人中心</a></li>
                <li><a href="favorite.jsp" class="favorIcon">收藏夹</a></li>
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
                    <!-- <dt><a href="channel.jsp">分类</a></dt> -->
                    <dd>
                        <a href="type.jsp"><span><i>玄幻</i></span></a>
                    </dd>
                    <dd>
                        <a href="type.jsp"><span><i>武侠</i></span></a>
                    </dd>
                    <dd>
                        <a href="type.jsp"><span><i>都市</i></span></a>
                    </dd>
                    <dd>
                        <a href="type.jsp"><span><i>军事</i></span></a>
                    </dd>
                    <dd>
                        <a href="type.jsp"><span><i>历史</i></span></a>
                    </dd>
                    <dd>
                        <a href="type.jsp"><span><i>游戏</i></span></a>
                    </dd>
                    <dd>
                        <a href="type.jsp"><span><i>悬疑</i></span></a>
                    </dd>
                    <dd>
                        <a href="type.jsp"><span><i>科幻</i></span></a>
                    </dd>
                    <dd>
                        <a href="type.jsp"><span><i>言情</i></span></a>
                    </dd>
                    <dd>
                        <a href="type.jsp"><span><i>青春</i></span></a>
                    </dd>
                </dl>

            </li>
            <li><a href="/" class="active">首页</a></li>
            <li><a href="ranking_list.jsp">排行</a></li>
            <li><a href="bookList.jsp">完本</a></li>
            <li><a href="bookList.jsp">书库</a></li>
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
                    <img src="bookimg/${bookBasic.getBook_Id()}.jpg"/>
                    <h3>${bookBasic.getBook_Title()}</h3>
                    <p class="price"><span class="rmb_icon">298.00</span></p>
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
    <div class="paging">
        <a>第一页</a>
        <a class="active">2</a>
        <a>3</a>
        <a>...</a>
        <a>89</a>
        <a>最后一页</a>
    </div>
</section>
<!--footer-->
<footer>
    <!--help-->
    <ul class="wrap help">
        <li>
            <dl>
                <dt>消费者保障</dt>
                <dd><a href="#">保障范围</a></dd>
                <dd><a href="#">退换货流程</a></dd>
                <dd><a href="#">服务中心</a></dd>
                <dd><a href="#">更多服务特色</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>新手上路</dt>
                <dd><a href="#">保障范围</a></dd>
                <dd><a href="#">退换货流程</a></dd>
                <dd><a href="#">服务中心</a></dd>
                <dd><a href="#">更多服务特色</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>付款方式</dt>
                <dd><a href="#">保障范围</a></dd>
                <dd><a href="#">退换货流程</a></dd>
                <dd><a href="#">服务中心</a></dd>
                <dd><a href="#">更多服务特色</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>服务保障</dt>
                <dd><a href="#">保障范围</a></dd>
                <dd><a href="#">退换货流程</a></dd>
                <dd><a href="#">服务中心</a></dd>
                <dd><a href="#">更多服务特色</a></dd>
            </dl>
        </li>
    </ul>
    <dl class="wrap otherLink">
        <dt>友情链接</dt>
        <dd><a href="http://www.17sucai.com" target="_blank">17素材</a></dd>
        <dd><a href="http://www.17sucai.com/pins/24448.html">HTML5模块化后台管理模板</a></dd>
        <dd><a href="http://www.17sucai.com/pins/15966.html">绿色清爽后台管理系统模板</a></dd>
        <dd><a href="http://www.17sucai.com/pins/14931.html">黑色的cms商城网站后台管理模板</a></dd>
        <dd><a href="http://www.deathghost.cn" target="_blank">前端博客</a></dd>
        <dd><a href="http://www.deathghost.cn" target="_blank">博客</a></dd>
        <dd><a href="http://www.deathghost.cn" target="_blank">新码笔记</a></dd>
        <dd><a href="http://www.deathghost.cn" target="_blank">DethGhost</a></dd>
        <dd><a href="#">当当</a></dd>
        <dd><a href="#">优酷</a></dd>
        <dd><a href="#">土豆</a></dd>
        <dd><a href="#">新浪</a></dd>
        <dd><a href="#">钉钉</a></dd>
        <dd><a href="#">支付宝</a></dd>
    </dl>
    <div class="wrap btmInfor">
        <p>© 2013 DeathGhost.cn 版权所有 网络文化经营许可证：浙网文[2013]***-027号 增值电信业务经营许可证：浙B2-200***24-1 信息网络传播视听节目许可证：1109***4号</p>
        <address>联系地址：陕西省西安市雁塔区XXX号</address>
    </div>
</footer>
</body>
</html>
