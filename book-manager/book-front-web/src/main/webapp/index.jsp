<%@ page import="java.util.List" %>
<%@ page import="com.book.pojo.Book_Type" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/7/12
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>首页</title>
    <meta name="keywords"  content="DeathGhost" />
    <meta name="description" content="DeathGhost" />
    <meta name="author" content="DeathGhost,deathghost@deathghost.cn">
    <link rel="icon" href="${pageContext.request.contextPath }/images/icon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css" /><script src="js/html5.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/js/swiper.min.js"></script>
    <script>
        $(document).ready(function(){
            //焦点图
            var mySwiper = new Swiper('#slide',{
                autoplay:5000,
                visibilityFullFit : true,
                loop:true,
                pagination : '.pagination',
            });
        })
    </script>
</head>
<body>
<!--advertisment<div class="wrap"><img src="upload/banner.jpg"/></div>-->
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
                    <li><a href="#" class="obviousText">您好！<c:out value="${sessionScope.user.getUser_Username()}"></c:out></a></li>
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
                    <c:forEach items="${book_typeList}" var="book_type">
                        <dd><a href="/booktype?_method=type&typeId=${book_type.getType_Id()}"><span><i>${book_type.getType_Name()}</i></span></a></dd>
                    </c:forEach>
                </dl>
                <dl class="asideNav2">
                    <img src="upload/ad002.jpg" />
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
$()
</script>

<!--advertisment area-->
<section class="wrap">
    <!--ctCont-->
    <div class="IdxmainArea">
        <!--slide-->
        <div id="slide">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <a href="bookDetails.jsp">
                        <img src="upload/slide01.jpg"/>
                    </a>
                </div>
                <div class="swiper-slide">
                    <a href="bookDetails.jsp">
                        <img src="upload/slide02.jpg"/>
                    </a>
                </div>
                <div class="swiper-slide">
                    <a href="bookDetails.jsp">
                        <img src="upload/slide03.jpg"/>
                    </a>
                </div>
            </div>
            <div class="pagination"></div>
        </div>
        <!--singleAd-->
        <div class="singleAd">
            <a href="bookDetails.jsp">
                <img src="upload/sigleAd.jpg"/>
            </a>
        </div>
        <!--bestShop-->
        <dl class="bestShop">
            <dt>
                <strong>优秀小说推荐</strong>
                <a href="bookList.jsp" class="fr">更多</a>
            </dt>
            <dd>
                <a href="bookDetails.jsp">
                    <img src="upload/001.jpg"/>
                    <h2>精品小说</h2>
                </a>
            </dd>
            <dd>
                <a href="bookDetails.jsp">
                    <img src="upload/002.jpg"/>
                    <h2>精品小说</h2>
                </a>
            </dd>
            <dd>
                <a href="bookDetails.jsp">
                    <img src="upload/003.jpg"/>
                    <h2>精品小说</h2>
                </a>
            </dd>
            <dd>
                <a href="bookDetails.jsp">
                    <img src="upload/004.jpg"/>
                    <h2>精品小说</h2>
                </a>
            </dd>
            <dd>
                <a href="bookDetails.jsp">
                    <img src="upload/005.jpg"/>
                    <h2>精品小说</h2>
                </a>
            </dd>
            <dd>
                <a href="bookDetails.jsp">
                    <img src="upload/006.jpg"/>
                    <h2>精品小说</h2>
                </a>
            </dd>
            <dd>
                <a href="bookDetails.jsp">
                    <img src="upload/007.jpg"/>
                    <h2>精品小说</h2>
                </a>
            </dd>
            <dd>
                <a href="bookDetails.jsp">
                    <img src="upload/008.jpg"/>
                    <h2>精品小说</h2>
                </a>
            </dd>
        </dl>
    </div>
    <!--asdCont-->
    <div class="IdxAsideRt">
        <!--login-->
        <div class="idxRtLogin">
            <c:if test="${empty(sessionScope.user)}">
            <div class="fstArea">
                <a href="#" class="userIcon">
                    <img src="images/icon/DefaultAvatar.jpg">
                </a>
                <div class="rtInfor">
                    <p>Hi!你好</p>
                    <p class="obviousText">小说</p>
                </div>
            </div>
                <div class="secArea">
                    <a href="login.jsp">登录</a>
                    <a href="register.jsp">免费注册</a>
                </div>
            </c:if>
            <c:if test="${!empty(sessionScope.user)}">
                <div class="fstArea">
                    <a href="#" class="userIcon">
                        <img src="images/icon/DefaultAvatar.jpg">
                    </a>
                    <div class="rtInfor">
                        <p>Hi!你好</p>
                        <p class="obviousText"><c:out value="${sessionScope.user.getUser_Username()}"></c:out></p>
                    </div>
                </div>
                <div class="secArea">
                    <a href="user.jsp">个人中心</a>
                </div>
            </c:if>
        </div>
        <dl class="idxRtAtc">
            <dt>
                <em class="obviousText">最新排行</em>
                <a href="ranking_list.jsp">more</a>
            </dt>
            <dd><a href="article_read.jsp">小说小说小说小说小说小说小说小说</a></dd>
            <dd><a href="article_read.jsp">小说小说小说小说小说小说小说小说</a></dd>
            <dd><a href="article_read.jsp">小说小说小说小说小说小说小说小说</a></dd>
            <dd><a href="article_read.jsp">小说小说小说小说小说小说小说小说</a></dd>
            <dd><a href="article_read.jsp">小说小说小说小说小说小说小说小说</a></dd>
            <dd><a href="article_read.jsp">小说小说小说小说小说小说小说小说</a></dd>
            <dd><a href="article_read.jsp">小说小说小说小说小说小说小说小说</a></dd>
            <dd><a href="article_read.jsp">小说小说小说小说小说小说小说小说</a></dd>
        </dl>

    </div>
