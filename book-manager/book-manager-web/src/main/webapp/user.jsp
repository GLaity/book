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
                // $(this).addClass("active");
                // $(this).siblings().removeClass("active");
                $(".user_rt_cont").eq($(this).index()).addClass("selected").siblings().removeClass("selected");
            })
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
                    <li><a href="#" class="obviousText">您好！<c:out value="${sessionScope.user.getUser_Username()}"></c:out></a></li>
                </ul>
            </c:if>
            <!--topRightNav-->
            <ul class="topRtNav">
                <li><a href="user.jsp">个人中心</a></li>
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
                <dl class="asideNav2">
                    <img src="upload/ad002.jpg" />
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
            <dd><a href="#">我的书架</a></dd>
            <dd><a href="#">我的评论</a></dd>
            <dd><a href="#">会员等级</a></dd>
            <dd><a href="#">账户详情</a></dd>
            <dd><a href="#">订单列表</a></dd>
        </dl>
    </aside>
    <!--右侧：个人资料-->
    <div class="user_rt_cont selected">
        <div class="top_title">
            <strong><em>DeathGhost</em>欢迎回到用户中心</strong>
        </div>

        <div class="user_factbook">
            <a href="profile.html" class="user_icon">
                <img src="images/icon/DefaultAvatar.jpg" />
                <span>修改头像</span>
            </a>
            <div class="user_infor">
                <p><strong>DeathGhost</strong>（会员）<span class="user_vip unaccredited">未认证！</span><a href="authenticate.html">申请入驻</a></p>
                <p>上次登录时间：<time>2019-01-14 13:55</time>，登录ip：192.168.1.1</p>
                <p>账户余额：<strong class="rmb_icon">0.00</strong><a href="account.html" class="btn">充值</a><a href="account.html"
                                                                                                          class="btn">提现</a></p>
            </div>
        </div>
        <dl class="user_order_tips">
            <dt>订单</dt>
            <dd>
                <a href="order_list.html">
                    <strong>20</strong>
                    <em>订单</em>
                </a>
            </dd>
            <dd>
                <a href="order_list.html">
                    <strong>10</strong>
                    <em>订单</em>
                </a>
            </dd>
            <dd>
                <a href="order_list.html">
                    <strong>30</strong>
                    <em>订单</em>
                </a>
            </dd>
            <dd>
                <a href="order_list.html">
                    <strong>15</strong>
                    <em>订单</em>
                </a>
            </dd>
        </dl>
        <dl class="user_order_tips">
            <dt>提醒</dt>
            <dd>
                <a href="#">
                    <strong>9</strong>
                    <em>订单</em>
                </a>
            </dd>
            <dd>
                <a href="#">
                    <strong>10</strong>
                    <em>订单</em>
                </a>
            </dd>
            <dd>
                <a href="#">
                    <strong>20</strong>
                    <em>订单</em>
                </a>
            </dd>
            <dd>
                <a href="#">
                    <strong>2</strong>
                    <em>订单</em>
                </a>
            </dd>
        </dl>
    </div>

    <!--右侧：我的浏览-->
    <div class="user_rt_cont">
        <div class="top_title">
            <strong>商品列表</strong>
            <a href="seller_product_detail.html" title="添加新商品" class="fr">添加新商品</a>
        </div>
        <!--条件检索-->
        <div style="margin:8px 0;">
            <select class="select">
                <option>商品分类</option>
                <option>男装</option>
                <option>女装</option>
                <option>配饰</option>
            </select>
            <input type="text" class="textbox textbox_225" placeholder="输入产品货号/关键词" />
            <input type="button" value="搜索" class="group_btn" />
        </div>
        <table class="order_table">
            <tr>
                <th>货号</th>
                <th>图片</th>
                <th>名称</th>
                <th>价格</th>
                <th>库存</th>
                <th>单位</th>
                <th>操作</th>
            </tr>
            <tr>
                <td class="center">A880936</td>
                <td class="center"><a href="product.html" target="_blank"><img src="upload/goods009.jpg" width="50" height="50" /></a></td>
                <td><a h href="product.html" target="_blank">这里是产品名称哦</a></td>
                <td class="center"><strong class="rmb_icon">59.00</strong></td>
                <td class="center">10000</td>
                <td class="center">平方米</td>
                <td class="center">
                    <a href="product.html" target="_blank" title="查看"><img src="images/icon_view.gif" /></a>
                    <a href="seller_product_detail.html" title="编辑"><img src="images/icon_edit.gif" /></a>
                    <a title="删除"><img src="images/icon_trash.gif" /></a>
                </td>
            </tr>
            <tr>
                <td class="center">A880936</td>
                <td class="center"><a href="/book?bookId=1" target="_blank"><img src="upload/goods010.jpg" width="50" height="50" /></a></td>
                <td><a href="product.html" target="_blank">这里是产品名称哦</a></td>
                <td class="center"><strong class="rmb_icon">159.00</strong></td>
                <td class="center">10000</td>
                <td class="center">平方米</td>
                <td class="center">
                    <a href="product.html" target="_blank" title="查看"><img src="images/icon_view.gif" /></a>
                    <a href="seller_product_detail.html" title="编辑"><img src="images/icon_edit.gif" /></a>
                    <a title="删除"><img src="images/icon_trash.gif" /></a>
                </td>
            </tr>
        </table>
        <!--分页-->
        <div class="paging" style="text-align:right">
            <a>第一页</a>
            <a class="active">2</a>
            <a>3</a>
            <a>...</a>
            <a>89</a>
            <a>最后一页</a>
        </div>
    </div>

    <!--右侧：我的书架-->
    <div class="user_rt_cont">
        <!--收藏类型导航-->
        <ul class="favorite_nav">
            <li class="curr_li">已收藏</li>
            <li>已购买</li>
        </ul>
        <div class="favoriteWrap" style="display:block;">
            <!--收藏列表-->
            <ul class="favorite_list">
                <li>
                    <a>
                        <img src="upload/goods005.jpg" />
                        <h2>2019时尚新款</h2>
                        <p class="price"><span class="rmb_icon">298.00</span></p>
                        <p class="remove"><span>&#126;</span></p>
                    </a>
                </li>
                <li>
                    <a>
                        <img src="upload/goods010.jpg" />
                        <h2>2019时尚新款</h2>
                        <p class="price"><span class="rmb_icon">298.00</span></p>
                        <p class="remove"><span>&#126;</span></p>
                    </a>
                </li>
                <li>
                    <a>
                        <img src="upload/goods009.jpg" />
                        <h2>2019时尚新款</h2>
                        <p class="price"><span class="rmb_icon">298.00</span></p>
                        <p class="remove"><span>&#126;</span></p>
                    </a>
                </li>
                <li>
                    <a>
                        <img src="upload/goods008.jpg" />
                        <h2>2019时尚新款</h2>
                        <p class="price"><span class="rmb_icon">298.00</span></p>
                        <p class="remove"><span>&#126;</span></p>
                    </a>
                </li>
                <li>
                    <a>
                        <img src="upload/goods006.jpg" />
                        <h2>2019时尚新款</h2>
                        <p class="price"><span class="rmb_icon">298.00</span></p>
                        <p class="remove"><span>&#126;</span></p>
                    </a>
                </li>
                <li>
                    <a>
                        <img src="upload/goods004.jpg" />
                        <h2>2019时尚新款</h2>
                        <p class="price"><span class="rmb_icon">298.00</span></p>
                        <p class="remove"><span>&#126;</span></p>
                    </a>
                </li>
                <li>
                    <a>
                        <img src="upload/goods003.jpg" />
                        <h2>2019时尚新款</h2>
                        <p class="price"><span class="rmb_icon">298.00</span></p>
                        <p class="remove"><span>&#126;</span></p>
                    </a>
                </li>
                <li>
                    <a>
                        <img src="upload/goods002.jpg" />
                        <h2>2019时尚新款</h2>
                        <p class="price"><span class="rmb_icon">298.00</span></p>
                        <p class="remove"><span>&#126;</span></p>
                    </a>
                </li>
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
        </div>
        <!--店铺收藏-->
        <div class="favoriteWrap">
            <ul class="favorite_list">
                <li>
                    <a>
                        <img src="upload/goods006.jpg" />
                        <h2>店铺一</h2>
                        <p class="remove"><span>&#126;</span></p>
                    </a>
                </li>
                <li>
                    <a>
                        <img src="upload/goods004.jpg" />
                        <h2>店铺一</h2>
                        <p class="remove"><span>&#126;</span></p>
                    </a>
                </li>
                <li>
                    <a>
                        <img src="upload/goods003.jpg" />
                        <h2>店铺一</h2>
                        <p class="remove"><span>&#126;</span></p>
                    </a>
                </li>
                <li>
                    <a>
                        <img src="upload/goods002.jpg" />
                        <h2>店铺一</h2>
                        <p class="remove"><span>&#126;</span></p>
                    </a>
                </li>
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
        </div>
    </div>

    <!--右侧：我的评价-->
    <div class="user_rt_cont">
        <div class="top_title">
            <strong>小说列表</strong>
            <a href="seller_product_detail.html" title="添加新商品" class="fr">添加新商品</a>
        </div>
        <!--条件检索-->
        <div style="margin:8px 0;">
            <select class="select">
                <option>商品分类</option>
                <option>男装</option>
                <option>女装</option>
                <option>配饰</option>
            </select>
            <input type="text" class="textbox textbox_225" placeholder="输入产品货号/关键词" />
            <input type="button" value="搜索" class="group_btn" />
        </div>
        <table class="order_table">
            <tr>
                <th>货号</th>
                <th>图片</th>
                <th>名称</th>
                <th>评价</th>
                <th>操作</th>
            </tr>
            <tr>
                <td class="center">A880936</td>
                <td class="center"><a href="product.html" target="_blank"><img src="upload/goods009.jpg" width="50" height="50" /></a></td>
                <td><a h href="product.html" target="_blank">这里是产品名称哦</a></td>
                <td class="center"><strong class="rmb_icon">59.00</strong></td>
                <td class="center">
                    <a href="product.html" target="_blank" title="查看"><img src="images/icon_view.gif" /></a>
                    <a href="seller_product_detail.html" title="编辑"><img src="images/icon_edit.gif" /></a>
                    <a title="删除"><img src="images/icon_trash.gif" /></a>
                </td>
            </tr>
            <tr>
                <td class="center">A880936</td>
                <td class="center"><a href="product.html" target="_blank"><img src="upload/goods010.jpg" width="50" height="50" /></a></td>
                <td><a href="product.html" target="_blank">这里是产品名称哦</a></td>
                <td class="center"><strong class="rmb_icon">159.00</strong></td>
                <td class="center">
                    <a href="product.html" target="_blank" title="查看"><img src="images/icon_view.gif" /></a>
                    <a href="seller_product_detail.html" title="编辑"><img src="images/icon_edit.gif" /></a>
                    <a title="删除"><img src="images/icon_trash.gif" /></a>
                </td>
            </tr>
        </table>
        <!--分页-->
        <div class="paging" style="text-align:right">
            <a>第一页</a>
            <a class="active">2</a>
            <a>3</a>
            <a>...</a>
            <a>89</a>
            <a>最后一页</a>
        </div>
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
        <div class="paging">
            <a>第一页</a>
            <a class="active">2</a>
            <a>3</a>
            <a>...</a>
            <a>89</a>
            <a>最后一页</a>
        </div>
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
                        <a href="seller_order_detail.html">订单详情</a>
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
        <div class="paging" style="text-align:right">
            <a>第一页</a>
            <a class="active">2</a>
            <a>3</a>
            <a>...</a>
            <a>89</a>
            <a>最后一页</a>
        </div>
    </div>

</section>
<!-- footer-->
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

