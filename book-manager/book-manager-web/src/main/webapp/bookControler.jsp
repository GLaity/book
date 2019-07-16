<%--
  Created by IntelliJ IDEA.
  User: Wolf
  Date: 2019/7/16
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>后台管理系统</title>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
    <!-- https://fonts.google.com/specimen/Open+Sans -->
    <link rel="stylesheet" href="css/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/tooplate.css">
</head>
<body id="reportsPage" class="bg02">
<div class="" id="home">
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
                                   aria-expanded="false">信息统计

                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="book-bowse-statistics.html">小说浏览统计</a>
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
        <div class="row tm-content-row tm-mt-big">
            <div class="col-lg-12 tm-md-12 tm-sm-12 tm-col col-xl-12">
                <div class="bg-white tm-block h-100">
                    <div class="row">
                        <div class="col-md-8 col-sm-12">
                            <h2 class="tm-block-title d-inline-block">书籍信息</h2>

                        </div>
                        <div class="col-md-4 col-sm-12 text-right">
                            <a href="add-product.html" class="btn btn-small btn-primary">添加新书籍</a>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover table-striped tm-table-striped-even mt-12">
                            <thead>
                            <tr class="tm-bg-gray">
                                <th scope="col">&nbsp;</th>
                                <th scope="col">书名</th>
                                <th scope="col" class="text-center">书籍编号</th>
                                <th scope="col" class="text-center">作者</th>
                                <th scope="col">创建日期</th>
                                <th scope="col">&nbsp;</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">
                                    <input type="checkbox" aria-label="Checkbox">
                                </th>
                                <td class="tm-product-name">1. In malesuada placerat (hover)</td>
                                <td class="text-center">145</td>
                                <td class="text-center">255</td>
                                <td>2018-10-28</td>
                                <td><i class="fas fa-trash-alt tm-trash-icon"></i></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="tm-table-mt tm-table-actions-row">

                        <div class="tm-table-actions-col">
                            <a class="btn " href="#" role="button">上一页</a>

                            <nav aria-label="Page navigation" class="d-inline-block">
                                <ul class="pagination tm-pagination">
                                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <span class="tm-dots d-block">...</span>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">13</a></li>
                                    <li class="page-item"><a class="page-link" href="#">14</a></li>
                                    <a class="btn " href="#" role="button">下一页</a>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/jquery-3.3.1.min.js"></script>
<!-- https://jquery.com/download/ -->
<script src="js/bootstrap.min.js"></script>
<!-- https://getbootstrap.com/ -->
<script>
    $(function () {
        $('.tm-product-name').on('click', function () {
            window.location.href = "edit-product.html";
        });
    })
</script>
</body>
</html>
