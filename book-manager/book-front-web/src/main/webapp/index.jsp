<%--
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
                    <c:forEach items="${book_typeList}" var="book_type">
                        <dd><a href="/booktype?_method=type&typeId=${book_type.getType_Id()}"><span><i>${book_type.getType_Name()}</i></span></a></dd>
                    </c:forEach>
                </dl>
                <dl class="asideNav2">
                    <a href="/book?bookId=3"  style="padding: 0px"><img src="../../../../bookimg/3.jpg" /></a>
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
                    <a href="/book?bookId=23">
                        <img src="upload/slide01.jpg"/>
                    </a>
                </div>
                <div class="swiper-slide">
                    <a href="/book?bookId=25">
                        <img src="upload/slide02.jpg"/>
                    </a>
                </div>
                <div class="swiper-slide">
                    <a href="/book?bookId=24">
                        <img src="upload/slide03.jpg"/>
                    </a>
                </div>
            </div>
            <div class="pagination"></div>
        </div>
        <!--singleAd-->
        <div class="singleAd">
            <a href="/book?bookId=1">
                <img src="../../../../bookimg/1.jpg"/>
            </a>
        </div>
        <!--bestShop-->
        <dl class="bestShop">
            <dt>
                <strong>优秀小说推荐</strong>
<%--                <a href="#" class="fr">更多</a>--%>
            </dt>
            <dd>
                <a href="/book?bookId=2">
                    <img src="../../../../bookimg/2.jpg"/>
                    <h2>斗罗重生</h2>
                </a>
            </dd>
            <dd>
                <a href="/book?bookId=4">
                    <img src="../../../../bookimg/4.jpg"/>
                    <h2>九极剑神</h2>
                </a>
            </dd>
            <dd>
                <a href="/book?bookId=5">
                    <img src="../../../../bookimg/5.jpg"/>
                    <h2>罗浮</h2>
                </a>
            </dd>
            <dd>
                <a href="/book?bookId=6">
                    <img src="../../../../bookimg/6.jpg"/>
                    <h2>网游之大盗贼</h2>
                </a>
            </dd>
            <dd>
                <a href="/book?bookId=7">
                    <img src="../../../../bookimg/7.jpg"/>
                    <h2>雷霆之主</h2>
                </a>
            </dd>
            <dd>
                <a href="/book?bookId=8">
                    <img src="../../../../bookimg/8.jpg"/>
                    <h2>武动之武祖再临</h2>
                </a>
            </dd>
            <dd>
                <a href="/book?bookId=9">
                    <img src="../../../../bookimg/9.jpg"/>
                    <h2>轮回开端</h2>
                </a>
            </dd>
            <dd>
                <a href="/book?bookId=10">
                    <img src="../../../../bookimg/10.jpg"/>
                    <h2>王牌强兵</h2>
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
                <a href="/ranking">more</a>
            </dt>
            <c:forEach items="${bookQuere}" var="book">
                <dd><a href="/book?bookId=${book.getBook_Id()}">${book.getBook_Title()}</a></dd>
            </c:forEach>
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
   <a href="/booktype?_method=type&typeId=7">悬疑</a>
   <a href="/booktype?_method=type&typeId=4">军事</a>
   <a href="/booktype?_method=type&typeId=8">科幻</a>
   <a href="/booktype?_method=type&typeId=1">玄幻</a>
   <a href="/booktype?_method=type&typeId=6">游戏</a>
  </span>
    </h2>
    <div class="ltArea">
        <!--ad:category pic-->
        <a href="/book?bookId=2"><img src="../../../../bookimg/2.jpg"/></a>
    </div>
    <div class="ctLi">
        <ul>
            <li>
                <a href="/book?bookId=8">
                    <img src="../../../../bookimg/8.jpg"/>
                    <h3>武动之武祖再临</h3>
                </a>
            </li>
            <li>
                <a href="/book?bookId=11">
                    <img src="../../../../bookimg/11.jpg"/>
                    <h3>懦弱的勇士</h3>
                </a>
            </li>
            <li>
                <a href="/book?bookId=13">
                    <img src="../../../../bookimg/13.jpg"/>
                    <h3>男主高攀不起，告辞</h3>
                </a>
            </li>
            <li>
                <a href="/book?bookId=14">
                    <img src="../../../../bookimg/14.jpg"/>
                    <h3>帝国的朝阳</h3>
                </a>
            </li>
            <li>
                <a href="/book?bookId=15">
                    <img src="../../../../bookimg/15.jpg"/>
                    <h3>民国大能</h3>
                </a>
            </li>
            <li>
                <a href="/book?bookId=16">
                    <img src="../../../../bookimg/16.jpg"/>
                    <h3>大清拆迁工</h3>
                </a>
            </li>
            <li>
                <a href="/book?bookId=17">
                    <img src="../../../../bookimg/17.jpg"/>
                <h3>我有一间扎纸店</h3>
            </a>
            </li>
            <li>
                <a href="/book?bookId=18">
                    <img src="../../../../bookimg/18.jpg"/>
                    <h3>痞子神探</h3>
                </a>
            </li>
            <li>
                <a href="/book?bookId=19">
                    <img src="../../../../bookimg/19.jpg"/>
                    <h3>惊天盗墓团</h3>
                </a>
            </li>
            <li>
                <a href="/book?bookId=20">
                    <img src="../../../../bookimg/20.jpg"/>
                    <h3>星际之全能炊事员</h3>
                </a>
            </li>
        </ul>
        <!--bestBrand-->
        <div class="idxBrandLi">
            <a href="#"><img src="upload/brandLogo01.jpg"/></a>
            <a href="#"><img src="upload/brandLogo02.jpg"/></a>
            <a href="#"><img src="upload/brandLogo03.jpg"/></a>
            <a href="#"><img src="upload/brandLogo04.jpg"/></a>
        </div>
    </div>