</section>
<!--productList-->
<section class="wrap idxproLi">
    <h2>
        <strong>
            <a href="#">男生频道</a>
        </strong>
        <span class="classLi">
   <a href="type.jsp">悬疑</a>
   <a href="type.jsp">军事</a>
   <a href="type.jsp">科幻</a>
   <a href="type.jsp">玄幻</a>
   <a href="type.jsp">游戏</a>
  </span>
    </h2>
    <div class="ltArea">
        <!--ad:category pic-->
        <a href="bookDetails.jsp"><img src="upload/bestCategoryPic01.jpg"/></a>
    </div>
    <div class="ctLi">
        <ul>
            <li>
                <a href="bookDetails.jsp">
                    <img src="upload/goods001.jpg"/>
                    <h3>小说</h3>
                    <p><span>1000.00</span></p>
                </a>
            </li>
            <li>
                <a href="bookDetails.jsp">
                    <img src="upload/goods003.jpg"/>
                    <h3>小说</h3>
                    <p><span>545.00</span></p>
                </a>
            </li>
            <li>
                <a href="bookDetails.jsp">
                    <img src="upload/goods004.jpg"/>
                    <h3>小说</h3>
                    <p><span>1000.00</span></p>
                </a>
            </li>
            <li>
                <a href="bookDetails.jsp">
                    <img src="upload/goods003.jpg"/>
                    <h3>小说</h3>
                    <p><span>1000.00</span></p>
                </a>
            </li>
            <li>
                <a href="bookDetails.jsp">
                    <img src="upload/goods001.jpg"/>
                    <h3>小说</h3>
                    <p><span>980.00</span></p>
                </a>
            </li>
            <li>
                <a href="bookDetails.jsp">
                    <img src="upload/goods002.jpg"/>
                    <h3>小说</h3>
                    <p><span>642.00</span></p>
                </a>
            </li>
            <li>
                <a href="bookDetails.jsp">
                    <img src="upload/goods004.jpg"/>
                    <h3>小说</h3>
                    <p><span>793.00</span></p>
                </a>
            </li>
            <li>
                <a href="bookDetails.jsp">
                    <img src="upload/goods001.jpg"/>
                    <h3>小说</h3>
                    <p><span>755.00</span></p>
                </a>
            </li>
            <li>
                <a href="bookDetails.jsp">
                    <img src="upload/goods002.jpg"/>
                    <h3>小说</h3>
                    <p><span>360.00</span></p>
                </a>
            </li>
            <li>
                <a href="bookDetails.jsp">
                    <img src="upload/goods003.jpg"/>
                    <h3>小说</h3>
                    <p><span>1255.00</span></p>
                </a>
            </li>
        </ul>
        <!--bestBrand-->
        <div class="idxBrandLi">
            <a href="bookDetails.jsp"><img src="upload/brandLogo01.jpg"/></a>
            <a href="bookDetails.jsp"><img src="upload/brandLogo02.jpg"/></a>
            <a href="bookDetails.jsp"><img src="upload/brandLogo03.jpg"/></a>
            <a href="bookDetails.jsp"><img src="upload/brandLogo04.jpg"/></a>
        </div>
    </div>
</section>

