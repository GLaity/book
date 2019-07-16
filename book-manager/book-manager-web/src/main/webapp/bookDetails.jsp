<%--
  Created by IntelliJ IDEA.
  User: 郭文佐
  Date: 2019/7/12
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>产品详情</title>
    <meta name="keywords" content="DeathGhost" />
    <meta name="description" content="DeathGhost" />
    <meta name="author" content="DeathGhost,deathghost@deathghost.cn">
    <link rel="icon" href="images/icon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script src="js/html5.js"></script>
    <script src="js/jquery.js"></script>
    <script src="js/jquery.jqzoom.js"></script>
    <script src="js/base.js"></script>
    <script>
        $(document).ready(function(){
            $("nav .indexAsideNav").hide();
            $("nav .category").mouseover(function(){
                $(".asideNav").slideDown();
            });
            $("nav .asideNav").mouseleave(function(){
                $(".asideNav").slideUp();
            });
            //detail tab
            $(".product_detail_btm .item_tab a").click(function(){
                var liindex = $(".product_detail_btm .item_tab a").index(this);
                $(this).addClass("curr_li").parent().siblings().find("a").removeClass("curr_li");
                $(".cont_wrap").eq(liindex).fadeIn(150).siblings(".cont_wrap").hide();
            });
            //radio
            $(".horizontal_attr label").click(function(){
                $(this).addClass("isTrue").siblings().removeClass("isTrue");
            });
        });
        var text_s = "★";
        var text_k = "☆";
        $(function(){
            $(".head li").on("mouseenter",function(){
                $(this).text(text_s).prevAll().text(text_s);
            })
            $(".head li").on("mouseleave",function(){
                $(this).text(text_k).prevAll().text(text_k);
                $(".current").text(text_s);
            })
            $(".head li").on("click",function(){
                $(this).nextAll().text(text_k).removeClass("current");
                $(this).text(text_s).addClass("current");
                $(this).prevAll().text(text_s).addClass("current");
                $("#adviceLevel").val($(this).index()+1)
            })
        })
    </script>
</head>
<body>
<!--header-->
<header>
    <!--topNavBg-->
    <div class="topNavBg">
        <div class="wrap">
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
                    <li><a href="user.jsp">个人中心</a></li>
                    <li><a href="#" class="favorIcon">收藏夹</a></li>
                </c:if>
                <li><a href="#" class="srvIcon">客户服务</a></li>
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
                    <!-- <dt><a href="channel.jsp">分类</a></dt> -->
                    <dd>
                        <a href="product_list.jsp"><span><i>玄幻</i></span></a>
                    </dd>
                    <dd>
                        <a href="product_list.jsp"><span><i>武侠</i></span></a>
                    </dd>
                    <dd>
                        <a href="product_list.jsp"><span><i>都市</i></span></a>
                    </dd>
                    <dd>
                        <a href="product_list.jsp"><span><i>军事</i></span></a>
                    </dd>
                    <dd>
                        <a href="product_list.jsp"><span><i>历史</i></span></a>
                    </dd>
                    <dd>
                        <a href="product_list.jsp"><span><i>游戏</i></span></a>
                    </dd>
                    <dd>
                        <a href="product_list.jsp"><span><i>悬疑</i></span></a>
                    </dd>
                    <dd>
                        <a href="product_list.jsp"><span><i>科幻</i></span></a>
                    </dd>
                    <dd>
                        <a href="product_list.jsp"><span><i>言情</i></span></a>
                    </dd>
                    <dd>
                        <a href="product_list.jsp"><span><i>青春</i></span></a>
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

<!--导航指向-->
<aside class="wrap insideLink">
    <a href="index.html">首页</a>
    <a href="product_list.html">小说</a>
