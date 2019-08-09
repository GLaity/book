<%--
  Created by IntelliJ IDEA.
  User: Wolf
  Date: 2019/7/19
  Time: 19:35
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
    <title>评论管理界面</title>
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
                                <a class="nav-link" href="read.do?_method=getList">用户管理
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
        <div class="row tm-content-row tm-mt-big">
            <div class="col-lg-12 tm-md-12 tm-sm-12 tm-col col-xl-12">
                <div class="bg-white tm-block h-100">
                    <div class="row">
                        <div class="col-md-8 col-sm-12">
                            <h2 class="tm-block-title d-inline-block"></h2>

                        </div>

                    </div>

                    <div class="table-responsive">
                        <table class="table table-hover table-striped tm-table-striped-even mt-12">
                            <thead>
                            <tr class="tm-bg-gray">
                                <th scope="col">评论用户</th>
                                <th scope="col">评论内容</th>
                                <th scope="col">小说名</th>
                                <th scope="col">评论时间</th>
                                <th scope="col">评论星级</th>
                                <th scope="col" class="text-center">操作</th>
                            </tr>
                            </thead>

                            <c:forEach items="${advices}" var="advice" varStatus="vs" >
                                <tbody>
                                <tr>
                                    <td class="tm-product-name">${username[vs.count-1]}</td>
                                    <td class="tm-product-name">${advice.getAdvice_Text()}</td>
                                    <td class="tm-product-name">${bookTitles[vs.count-1]}</td>
                                    <td class="tm-product-name">${advice.getAdvice_Date()}</td>
                                    <td class="tm-product-name">${advice.getAdvice_Level()}</td>
                                    <td class="text-center"><a id="deleta" href="javascript:if(confirm('确实要删除该内容吗?')){location=location='advice.do?adviceId=${advice.getAdvice_Id()}&_method=delete'}" >删除</a></td>
                                </tr>
                                </tbody>
                            </c:forEach>
                        </table>
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
</body>
</html>