</section>

<section class="wrap idxproLi">
    <h2>
        <strong>
            <a href="#">女生频道</a>
        </strong>
        <span class="classLi">
   <a href="/booktype?_method=type&typeId=9">言情</a>
   <a href="/booktype?_method=type&typeId=10">青春</a>
   <a href="/booktype?_method=type&typeId=3">都市</a>
  </span>
    </h2>
    <div class="ltArea">
        <!--ad:category pic-->
        <a href="/book?bookId=2"><img src="../../../../bookimg/2.jpg"/></a>
    </div>
    <div class="ctLi">
        <ul>
            <li>
                <a href="/book?bookId=12">
                    <img src="../../../../bookimg/12.jpg"/>
                    <h3>豪门霸总的黑心前妻</h3>
                </a>
            </li>
            <li>
                <a href="/book?bookId=17">
                    <img src="../../../../bookimg/17.jpg"/>
                    <h3>我有一间扎纸店</h3>
                </a>
            </li>
            <li>
                <a href="/book?bookId=21">
                    <img src="../../../../bookimg/21.jpg"/>
                    <h3>东宫宠妾</h3>
                </a>
            </li>
            <li>
                <a href="/book?bookId=22">
                    <img src="../../../../bookimg/22.jpg"/>
                    <h3>太子今天又被调戏了</h3>
                </a>
            </li>
            <li>
                <a href="/book?bookId=23">
                    <img src="../../../../bookimg/23.jpg"/>
                    <h3>重生之王爷的奋斗</h3>
                </a>
            </li>
            <li>
                <a href="/book?bookId=24">
                    <img src="../../../../bookimg/24.jpg"/>
                    <h3>废弃皇妃</h3>
                </a>
            </li>
            <li>
                <a href="/book?bookId=25">
                    <img src="../../../../bookimg/25.jpg"/>
                    <h3>爵迹</h3>
                </a>
            </li>
            <li>
                <a href="/book?bookId=13">
                    <img src="../../../../bookimg/13.jpg"/>
                    <h3>男主高攀不起，告辞</h3>
                </a>
            </li>
            <li>
                <a href="/book?bookId=2">
                    <img src="../../../../bookimg/2.jpg"/>
                    <h3>斗罗重生</h3>
                </a>
            </li>
            <li>
                <a href="/book?bookId=20">
                    <img src="../../../../bookimg/20.jpg"/>
                    <h3>星际之全能炊事员</h3>
                </a>
            </li>
        </ul>
        <!--bestBrand-->
        <div class="idxBrandLi">
            <a href="#"><img src="upload/brandLogo01.jpg"/></a>
            <a href="#"><img src="upload/brandLogo02.jpg"/></a>
            <a href="#"><img src="upload/brandLogo03.jpg"/></a>
            <a href="#"><img src="upload/brandLogo04.jpg"/></a>
        </div>
    </div>
</section>
<!--case-->
<section class="wrap idexCase">
    <h2>
        <strong>小说推荐</strong>
        <a href="#">more</a>
    </h2>
    <ul>
        <li>
            <a href="/book?bookId=8">
                <img src="../../../../bookimg/8.jpg"/>
                <h3>武动之武祖再临</h3>
            </a>
        </li>
        <li>
            <a href="/book?bookId=11">
                <img src="../../../../bookimg/11.jpg"/>
                <h3>懦弱的勇士</h3>
            </a>
        </li>
        <li>
            <a href="/book?bookId=13">
                <img src="../../../../bookimg/13.jpg"/>
                <h3>男主高攀不起，告辞</h3>
            </a>
        </li>
        <li>
            <a href="/book?bookId=14">
                <img src="../../../../bookimg/14.jpg"/>
                <h3>帝国的朝阳</h3>
            </a>
        </li>
        <li>
            <a href="/book?bookId=15">
                <img src="../../../../bookimg/15.jpg"/>
                <h3>民国大能</h3>
            </a>
        </li>

    </ul>
</section>
<!--section:two->articleList-->
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