</aside>
<section class="wrap product_detail">
    <!--img:left-->
    <div class="gallery">
        <div>
            <div id="preview" class="spec-preview">
						<span class="jqzoom">
							<img src="upload/ad002.jpg" />
						</span> </div>

        </div>
    </div>
    <!--text:right-->
    <div class="rt_infor">
        <!--lt_infor-->
        <div class="goods_infor">
            <h2><c:out value="${requestScope.bookBasic.getBook_Title()}"></c:out></h2>
            <ul>
                <li>
                    <dl class="horizontal">
                        <dt>作者</dt>
                        <dd><c:out value="${requestScope.bookBasic.getWriter_Id()}"></c:out></dd>
                        <!-- <dd><strong class="rmb_icon univalent">129.00-169.00</strong>小说</dd> -->
                    </dl>
                </li>
                <li>
                    <dl class="horizontal">
                        <dt>出版时间：</dt>
                        <dd><time><c:out value="${requestScope.bookBasic.getBook_Createdate()}"></c:out></time></dd>
                    </dl>
                </li>
                <li>
                    <dl class="horizontal">
                        <dt>类别：</dt>
                        <dd><em><c:out value="${requestScope.bookBasic.getType_Id()}"></c:out></em></dd>
                    </dl>
                </li>
                <li class="statistics">
                    <dl class="vertical">
                        <dt>收藏量</dt>
                        <dd><c:out value="${requestScope.bookExtend.getBook_Collected()}"></c:out></dd>
                    </dl>
                    <dl class="vertical">
                        <dt>购买量</dt>
                        <dd><c:out value="${requestScope.bookExtend.getBook_Bought()}"></c:out></dd>
                    </dl>
                    <dl class="vertical">
                        <dt>浏览量</dt>
                        <dd><c:out value="${requestScope.bookExtend.getBook_Visited()}"></c:out></dd>
                    </dl>
                </li>

                <li class="last_li">
                    <input type="button" value="免费试读" class="buy_btn" onclick = "window.location.href = '/read.do?_method=start&bookId=1'"/>
                    <input type="button" value="加入书架" class="add_btn" />
                </li>
            </ul>
        </div>
        <!--rt_infor-->

    </div>
</section>
<!--detail-->
<section class="wrap product_detail_btm">
    <article>
        <ul class="item_tab">
            <li><a class="curr_li">小说简介</a></li>
            <li><a>小说评价（2893）</a></li>
            <li><a>小说目录</a></li>
        </ul>
        <!--商品详情-->
        <div class="cont_wrap active">
            <c:out value="${requestScope.bookBasic.getBook_Context()}"></c:out>
        </div>
        <!--小说评价-->
        <div class="cont_wrap">
            <table class="table">
                <c:forEach items="${adviceList}" var="advice">
                <tr>
                    <td width="20%" align="center">${advice.getUser_Id()}</td>
                    <td width="60%">${advice.getAdvice_Text()}</td>
                    <td width="20%" align="center"><time>${advice.getAdvice_Date()}</time></td>
                </tr>
                </c:forEach>
            </table>
            <!--分页-->
            <form action="/advice?_method=addadvice" method="post">
            <div class="box_con3">
                <div class="head">
                    <input type="hidden" id="adviceLevel" name="adviceLevel" value=""/>
                    <ul>
                        <li>☆</li>
                        <li>☆</li>
                        <li>☆</li>
                        <li>☆</li>
                        <li>☆</li>
                    </ul>
                </div>
                <div class="text">
                    <textarea rows="5" cols="100%" name="adviceText" placeholder="我的评论"></textarea>
                </div>
                <br>
                <div class="button">
                    <input type="submit" value="提交" name="" />
                    <input type="reset" value="重置" name="" />
                </div>
            </div>
            </form>

            <div class="paging">
                <a>第一页</a>
                <a class="active">2</a>
                <a>3</a>
                <a>...</a>
                <a>89</a>
                <a>最后一页</a>
            </div>
        </div>
        <!--小说目录-->
        <div class="cont_wrap">
            <table class="table">
                <tr>
                    <td><a href="#">序章</a></td>
                    <td><a href="#">第一章 青云</a></td>
                    <td><a href="#">第二章 迷局</a></td>
                    <td><a href="#">第三章 宏愿</a></td>
                    <td><a href="#">第四章 惊变</a></td>
                </tr>
                <tr>
                    <td><a href="#">第五章 入门</a></td>
                    <td><a href="#">第六章 拜师</a></td>
                    <td><a href="#">第七章 初始</a></td>
                    <td><a href="#">第八章 传艺</a></td>
                    <td><a href="#">第九章 佛与道</a></td>
                </tr>
                <tr>
                    <td><a href="#">第十章 幽谷</a></td>
                    <td><a href="#">第十一章 异变</a></td>
                    <td><a href="#">第十二章 重逢</a></td>
                    <td><a href="#">第十三章 奇才</a></td>
                    <td><a href="#">第十四章 神通</a></td>
                </tr>
            </table>
            <!--分页-->
            <div class="paging">
                <a>第一页</a>
                <a class="active">2</a>
                <a>3</a>
                <a>...</a>
                <a>89</a>
                <a>最后一页</a>
            </div>
        </div>
    </article>
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
