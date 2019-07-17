<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/7/12
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>登录</title>
    <meta name="keywords"  content="DeathGhost" />
    <meta name="description" content="DeathGhost" />
    <meta name="author" content="DeathGhost,deathghost@deathghost.cn">
    <link rel="icon" href="images/icon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="css/style.css" /><script src="js/html5.js"></script>
    <script src="js/jquery.js"></script>
    <script src="js/swiper.min.js"></script>
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
</head>
<body>
<!--advertisment<div class="wrap"><img src="upload/banner.jpg"/></div>-->
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
                    <!-- <dt><a href="product_list.html">分类</a></dt> -->
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
            <li><a href="index.jsp" class="active">首页</a></li>
            <li><a href="ranking_list.jsp">排行</a></li>
            <li><a href="product_list.jsp">完本</a></li>
            <li><a href="product_list.jsp">书库</a></li>
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
<section class="wrap user_form">
    <div class="lt_img">
        <img src="images/form_bg.jpg"/>
    </div>
    <form action="/user?_method=login" method="post">
        <div class="rt_form">
            <h2>会员登录</h2>
            <ul>
                <li class="user_icon">
                    <input type="text" class="textbox" placeholder="账号" name="username"/>
                </li>
                <li class="user_pwd">
                    <input type="password" class="textbox" placeholder="密码" name="password"/>
                </li>
                <li class="link_li">
                    <a href="register.jsp" title="注册新用户" class="fl">注册新用户</a>
                    <a href="find_pwd.jsp" title="忘记密码" class="fr">忘记密码？</a>
                </li>
                <li class="link_li">
                    <input type="submit" value="立即登录" class="sbmt_btn"/>
                </li>
            </ul>
        </div>
    </form>



</section>

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
