<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/7/17 0017
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>布克小说网—书籍编辑界面</title>

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
body class="bg02">
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
                            <a class="nav-link active" href="read.do?_method=getList">用户管理
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="bookRank?_method=visit" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                               aria-expanded="false">信息统计

                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a href="bookRank?_method=visit" class="dropdown-item">浏览量排行</a>
                                <a href="bookRank?_method=collect" class="dropdown-item">收藏量排行</a>
                                <a href="bookRank?_method=bought" class="dropdown-item">销量排行</a>
                            </div>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="book.do?_method=getList">书籍管理</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="advice.do?_method=getadvice">评论管理</a>
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
                    <h2 class="tm-block-title d-inline-block">书籍信息</h2>
                </div>
            </div>
            <div class="row mt-4 tm-edit-product-row">
                <div class="col-xl-7 col-lg-7 col-md-12">
                    <form  action="book.do?bookId=${bookBasic.getBook_Id()}&_method=save" method="post" class="tm-edit-product-form">
                        <input type="hidden" name="bookId" id="bookId" value="${bookBasic.getBook_Id()}">
                        <div class="input-group mb-3">
                            <label for="name" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">书籍名：
                            </label>
                            <input placeholder="${bookBasic.getBook_Title()}" value="${bookBasic.getBook_Title()}" id="name" name="name" type="text" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7">
                        </div>
                        <div class="input-group mb-3">
                            <label  class="col-xl-4 col-lg-4 col-md-4 col-sm-5 mb-2">书籍编号：</label>
                            <p class="form-control-static">${bookBasic.getBook_Id()}</p>
                        </div>
                        <div class="input-group mb-3">
                            <label for="name" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">作  者：
                            </label>
                            <input placeholder="${bookBasic.getWriter_Id()}" value="${bookBasic.getWriter_Id()}" id="author" name="author" type="text" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7">
                        </div>
                        <div class="input-group mb-3">
                            <label for="name" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">价  格：
                            </label>
                            <input placeholder="${bookBasic.getBook_price()}" value="${bookBasic.getBook_price()}" id="price" name="price" type="text" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7">
                        </div>
                        <div class="input-group mb-3">
                            <label  class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">简介：</label>
                            <textarea class="form-control" placeholder="${bookBasic.getBook_Context()}">${bookBasic.getBook_Context()}</textarea>
                        </div>
                        <div class="input-group mb-3">
                            <label  class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">创建日期:
                            </label>
                            ${bookBasic.getBook_Createdate()}
                        </div>
                        <div class="input-group mb-3">
                            <label  class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">所属分类：
                            </label>
                            <select class="custom-select col-xl-9 col-lg-8 col-md-8 col-sm-7" id="type" name="type">
                                <option value="1" selected>玄幻</option>
                                <option value="2" >武侠</option>
                                <option value="3" >都市</option>
                                <option value="4" >军事</option>
                                <option value="5" >历史</option>
                                <option value="6" >游戏</option>
                                <option value="7" >悬疑</option>
                                <option value="8" >科幻</option>
                                <option value="9" >言情</option>
                                <option value="10">青春</option>
                            </select>
                        </div>
                        <div class="input-group mb-3">
                            <label  class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">上传书籍:
                            </label>
                            <input type="file" class="col-xl-8 col-lg-12 col-md-12 col-sm-12">
                        </div>
                        <div class="input-group mb-3">
                            <div class="ml-auto col-xl-8 col-lg-8 col-md-8 col-sm-7 pl-0">
                                <button type="submit" class="btn btn-primary">确定
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-12 mx-auto mb-4">
                    <img src="../../../../bookimg/${bookBasic.getBook_Id()}.jpg" alt="Profile Image" class="img-fluid mx-auto d-block">
                    <div class="custom-file mt-3 mb-3">
                        <input id="fileInput" type="file" style="display:none;" />
                        <input type="button" class="btn btn-primary d-block mx-auto" value="上传封面" onclick="document.getElementById('fileInput').click();"
                        />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



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
