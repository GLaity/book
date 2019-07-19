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
            $("#advice").click(function () {
                var bookId = $("#bookId").val();
                $.ajax({
                    type:"get",
                    url:"/book?_method=advice",
                    data:{'bookId':bookId},
                    success:function (data) {
                        $("#adviceTable").empty();
                        var json = JSON.parse(data);
                        for (var i = 0; i < json.length; i++){
                            $("#adviceTable").append("<tr>\n" +
                                "<td width=\"20%\" align=\"center\">"+json[i].userName+"</td>\n" +
                                "<td width=\"60%\">"+json[i].adviceText+"</td>\n" +
                                "<td width=\"20%\" align=\"center\"><time>"+json[i].adviceDate+"</time></td>\n" +
                                "</tr>");
                        }
                    }
                })
            })
            $("#adviceSub").click(function () {
                var adviceLevel = $("#adviceLevel").val();
                var adviceText = $("#adviceText").val();
                var bookId = $("#bookId").val();
                var param = {bookId:bookId, adviceLevel:adviceLevel, adviceText:adviceText}
                var obj =  JSON.stringify(param);
                if ( $("#userId").val() == "") {
                    alert("请登录后再进行评论！")
                } else {
                    if (adviceLevel == "" || adviceText == "") {
                        alert("请先选择评价等级并填写评价内容！")
                    } else {
                        $.ajax({
                            type:"get",
                            url:"/book?_method=addAdvice&bookId="+bookId,
                            data:{'param':obj},
                            success:function (data) {
                                var json = JSON.parse(data);
                                $("#adviceTable").empty();
                                for (var i = 0; i < json.length; i++){
                                    $("#adviceTable").append("<tr>\n" +
                                        "                       <td width=\"20%\" align=\"center\">"+json[i].userName+"</td>\n" +
                                        "                       <td width=\"60%\">"+json[i].adviceText+"</td>\n" +
                                        "                       <td width=\"20%\" align=\"center\"><time>"+json[i].adviceDate+"</time></td>\n" +
                                        "                    </tr>");
                                }
                            }
                        })
                    }
                }
            })
        })
        $(function () {
            $("#collecBtn").click(function () {
                alert("小说已收藏！");
            })
            $("#boughtBtn").click(function () {
                alert("账户余额不足！");
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

<!--导航指向-->
<aside class="wrap insideLink">
    <a href="/">首页</a>
    <a href="/book?bookId=${requestScope.bookBasic.getBook_Id()}">${requestScope.bookBasic.getBook_Title()}</a>
</aside>
<section class="wrap product_detail">
    <!--img:left-->
    <div class="gallery">
        <div>
            <div id="preview" class="spec-preview">
						<span class="jqzoom">
							<img src="../../../../bookimg/${bookBasic.getBook_Id()}.jpg" />
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
                        <dd><em><c:out value="${requestScope.bookType.getType_Name()}"></c:out></em></dd>
                    </dl>
                </li>
                <li>
                    <dl class="horizontal">
                        <dt>价格：</dt>
                        <dd><em><c:out value="${requestScope.bookBasic.getBook_Price()}"></c:out>个金币</em></dd>
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
                    <input type="button" value="免费试读" class="buy_btn" onclick = "window.location.href = '/read.do?_method=start&bookId=${bookBasic.getBook_Id()}&chapterId=1'"/>
                    <c:if test="${empty(sessionScope.user)}">
                        <input type="button" value="收藏小说" class="add_btn" onclick = "window.location.href = 'login.jsp'"/>
                        <input type="button" value="购买小说" class="buy_btn" onclick = "window.location.href = 'login.jsp'"/>
                    </c:if>
                    <c:if test="${!empty(sessionScope.user)}">
                        <c:if test="${flag eq 0}">
                            <input type="button" value="未收藏" class="add_btn" onclick = "window.location.href = '/read.do?_method=collection&bookId=${bookBasic.getBook_Id()}&userId=${sessionScope.user.getUser_Id()}'"/>
                        </c:if>
                        <c:if test="${flag eq 1}">
                            <input type="button" value="已收藏" class="add_btn" id="collecBtn" />
                        </c:if>
                        <c:if test="${isBought eq 0}">
                            <input type="button" value="未购买" class="buy_btn" onclick = "window.location.href = '/read.do?_method=buy&bookId=${bookBasic.getBook_Id()}'"/>
                        </c:if>
                        <c:if test="${isBought eq 1}">
                            <input type="button" value="已购买" class="buy_btn"/>
                        </c:if>
                        <c:if test="${isBought eq 2}">
                            <input type="button" value="未购买" class="buy_btn" id="boughtBtn"/>
                        </c:if>
                    </c:if>

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
            <li id="advice"><a>小说评价</a></li>
            <li><a>小说目录</a></li>
        </ul>
        <!--商品详情-->
        <div class="cont_wrap active">
            <c:out value="${requestScope.bookBasic.getBook_Context()}"></c:out>
        </div>
        <!--小说评价-->
        <div class="cont_wrap">
            <table class="table" id="adviceTable">
<%--                <c:forEach items="${adviceList}" var="advice" varStatus="vs">--%>
<%--                <tr>--%>
<%--                    <td width="20%" align="center">${adviceUserList[vs.count-1].getUser_Username()}</td>--%>
<%--                    <td width="60%">${advice.getAdvice_Text()}</td>--%>
<%--                    <td width="20%" align="center"><time>${advice.getAdvice_Date()}</time></td>--%>
<%--                </tr>--%>
<%--                </c:forEach>--%>
            </table>
            <!--分页-->
            <form  action="#" >
            <div class="box_con3">
                <div class="head">
                    <input type="hidden" name="userId" id="userId" value="${sessionScope.user.getUser_Id()}">
                    <input type="hidden" name="bookId" id="bookId" value="${requestScope.bookBasic.getBook_Id()}">
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
                    <textarea rows="5" cols="100%" name="adviceText" id="adviceText" placeholder="我的评论"></textarea>
                </div>
                <br>
                <div class="button">
                    <input type="button" id="adviceSub" value="提交" name="" />
                    <input type="reset" value="重置" name="" />
                </div>
            </div>
            </form>

<%--            <div class="paging">--%>
<%--                <a>第一页</a>--%>
<%--                <a class="active">2</a>--%>
<%--                <a>3</a>--%>
<%--                <a>...</a>--%>
<%--                <a>89</a>--%>
<%--                <a>最后一页</a>--%>
<%--            </div>--%>
        </div>
        <!--小说目录-->
        <div class="cont_wrap">
            <table class="table">
                <c:forEach items="${bookDir}" var="dir" varStatus="vs">
                    <c:if test="${vs.count%3 == 1}">
                        <tr>
                            <td><a href="/read.do?_method=start&bookId=${bookBasic.getBook_Id()}&chapterId=${vs.count}">${dir}</a></td>
                    </c:if>
                    <c:if test="${vs.count%3 == 2}">
                             <td><a href="/read.do?_method=start&bookId=${bookBasic.getBook_Id()}&chapterId=${vs.count}">${dir}</a></td>
                    </c:if>
                    <c:if test="${vs.count%3 == 0}">
                             <td><a href="/read.do?_method=start&bookId=${bookBasic.getBook_Id()}&chapterId=${vs.count}">${dir}</a></td>
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
            <!--分页-->
<%--            <div class="paging">--%>
<%--                <a>第一页</a>--%>
<%--                <a class="active">2</a>--%>
<%--                <a>3</a>--%>
<%--                <a>...</a>--%>
<%--                <a>89</a>--%>
<%--                <a>最后一页</a>--%>
<%--            </div>--%>
        </div>
    </article>
</section>
<!--footer-->
<footer>
    <!--help-->
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
    <dl class="wrap otherLink">
        <dt>友情链接</dt>

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
    <div class="wrap btmInfor">
        <p>© 2019 DeathGhost.cn 版权所有 网络文化经营许可证：晋网文[2019]***-02号 增值小说经营许可证：晋B2-200***24-1 信息网络传播阅读许可证：1109***4号</p>
        <p>请所有作者发布作品时务必遵守国家互联网信息管理办法规定，我们拒绝任何色情小说，一经发现，即作删除！举报电话：010-59357051</p>
        <p>本站所收录的作品、社区话题、用户评论、用户上传内容或图片等均属用户个人行为。如前述内容侵害您的权益，欢迎举报投诉，一经核实，立即删除，本站不承担任何责任</p>
        <address>联系地址：山西省太原市尖草坪区</address>
    </div>
</footer>
</body>
</html>
