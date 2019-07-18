<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/7/17 0017
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>用户编辑</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
    <!-- https://fonts.google.com/specimen/Open+Sans -->
    <link rel="stylesheet" href="css/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
    <!-- http://api.jqueryui.com/datepicker/ -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/tooplate.css">
</head>
<body class="bg02">
<div class="container">
    <div class="row">
        <div class="col-12">
            <nav class="navbar navbar-expand-xl navbar-light bg-light">
                <a class="navbar-brand" href="userinformation.jsp">
                    <i class="fas fa-3x fa-tachometer-alt tm-site-icon"></i>
                    <h1 class="tm-site-title mb-0">后台管理</h1>
                </a>
                <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="userinformation.jsp">用户管理
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                               aria-expanded="false">
                                信息统计
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">小说浏览统计</a>
                                <a class="dropdown-item" href="#">小说收藏统计</a>
                                <a class="dropdown-item" href="#">小说购买统计</a>
                            </div>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="bookControler.jsp">书籍管理</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#">作者管理</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link d-flex" href="login.jsp">
                                <i class="far fa-user mr-2 tm-logout-icon"></i>
                                <span>注销</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
    <!-- row -->
    <div class="col-xl-8 col-lg-10 col-md-12 col-sm-12" >
        <div class="bg-white tm-block">
            <div class="row">
                <div class="col-12">
                    <h2 class="tm-block-title d-inline-block">用户信息</h2>
                </div>
            </div>
            <div class="row mt-4 tm-edit-product-row">
                <div class="col-xl-7 col-lg-7 col-md-12">
                    <form action="/read.do?_method=add"  method="post">
                        <div class="input-group mb-3">
                            <label for="name" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">用户名：
                            </label>
                            <input placeholder="用户名" id="userName" name="userName" type="text" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7">
                        </div>
                        <div class="input-group mb-3">
                            <label for="description" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 mb-2">手机号：</label>
                            <input  placeholder="手机号"  id="userTel" name="userTel" type="tel" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7">
                        </div>
                        <div class="input-group mb-3">
                            <label for="email" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">邮箱：</label>
                            <input  placeholder="邮箱" id="userEmail" name="userEmail" type="email" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7">
                        </div>
                        <div class="input-group mb-3">
                            <label for="password" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 mb-2">密码</label>
                            <input placeholder="密码" id="userPassword" name="userPassword" type="password" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7">
                        </div>
                        <div class="input-group mb-3">
                            <label for="expire_date" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">注册日期:
                            </label>
                            <input type="date" id="userDate" name="userDate" value="" >
                        </div>
<%--                        <div class="input-group mb-3">--%>
<%--                            <label for="stock" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">会员等级：--%>
<%--                            </label>--%>
<%--                            <select class="custom-select col-xl-9 col-lg-8 col-md-8 col-sm-7" id="level">--%>
<%--                                <option value="1" selected>普通用户</option>--%>
<%--                                <option value="2" >青铜会员</option>--%>
<%--                                <option value="3" >白银会员</option>--%>
<%--                                <option value="4" >黄金会员</option>--%>
<%--                                <option value="5" >白金会员</option>--%>
<%--                                <option value="6" >钻石会员</option>--%>

<%--                            </select>--%>
<%--                        </div>--%>
                        <div class="input-group mb-3">
                            <div class="ml-auto col-xl-8 col-lg-8 col-md-8 col-sm-7 pl-0">
                                <button type="submit" class="btn btn-primary">确定</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-12 mx-auto mb-4">
                    <img src="img/product-image.jpg" alt="Profile Image" class="img-fluid mx-auto d-block">
                    <div class="custom-file mt-3 mb-3">
                        <input id="fileInput" type="file" style="display:none;" />
                        <input type="button" class="btn btn-primary d-block mx-auto" value="上传头像" onclick="document.getElementById('fileInput').click();"
                        />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--<script>--%>
<%--    function insert() {--%>
<%--        var  name= $("#userName").val();--%>
<%--        var password =$("#userPassword").val();--%>
<%--        var  email =$("#userEmail").val();--%>
<%--        var  tel =$("#userTel").val();--%>
<%--        var  user={--%>
<%--            "name":name,--%>
<%--            "password":password,--%>
<%--            "email":email,--%>
<%--            "tel":tel--%>
<%--        }--%>
<%--        $.ajax({--%>
<%--            type:"get",--%>
<%--            url:"//read.do?_method=add",--%>
<%--            data:user,--%>
<%--            beforeSend:function tip() {--%>
<%--                alert("确定添加?");--%>
<%--            },--%>
<%--            success:function back(data) {--%>
<%--                alert(user.name);--%>
<%--            }--%>
<%--            }--%>
<%--        )--%>

<%--    }--%>
<%--</script>--%>
<script src="js/jquery-3.3.1.min.js"></script>
<!-- https://jquery.com/download/ -->
<script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
<!-- https://jqueryui.com/download/ -->
<script src="js/bootstrap.min.js"></script>
<!-- https://getbootstrap.com/ -->
<script>
    $(function () {
        $('#expire_date').datepicker();
    });
</script>
</body>
</html>