<section class="wrap idxproLi">
    <h2>
        <strong>
            <a href="#">女生频道</a>
        </strong>
        <span class="classLi">
   <a href="type.jsp">言情</a>
   <a href="type.jsp">青春</a>
   <a href="type.jsp">都市</a>
  </span>
    </h2>
    <div class="ltArea">
        <!--ad:category pic-->
        <a href="bookDetails.jsp"><img src="upload/bestCategoryPic02.jpg"/></a>
    </div>
    <div class="ctLi">
        <ul>
            <li>
                <a href="bookDetails.jsp">
                    <img src="upload/goods005.jpg"/>
                    <h3>小说</h3>
                    <p><span>1000.00</span></p>
                </a>
            </li>
            <li>
                <a href="bookDetails.jsp">
                    <img src="upload/goods006.jpg"/>
                    <h3>小说</h3>
                    <p><span>545.00</span></p>
                </a>
            </li>
            <li>
                <a href="bookDetails.jsp">
                    <img src="upload/goods007.jpg"/>
                    <h3>小说</h3>
                    <p><span>1000.00</span></p>
                </a>
            </li>
            <li>
                <a href="bookDetails.jsp">
                    <img src="upload/goods008.jpg"/>
                    <h3>小说</h3>
                    <p><span>1000.00</span></p>
                </a>
            </li>
            <li>
                <a href="bookDetails.jsp">
                    <img src="upload/goods009.jpg"/>
                    <h3>小说</h3>
                    <p><span>980.00</span></p>
                </a>
            </li>
            <li>
                <a href="bookDetails.jsp">
                    <img src="upload/goods010.jpg"/>
                    <h3>小说</h3>
                    <p><span>642.00</span></p>
                </a>
            </li>
            <li>
                <a href="bookDetails.jsp">
                    <img src="upload/goods005.jpg"/>
                    <h3>小说</h3>
                    <p><span>793.00</span></p>
                </a>
            </li>
            <li>
                <a href="bookDetails.jsp">
                    <img src="upload/goods006.jpg"/>
                    <h3>小说</h3>
                    <p><span>755.00</span></p>
                </a>
            </li>
            <li>
                <a href="bookDetails.jsp">
                    <img src="upload/goods007.jpg"/>
                    <h3>小说</h3>
                    <p><span>360.00</span></p>
                </a>
            </li>
            <li>
                <a href="bookDetails.jsp">
                    <img src="upload/goods008.jpg"/>
                    <h3>小说</h3>
                    <p><span>1255.00</span></p>
                </a>
            </li>
        </ul>
        <!--bestBrand-->
        <div class="idxBrandLi">
            <a href="bookDetails.jsp"><img src="upload/brandLogo01.jpg"/></a>
            <a href="bookDetails.jsp"><img src="upload/brandLogo02.jpg"/></a>
            <a href="bookDetails.jsp"><img src="upload/brandLogo03.jpg"/></a>
            <a href="bookDetails.jsp"><img src="upload/brandLogo04.jpg"/></a>
        </div>
    </div>
</section>
<!--case-->
<section class="wrap idexCase">
    <h2>
        <strong>小说推荐</strong>
        <a href="bookDetails.jsp">more</a>
    </h2>
    <ul>
        <li>
            <a href="bookDetails.jsp">
                <img src="upload/case001.jpg"/>
                <h3>小说</h3>
            </a>
        </li>
        <li>
            <a href="bookDetails.jsp">
                <img src="upload/case002.jpg"/>
                <h3>小说</h3>
            </a>
        </li>
        <li>
            <a href="bookDetails.jsp">
                <img src="upload/case003.jpg"/>
                <h3>小说</h3>
            </a>
        </li>
        <li>
            <a href="bookDetails.jsp">
                <img src="upload/case004.jpg"/>
                <h3>小说</h3>
            </a>
        </li>
        <li>
            <a href="bookDetails.jsp">
                <img src="upload/case005.jpg"/>
                <h3>小说</h3>
            </a>
        </li>
    </ul>
</section>
<!--section:two->articleList-->
<!--footer-->
<footer>
    <!--help-->
    <ul class="wrap help">
        <li>
            <dl>
                <dt>关于我们</dt>
                <dd><a href="article_read.jsp">小说小说</a></dd>
                <dd><a href="article_read.jsp">小说小说</a></dd>
                <dd><a href="article_read.jsp">小说小说</a></dd>
                <dd><a href="article_read.jsp">小说小说</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>关于我们</dt>
                <dd><a href="article_read.jsp">小说小说</a></dd>
                <dd><a href="article_read.jsp">小说小说</a></dd>
                <dd><a href="article_read.jsp">小说小说</a></dd>
                <dd><a href="article_read.jsp">小说小说</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>关于我们</dt>
                <dd><a href="article_read.jsp">小说小说</a></dd>
                <dd><a href="article_read.jsp">小说小说</a></dd>
                <dd><a href="article_read.jsp">小说小说</a></dd>
                <dd><a href="article_read.jsp">小说小说</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>关于我们</dt>
                <dd><a href="article_read.jsp">小说小说</a></dd>
                <dd><a href="article_read.jsp">小说小说</a></dd>
                <dd><a href="article_read.jsp">小说小说</a></dd>
                <dd><a href="article_read.jsp">小说小说</a></dd>
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
