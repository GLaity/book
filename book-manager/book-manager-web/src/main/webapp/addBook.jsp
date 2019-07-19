<%--
  Created by IntelliJ IDEA.
  User: Wolf
  Date: 2019/7/16
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Add Product - Dashboard Admin Template</title>

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
                                <a class="dropdown-item" href="book-bowse-statistics.html">小说浏览统计</a>
                                <a class="dropdown-item" href="#">小说收藏统计</a>
                                <a class="dropdown-item" href="index.html">小说购买统计</a>
                            </div>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="userinformation.jsp">书籍管理</a>
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
    <div class="row tm-mt-big">
        <div class="col-xl-8 col-lg-10 col-md-12 col-sm-12">
            <div class="bg-white tm-block">
                <div class="row">
                    <div class="col-12">
                        <h2 class="tm-block-title d-inline-block">添加书籍</h2>
                    </div>
                </div>
                <div class="row mt-4 tm-edit-product-row">
                    <div class="col-xl-7 col-lg-7 col-md-12">
                        <form action="book.do?_method=saveadd" method="post" class="tm-edit-product-form">
                            <div class="input-group mb-3">
                                <label for="name" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">书名</label>
                                <input id="name" name="name" type="text" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7">
                            </div>
                            <div class="input-group mb-3">
                                <label for="name" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">作者</label>
                                <input id="author" name="author" type="text" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7">
                            </div>
                            <div class="input-group mb-3">
                                <label for="name" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">售价</label>
                                <input id="price" name="price" type="text" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7">
                            </div>
                            <div class="input-group mb-3">
                                <label  class="col-xl-4 col-lg-4 col-md-4 col-sm-5 mb-2">简介</label>
                                <textarea id="context" name="context" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7" rows="3" required></textarea>
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
                                    <option value="10" >青春</option>

                                </select>
                            </div>
                            <div class="input-group mb-3">
                                <label class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">上传书籍:
                                </label>
                                <input type="file" id="booksrc" name="booksrc" class="col-xl-8 col-lg-12 col-md-12 col-sm-12" onchange="setBlogrollImageName(this)" txlFillIn="isNotNull" >
                            </div>
                            <div class="input-group mb-3">
                                <div class="ml-auto col-xl-8 col-lg-8 col-md-8 col-sm-7 pl-0">
                                    <button type="submit" class="btn btn-primary">添加
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-12 mx-auto mb-4">
                        <div class="tm-product-img-dummy mx-auto">
                            <i class="fas fa-5x fa-cloud-upload-alt" onclick="document.getElementById('fileInput').click();"></i>
                        </div>
                        <div class="custom-file mt-3 mb-3">
                            <input id="fileinput" name="fileinput" type="file" style="display:none;" />
                            <input type="button" class="btn btn-primary d-block mx-auto" value="上传图片" onclick="document.getElementById('fileInput').click();"
                            />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="row tm-mt-big">
        <div class="col-12 font-weight-light">

        </div>
    </footer>
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
<script type="text/javascript">
    function setBlogrollImageName(basicfile){
        document.getElementById("blogrollimagename").value=basicfile.value;
    }
</script>
</body>
</html>
