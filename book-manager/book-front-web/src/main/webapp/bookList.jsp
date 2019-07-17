<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/7/16
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>分类列表</title>
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
            //     window.location.href='bookDetails.jsp';
            // });
            $(".favorite_list li .shop_collect_goods").click(function(){
                alert("收藏产品");
                r
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
                    <!-- <dt><a href="bookList.jsp">分类</a></dt> -->
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

    document.oncontextmenu=new Function("event.returnValue=false;");
    document.onselectstart=new Function("event.returnValue=false;");
</script>

<section class="wrap list_class_page">
    <div class="lt_area">
        <div class="attr_filter">
            <h2>分类</h2>
            <ul>
                <li>
                    <dl>
                        <dt>分类：</dt>
                        <dd>
                            <a href="<c:url value="/list?condition=type&value=1"/>">玄幻</a>
                            <a href="<c:url value="/list?condition=type&value=2"/>">武侠</a>
                            <a href="<c:url value="/list?condition=type&value=3"/>">都市</a>
                            <a href="<c:url value="/list?condition=type&value=4"/>">军事</a>
                            <a href="<c:url value="/list?condition=type&value=5"/>">历史</a>
                            <a href="<c:url value="/list?condition=type&value=6"/>">游戏</a>
                            <a href="<c:url value="/list?condition=type&value=7"/>">悬疑</a>
                            <a href="<c:url value="/list?condition=type&value=8"/>">科幻</a>
                            <a href="<c:url value="/list?condition=type&value=9"/>">言情</a>
                            <a href="<c:url value="/list?condition=type&value=10"/>">青春</a>
                        </dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>按收藏量筛选：</dt>
                        <dd>
                            <a>A</a>
                            <a>B</a>
                            <a>C</a>
                            <a>D</a>
                            <a>E</a>
                            <a>F</a>
                            <a>G</a>
                            <a>H</a>
                            <a>I</a>
                            <a>J</a>
                        </dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>按出版时间筛选：</dt>
                        <dd>
                            <a>今天</a>
                            <a>昨天</a>
                            <a>本周</a>
                            <a>本月</a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>
        <!--产品列表-->
        <section class="shop_goods_li">
            <h2>小说:
                <c:if test="${!empty(bookType)}">
                    ${bookType.getType_Name()}
                </c:if>
                <c:if test="${!empty(keyName)}">
                    ${keyName}
                </c:if>
            </h2>
            <ul class="favorite_list">
                <c:forEach items="${bookBasicList}" var="bookBasic">
                    <li>
                        <a href="/book?bookId=${bookBasic.getBook_Id()}">
                            <img src="bookimg/${bookBasic.getBook_Id()}.jpg"/>
                            <h3>${bookBasic.getBook_Title()}</h3>
                            <p class="price"><span class="rmb_icon">298.00</span></p>
                            <p class="shop_collect_goods" title="收藏该产品"><span>&#115;</span></p>
                        </a>
                    </li>
                </c:forEach>
            </ul>
            <!--分页-->
<%--            <div class="paging">--%>
<%--                <a>第一页</a>--%>
<%--                <a class="active">2</a>--%>
<%--                <a>3</a>--%>
<%--                <a>...</a>--%>
<%--                <a>89</a>--%>
<%--                <a>最后一页</a>--%>
<%--            </div>--%>
        </section>

    </div>
    <aside class="rtWrap">
        <dl class="rtLiTwoCol">
            <dt>热门推荐</dt>
            <dd>
                <a href="/book?bookId=1">
                    <img src="bookimg/1.jpg"/>
                </a>
            </dd>
            <dd>
                <a href="/book?bookId=2">
                    <img src="bookimg/2.jpg"/>
                </a>
            </dd>
            <dd>
                <a href="/book?bookId=3">
                    <img src="bookimg/3.jpg"/>
                </a>
            </dd>
            <dd>
                <a href="/book?bookId=4">
                    <img src="bookimg/4.jpg"/>
                </a>
            </dd>
            <dd>
                <a href="/book?bookId=5">
                    <img src="bookimg/5.jpg"/>
                </a>
            </dd>
            <dd>
                <a href="/book?bookId=6">
                    <img src="bookimg/6.jpg"/>
                </a>
            </dd>
            <dd>
                <a href="/book?bookId=7">
                    <img src="bookimg/7.jpg"/>
                </a>
            </dd>
            <dd>
                <a href="/book?bookId=8">
                    <img src="bookimg/8.jpg"/>
                </a>
            </dd>
            <dd>
                <a href="/book?bookId=9">
                    <img src="bookimg/9.jpg"/>
                </a>
            </dd>
            <dd>
                <a href="/book?bookId=10">
                    <img src="bookimg/10.jpg"/>
                </a>
            </dd>
            <dd>
                <a href="/book?bookId=11">
                    <img src="bookimg/11.jpg"/>
                </a>
            </dd>
            <dd>
                <a href="/book?bookId=12">
                    <img src="bookimg/12.jpg"/>
                </a>
            </dd>
        </dl>
    </aside>
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
