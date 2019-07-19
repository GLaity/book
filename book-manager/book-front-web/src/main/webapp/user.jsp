<%--
  Created by IntelliJ IDEA.
  User: 郭文佐
  Date: 2019/7/13
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>用户中心</title>
    <meta name="keywords" content="DeathGhost" />
    <meta name="description" content="DeathGhost" />
    <meta name="author" content="DeathGhost,deathghost@deathghost.cn">
    <link rel="icon" href="images/icon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script src="js/html5.js"></script>
    <script src="js/jquery.js"></script>
    <script>
        function  deleteAdvice(adviceId) {
            // var adviceId = $(this).children(".adId").val();
            // alert(adviceId);
            $.ajax({
                type:"get",
                url:"/personal?_method=deleteAdvice",
                data:{"adviceId":adviceId},
                success:function () {
                    flush();
                }
            })
        }
        function  deleteCollected(bookId) {
            // var adviceId = $(this).children(".adId").val();
            alert(bookId);
            $.ajax({
                type:"get",
                url:"/personal?_method=deleteCollected",
                data:{"bookId":bookId},
                success:function () {
                    collectflush();
                }
            })
        }
        function flush() {
            $.ajax({
                type:"get",
                url:"/personal?_method=myAdvice",
                success:function (data) {
                    $("#adviceTable").empty();
                    var json = JSON.parse(data);
                    for (var i = 0; i < json.length; i++){
                        $("#adviceTable").append("<tr>\n" +
                            "<td class=\"center\"><a h href=\"/book?bookId="+json[i].bookId+"\" target=\"_blank\">"+json[i].bookName+"</a></td>\n" +
                            "<td class=\"center\">"+json[i].writer+"</td>\n" +
                            "<td class=\"center\">"+json[i].adviceDate+"</td>\n" +
                            "<td class=\"center\"><strong class=\"rmb_icon\">"+json[i].adviceText+"</strong></td>\n" +
                            "<td class=\"center\">\n" +
                            "   <%--<a href=\"product.html\" target=\"_blank\" title=\"查看\"><img src=\"images/icon_view.gif\" /></a>--%>\n" +
                            "   <%--<a href=\"seller_product_detail.html\" title=\"编辑\"><img src=\"images/icon_edit.gif\" /></a>--%>\n" +
                            "   <a href=\"#\" title=\"删除\" class=\"deleteBtn\"  onclick=\"deleteAdvice("+json[i].adviceId+")\">" +
                            "       <input type=\"hidden\" class=\"adId\" value=\""+json[i].adviceId+"\">" +
                            "       <img src=\"images/icon_trash.gif\" />" +
                            "   </a>\n" +
                            "   </td>\n" +
                            "</tr>");
                    }
                }
            })
        }
        function collectflush() {
            $.ajax({
                type:"get",
                url:"/personal?_method=myCollected",
                success:function (data) {
                    $("#favoriteList").empty();
                    var json = JSON.parse(data);
                    for(var i = 0;i<json.length;i++){
                        $("#favoriteList").append(
                            " <li>\n" +
                            "     <a>\n" +
                            "       <img src=\"bookimg/"+json[i].bookId+".jpg\" />\n" +
                            "       <h2>"+json[i].bookName+"</h2>\n" +
                            "       <p class=\"remove\"><span onclick=\"deleteCollected("+json[i].bookId+")\">&#126;</span></p>\n" +
                            "    </a>\n" +
                            " </li>");
                    }
                }
            })
        }
        $(document).ready(function(){
            $("nav .indexAsideNav").hide();
            $("nav .category").mouseover(function(){
                $(".asideNav").slideDown();
            });
            $("nav .asideNav").mouseleave(function(){
                $(".asideNav").slideUp();
            });
            $(".favorite_nav li").click(function(){
                var liindex = $(".favorite_nav li").index(this);
                $(this).addClass("curr_li").siblings().removeClass("curr_li");
                $(".favoriteWrap").eq(liindex).fadeIn(150).siblings(".favoriteWrap").hide();
            });
            //冒泡
            $(".favorite_list li a").click(function(){
                alert("链接");
                window.location.href='product.html';
            });
            $(".favorite_list li .remove").click(function(){
                alert("移除");
                $(this).parents("li").remove();
                event.stopPropagation();
            });
        });
        $(function() {
            $(".user_aside_nav dd").click(function() {
                $(".user_rt_cont").eq($(this).index()).addClass("selected").siblings().removeClass("selected");
            })
            $("#myAdvice").click(flush())
            $("#favoriteList").click(collectflush())
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
            <c:if test="${!empty(sessionScope.user)}">
                <ul class="topLtNav">
                    <li><a href="/personal" class="obviousText">您好！<c:out value="${sessionScope.user.getUser_Username()}"></c:out></a></li>
                </ul>
            </c:if>
            <!--topRightNav-->
            <ul class="topRtNav">
                <li><a href="/personal">个人中心</a></li>
                <li><a href="#" class="favorIcon">收藏夹</a></li>
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
                    <!-- <dt><a href="channel.html">分类</a></dt> -->
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

<section class="wrap user_center_wrap">
    <!--左侧导航-->

    <aside class="user_aside_nav">
        <dt>个人中心</dt>
        <dl>

            <dd><a href="#">个人资料</a></dd>
            <dd><a href="#">我的浏览</a></dd>
            <dd><a href="#" id="myCollected">我的书架</a></dd>
            <dd><a href="#" id="myAdvice">我的评论</a></dd>
            <dd><a href="#">会员等级</a></dd>
            <dd><a href="#">账户详情</a></dd>
            <dd><a href="#">订单列表</a></dd>
        </dl>
    </aside>
    <!--右侧：个人资料-->
    <div class="user_rt_cont selected">
        <div class="top_title">
            <strong><em><c:out value="${sessionScope.user.getUser_Username()}"></c:out></em>欢迎回到用户中心</strong>
        </div>

        <div class="user_factbook">
            <a href="#" class="user_icon">
                <img src="images/icon/DefaultAvatar.jpg" />
                <span>修改头像</span>
            </a>
            <div class="user_infor">
                <p><strong><c:out value="${sessionScope.user.getUser_Username()}"></c:out></strong>（会员）<span class="user_vip unaccredited">未认证！</span><a href="#">申请入驻</a></p>
                <p>上次登录时间：<time>2019-01-14 13:55</time>，登录ip：192.168.1.1</p>
                <p>账户余额：<strong class="rmb_icon">0.00</strong><a href="#" class="btn">充值</a><a href="#" class="btn">提现</a></p>
            </div>
        </div>
        <dl class="user_order_tips">
            <dt>订单</dt>
            <dd>
                <a href="#">
                    <strong><c:out value="${sessionScope.countAccount.getCount_TotalVisit()}"></c:out></strong>
                    <em>浏览数</em>
                </a>
            </dd>
            <dd>
                <a href="#">
                    <strong><c:out value="${sessionScope.countAccount.getCount_TotalBought()}"></c:out></strong>
                    <em>购买数</em>
                </a>
            </dd>
            <dd>
                <a href="#">
                    <strong><c:out value="${countAccount.getCount_TotalPay()}"></c:out></strong>
                    <em>消费金额（元）</em>
                </a>
            </dd>
            <dd>
                <a href="#">
                    <strong><c:out value="${sessionScope.countAccount.getCount_TotalTime()}"></c:out></strong>
                    <em>阅读时长（分钟）</em>
                </a>
            </dd>
        </dl>
        <%--        <dl class="user_order_tips">--%>
        <%--            <dt>提醒</dt>--%>
        <%--            <dd>--%>
        <%--                <a href="#">--%>
        <%--                    <strong>9</strong>--%>
        <%--                    <em>订单</em>--%>
        <%--                </a>--%>
        <%--            </dd>--%>
        <%--            <dd>--%>
        <%--                <a href="#">--%>
        <%--                    <strong>10</strong>--%>
        <%--                    <em>订单</em>--%>
        <%--                </a>--%>
        <%--            </dd>--%>
        <%--            <dd>--%>
        <%--                <a href="#">--%>
        <%--                    <strong>20</strong>--%>
        <%--                    <em>订单</em>--%>
        <%--                </a>--%>
        <%--            </dd>--%>
        <%--            <dd>--%>
        <%--                <a href="#">--%>
        <%--                    <strong>2</strong>--%>
        <%--                    <em>订单</em>--%>
        <%--                </a>--%>
        <%--            </dd>--%>
        <%--        </dl>--%>
    </div>

    <!--右侧：我的浏览-->
    <div class="user_rt_cont">
<%--        <div class="top_title">--%>
<%--            <strong>商品列表</strong>--%>
<%--            <a href="#" title="添加新商品" class="fr">添加新商品</a>--%>
<%--        </div>--%>
        <!--条件检索-->
<%--        <div style="margin:8px 0;">--%>
<%--            <select class="select">--%>
<%--                <option>商品分类</option>--%>
<%--                <option>男装</option>--%>
<%--                <option>女装</option>--%>
<%--                <option>配饰</option>--%>
<%--            </select>--%>
<%--            <input type="text" class="textbox textbox_225" placeholder="输入产品货号/关键词" />--%>
<%--            <input type="button" value="搜索" class="group_btn" />--%>
<%--        </div>--%>
        <table class="order_table">
            <tr>
                <th>小说名</th>
                <th>图片</th>
                <th>作者</th>
                <th>出版日期</th>
                <th>操作</th>
            </tr>
            <c:if test="${!empty(bookVisitedList)}">
                <c:forEach items="${bookVisitedList}" var="bookVisited">
                    <tr>
                        <td class="center"><a href="#" target="_blank">${bookVisited.getBook_Title()}</a></td>
                        <td class="center"><a href="#" target="_blank"><img src="bookimg/${bookVisited.getBook_Id()}.jpg" width="50" height="50" /></a></td>
                        <td class="center">${bookVisited.getWriter_Id()}</td>
                        <td class="center">${bookVisited.getBook_Createdate()}</td>
                        <td class="center">
                                <%--                        <a href="#" target="_blank" title="查看"><img src="images/icon_view.gif" /></a>--%>
                                <%--                        <a href="#" title="编辑"><img src="images/icon_edit.gif" /></a>--%>
                            <a title="删除"><img src="images/icon_trash.gif" /></a>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
        </table>
        <!--分页-->
<%--        <div class="paging" style="text-align:right">--%>
<%--            <a>第一页</a>--%>
<%--            <a class="active">2</a>--%>
<%--            <a>3</a>--%>
<%--            <a>...</a>--%>
<%--            <a>89</a>--%>
<%--            <a>最后一页</a>--%>
<%--        </div>--%>
    </div>

    <!--右侧：我的书架-->
    <div class="user_rt_cont">
        <!--收藏类型导航-->
        <ul class="favorite_nav">
            <li class="curr_li">已收藏</li>
            <li>已购买</li>
        </ul>
        <div class="favoriteWrap" style="display:block;">

            <ul class="favorite_list" id="favoriteList">
<%--                <c:forEach items="${bookBasicsList}" var="book" >--%>
<%--                    <li>--%>
<%--                        <a>--%>
<%--                            <img src="bookimg/${book.getBook_Id()}.jpg" />--%>
<%--                            <h2>${book.getBook_Title()}</h2>--%>
<%--                            <p class="remove" onclick="deleteAdvice(bookId)"><span>&#126;</span></p>--%>
<%--                        </a>--%>
<%--                    </li>--%>
<%--                </c:forEach>--%>
            </ul>
        </div>
        <!--购买-->
        <div class="favoriteWrap">
            <!--购买列表-->
            <ul class="favorite_list">
                <li>
                    <a>
                        <img src="upload/goods008.jpg" />
                        <h2>2019时尚新款</h2>
                        <p class="price"><span class="rmb_icon">298.00</span></p>
                        <p class="remove"><span>&#126;</span></p>
                    </a>
                </li>
            </ul>

        </div>
    </div>

    <!--右侧：我的评价-->
    <div class="user_rt_cont">
        <div class="top_title">
            <strong>小说列表</strong>
            <a href="#" title="添加新商品" class="fr">添加新商品</a>
        </div>
        <!--条件检索-->
        <div style="margin:8px 0;">
            <select class="select">
                <option>分类</option>
                <option>小说名</option>
                <option>作者</option>
                <option>评价</option>
            </select>
            <input type="text" class="textbox textbox_225" placeholder="输入产品货号/关键词" />
            <input type="button" value="搜索" class="group_btn" />
        </div>
        <table class="order_table">
            <thead>
            <tr>
                <th>小说名</th>
                <%--                <th>图片</th>--%>
                <th>作者</th>
                <th>日期</th>
                <th>评价</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="adviceTable">
<%--            <c:forEach items="${adviceList}" var="advice" varStatus="vs">--%>
<%--                <tr>--%>
<%--                    <td class="center"><a h href="/book?bookId=${bookAdviceList[vs.count-1].getBook_Id()}" target="_blank">${bookAdviceList[vs.count-1].getBook_Title()}</a></td>--%>
<%--                    <td class="center">${bookAdviceList[vs.count-1].getWriter_Id()}</td>--%>
<%--                    <td class="center">${advice.getAdvice_Date()}</td>--%>
<%--                    <td class="center"><strong class="rmb_icon">${advice.getAdvice_Text()}</strong></td>--%>
<%--                    <td class="center">--%>
<%--                            &lt;%&ndash;<a href="product.html" target="_blank" title="查看"><img src="images/icon_view.gif" /></a>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;<a href="seller_product_detail.html" title="编辑"><img src="images/icon_edit.gif" /></a>&ndash;%&gt;--%>
<%--                        <a href="/personal?_method=deleteAdvice&adviceId=${advice.getAdvice_Id()}" title="删除"><img src="images/icon_trash.gif" /></a>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--            </c:forEach>--%>
            </tbody>
        </table>
        <!--分页-->
        <%--        <div class="paging" style="text-align:right">--%>
        <%--            <a>第一页</a>--%>
        <%--            <a class="active">2</a>--%>
        <%--            <a>3</a>--%>
        <%--            <a>...</a>--%>
        <%--            <a>89</a>--%>
        <%--            <a>最后一页</a>--%>
        <%--        </div>--%>
    </div>

    <!--右侧：会员等级-->
    <div class="user_rt_cont"></div>

    <!--右侧：账户详情-->
    <div class="user_rt_cont">
        <div class="top_title">
            <strong>资金管理</strong>
        </div>
        <dl class="user_account">
            <dt>账户余额：</dt>
            <dd>
                <strong class="rmb_icon">0.00</strong>
                <a class="link_btn" id="chongzhi">充值</a>
                <a class="link_btn" id="tixian">提现</a>
                <span class="sums">
							<label>充值金额：<input type="text" class="textbox" />元</label>
							<input type="button" value="确认按钮" class="group_btn" />
						</span>
            </dd>
        </dl>
        <table class="order_table">
            <caption><span class="fl">资金变动明细</span></caption>
            <tr>
                <th>类型</th>
                <th>交易金额</th>
                <th>当前余额</th>
                <th>交易时间</th>
                <th>操作</th>
            </tr>
            <tr>
                <td class="center">充值</td>
                <td class="center"><strong class="rmb_icon">58.00</strong></td>
                <td class="center"><span class="rmb_icon">2359.00</span></td>
                <td class="center"><time>2013-01-15 16:59:21</time></td>
                <td class="center">充值完成！</td>
            </tr>
            <tr>
                <td class="center">提现</td>
                <td class="center"><strong class="rmb_icon">129.00</strong></td>
                <td class="center"><span class="rmb_icon">2359.00</span></td>
                <td class="center"><time>2013-01-15 16:59:21</time></td>
                <td class="center">等待处理！</td>
            </tr>
            <tr>
                <td class="center">订单：201301151702</td>
                <td class="center"><strong class="rmb_icon">129.00</strong></td>
                <td class="center"><span class="rmb_icon">2359.00</span></td>
                <td class="center"><time>2013-01-15 16:59:21</time></td>
                <td class="center">交易完成！</td>
            </tr>
            <tr>
                <td class="center">充值</td>
                <td class="center"><strong class="rmb_icon">58.00</strong></td>
                <td class="center"><span class="rmb_icon">2359.00</span></td>
                <td class="center"><time>2013-01-15 16:59:21</time></td>
                <td class="center">充值完成！</td>
            </tr>
            <tr>
                <td class="center">提现</td>
                <td class="center"><strong class="rmb_icon">129.00</strong></td>
                <td class="center"><span class="rmb_icon">2359.00</span></td>
                <td class="center"><time>2013-01-15 16:59:21</time></td>
                <td class="center">等待处理！</td>
            </tr>
            <tr>
                <td class="center">订单：201301151702</td>
                <td class="center"><strong class="rmb_icon">129.00</strong></td>
                <td class="center"><span class="rmb_icon">2359.00</span></td>
                <td class="center"><time>2013-01-15 16:59:21</time></td>
                <td class="center">交易完成！</td>
            </tr>
        </table>
        <!--分页-->
<%--        <div class="paging">--%>
<%--            <a>第一页</a>--%>
<%--            <a class="active">2</a>--%>
<%--            <a>3</a>--%>
<%--            <a>...</a>--%>
<%--            <a>89</a>--%>
<%--            <a>最后一页</a>--%>
<%--        </div>--%>
    </div>

    <!--右侧：订单列表-->
    <div class="user_rt_cont">
        <!--条件检索-->
        <div style="margin:8px 0;">
            <select class="select">
                <option>订单状态</option>
                <option>待付款</option>
                <option>待确认</option>
                <option>待评价</option>
            </select>
            <input type="text" class="textbox textbox_225" placeholder="输入订单编号" />
            <input type="button" value="查询" class="group_btn" />
        </div>
        <ul class="order_li">
            <li>
                <table class="order_table">
                    <caption>
                        <strong>订单编号：201301141637</strong>
                        <em class="shop_name">一号店</em>
                        <a href="#">订单详情</a>
                    </caption>
                    <tr>
                        <td class="center"><a href="product.html" target="_blank"><img src="upload/goods009.jpg" style="width:50px;height:50px;" /></a></td>
                        <td><a href="product.html" target="_blank">这里是产品名称哦</a></td>
                        <td class="center"><span class="rmb_icon">52.00</span></td>
                        <td class="center"><b>1</b></td>
                        <td class="center"><strong class="rmb_icon">52.00</strong></td>
                        <td class="center"><span>等待付款</span></td>
                    </tr>
                </table>
            </li>
            <li>
                <table class="order_table">
                    <caption>
                        <strong>订单编号：201301141637</strong>
                        <em class="shop_name">二号店</em>
                        <a href="seller_order_detail.html">订单详情</a>
                    </caption>
                    <tr>
                        <td class="center"><a href="product.html" target="_blank"><img src="upload/goods009.jpg" style="width:50px;height:50px;" /></a></td>
                        <td><a href="product.html" target="_blank">这里是产品名称哦</a></td>
                        <td class="center"><span class="rmb_icon">52.00</span></td>
                        <td class="center"><b>1</b></td>
                        <td class="center"><strong class="rmb_icon">52.00</strong></td>
                        <td class="center"><a class="a_btn">已付款待发货</a></td>
                    </tr>
                </table>
            </li>
            <li>
                <table class="order_table">
                    <caption>
                        <strong>订单编号：201301141637</strong>
                        <em class="shop_name">二号店</em>
                        <a href="seller_order_detail.html">订单详情</a>
                    </caption>
                    <tr>
                        <td class="center"><a href="product.html" target="_blank"><img src="upload/goods009.jpg" style="width:50px;height:50px;" /></a></td>
                        <td><a href="product.html" target="_blank">这里是产品名称哦</a></td>
                        <td class="center"><span class="rmb_icon">52.00</span></td>
                        <td class="center"><b>1</b></td>
                        <td class="center"><strong class="rmb_icon">52.00</strong></td>
                        <td rowspan="2" class="center"><a class="a_btn">已评价待回评</a></td>
                    </tr>
                    <tr>
                        <td class="center"><a href="product.html" target="_blank"><img src="upload/goods009.jpg" style="width:50px;height:50px;" /></a></td>
                        <td><a href="product.html" target="_blank">这里是产品名称哦</a></td>
                        <td class="center"><span class="rmb_icon">52.00</span></td>
                        <td class="center"><b>1</b></td>
                        <td class="center"><strong class="rmb_icon">52.00</strong></td>
                    </tr>
                </table>
            </li>
            <li>
                <table class="order_table">
                    <caption>
                        <strong>订单编号：201301141637</strong>
                        <em class="shop_name">三号店</em>
                        <a href="seller_order_detail.html">订单详情</a>
                    </caption>
                    <tr>
                        <td class="center"><a href="product.html" target="_blank"><img src="upload/goods009.jpg" style="width:50px;height:50px;" /></a></td>
                        <td><a href="product.html" target="_blank">这里是产品名称哦</a></td>
                        <td class="center"><span class="rmb_icon">52.00</span></td>
                        <td class="center"><b>1</b></td>
                        <td class="center"><strong class="rmb_icon">52.00</strong></td>
                        <td class="center"><span>交易成功</span></td>
                    </tr>
                </table>
            </li>
        </ul>
        <!--分页-->
<%--        <div class="paging" style="text-align:right">--%>
<%--            <a>第一页</a>--%>
<%--            <a class="active">2</a>--%>
<%--            <a>3</a>--%>
<%--            <a>...</a>--%>
<%--            <a>89</a>--%>
<%--            <a>最后一页</a>--%>
<%--        </div>--%>
    </div>

</section>
<!-- footer-->
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

