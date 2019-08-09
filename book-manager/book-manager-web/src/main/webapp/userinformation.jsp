<%@ page import="java.util.List" %>
<%@ page import="com.book.pojo.User_Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>布克小说网—用户管理界面</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
    <!-- https://fonts.google.com/specimen/Open+Sans -->
    <link rel="stylesheet" href="css/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/tooplate.css">
</head>
<%--<script>--%>
<%--    $(function () {--%>
<%--        $.post({--%>
<%--                url:"/read.do?_method=remove",--%>
<%--                date:{--%>

<%--                }--%>
<%--            success:function (data) {--%>
<%--                var--%>
<%--            }--%>
<%--            }--%>
<%--        )--%>
<%--    })--%>
<%--</script>--%>
<body id="reportsPage" class="bg02">

<div class="" id="home">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="navbar navbar-expand-xl navbar-light bg-light">
                    <i class="fas fa-3x fa-tachometer-alt tm-site-icon"></i>
                    <h1 class="tm-site-title mb-0">后台管理</h1>
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
        <%--        <%--%>
        <%--            List<User_Account> UserList =(List<User_Account>)request.getAttribute("userList");--%>
        <%--        %>--%>
        <div class="row tm-content-row tm-mt-big">
            <div class="col-lg-12 tm-md-12 tm-sm-12 tm-col col-xl-12">
                <div class="bg-white tm-block h-100">
                    <div class="row">
                        <div class="col-md-8 col-sm-12">
                            <h2 class="tm-block-title d-inline-block">用户信息</h2>
                        </div>
                        <div class="col-md-4 col-sm-12 text-right">
                            <a href="edituser.jsp" class="btn btn-small btn-primary">添加新用户</a>
                        </div>
                        <%--                        <div class="col-md-2">--%>
                        <%--                            <button type="button" class="btn btn-small btn-primary" id="user_del_modal_btn" onclick="fn_del_user()">批量删除</button>--%>
                        <%--                        </div>--%>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover table-striped tm-table-striped-even mt-12">
                            <thead>
                            <tr class="tm-bg-gray">
<%--                                <                                   <th scope="col"><input type="checkbox" aria-label="Checkbox" id="check_allUser"></th>--%>
                                <th scope="col" class="text-center">用户姓名</th>
                                <th scope="col" class="text-center">手机号</th>
                                <th scope="col"class="text-center">邮箱</th>
                                <th scope="col"class="text-center">账户余额</th>
                                <th scope="col"class="text-center">注册日期</th>
                                <th scope="col">&nbsp;</th>
                            </tr>
                            </thead>
                            <tbody id="user_tables">
                            <c:forEach items="${userList}" var="user_account" varStatus="vs">
                                <tr id="user">
                                    <td class="text-center">
                                        <c:out value="${user_account.getUser_Username()}"></c:out>
                                    </td>
                                    <td class="text-center">
                                        <c:out value="${user_account.getUser_Tel()}"></c:out>
                                    </td>
                                    <td class="text-center">
                                        <c:out value="${user_account.getUser_Email()}"></c:out>
                                    </td>
                                    <td class="text-center">
                                        <c:out value="${money[vs.count-1]}"></c:out>
                                    </td>
                                    <td class="text-center">
                                        <c:out value="${ user_account.getUser_Date()}"></c:out>
                                    </td>
                                    <td><a id="deleta" href="javascript:if(confirm('确实要删除该内容吗?')){location=location='/read.do?userId=${user_account.getUser_Id()}&_method=remove'}" >
                                        <i class="fas fa-trash-alt tm-trash-icon"></i></a></td>
                                    <td><button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#mymodal">编辑</button></td>
                                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myModalLabel">
                                                        用户编辑
                                                    </h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                        &times;
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="form-group" id="myFormId">
                                                        <div class="input-group mb-3">
                                                            <label for="name" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">用户名：
                                                            </label>
                                                            <input placeholder="用户名" id="userName" name="userName" type="text" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7" value=" <c:out value="${user_account.getUser_Username()}"></c:out>">
                                                        </div>
                                                        <div class="input-group mb-3">
                                                            <label for="description" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 mb-2">手机号：</label>
                                                            <input  placeholder="手机号"  id="userTel" name="userTel" type="tel" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7"value="<c:out value="${user_account.getUser_Tel()}"></c:out>">
                                                        </div>
                                                        <div class="input-group mb-3">
                                                            <label for="expire_date" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">注册日期:
                                                            </label>
                                                            <input type="date" id="userDate" name="userDate" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7" value="<c:out value="${user_account.getUser_Date()}"></c:out>">
                                                        </div>
                                                        <div class="input-group mb-3">
                                                            <label for="email" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">邮箱：</label>
                                                            <input  placeholder="邮箱" id="userEmail" name="userEmail" type="email" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7" value=" <c:out value="${user_account.getUser_Email()}"></c:out>">
                                                        </div>
                                                        <div class="input-group mb-3">
                                                            <label for="password" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 mb-2">密码</label>
                                                            <input placeholder="密码" id="userPassword" name="userPassword" type="password" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7"value=" <c:out value="${user_account.getUser_Password()}"></c:out>">
                                                        </div>
                                                    </div>
                                                </div>
                                                    <%--                                                        <sys:message content="${message}"/>--%>
                                                    <%--                                                            <c:if test="${not empty message}">--%>
                                                    <%--                                                                <script type="text/javascript">$("#messageBox").show()</script>--%>
                                                    <%--                                                            </c:if>--%>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-white" data-dismiss="modal" onclick="fn_close">关闭</button>
                                                    <button type="button" class="btn btn-white" data-dismiss="modal" onclick="fn_user_add">保存</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <%--                    <div class="tm-table-actions-col">--%>
                    <%--                        <a class="btn " href="#" role="button">上一页</a>--%>
                    <%--                        <nav aria-label="Page navigation" class="d-inline-block">--%>
                    <%--                            <ul class="pagination tm-pagination">--%>
                    <%--                                <li class="page-item active"><a class="page-link" href="#">1</a></li>--%>
                    <%--                                <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
                    <%--                                <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
                    <%--                                <li class="page-item">--%>
                    <%--                                    <span class="tm-dots d-block">...</span>--%>
                    <%--                                </li>--%>
                    <%--                                <li class="page-item"><a class="page-link" href="#">13</a></li>--%>
                    <%--                                <li class="page-item"><a class="page-link" href="#">14</a></li>--%>
                    <%--                                <a class="btn " href="#" role="button">下一页</a>--%>
                    <%--                            </ul>--%>
                    <%--                        </nav>--%>

                    <%--                    </div>--%>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/jquery-3.3.1.min.js"></script>
<!-- https://jquery.com/download/ -->
<script src="js/bootstrap.min.js"></script>
<!-- https://getbootstrap.com/ -->
<script type="text/javascript">
    <%--var flag=0;//全局变量用来判断是否选中复选框，默认没有选中--%>
    <%--var delId="";//要删除的用户id数组--%>
    <%--var delIds = "";--%>
    <%--var size = 0;--%>
    <%--var totalCount = 0;--%>
    <%--var currentPage = 1;  // 默认当前页面为1--%>
    <%--var startPage=0;--%>
    <%--var endPage = 0;--%>
    <%--var user=${"#myFormId input"};--%>
    <%--function fn_user_add(){--%>
    <%--    $.ajax({--%>
    <%--        url:"read.do?_method=update",--%>
    <%--        type:"post",--%>
    <%--        dataType:"json",--%>
    <%--        data:user.serialize(),--%>
    <%--        success:function (data) {--%>
    <%--            var user = JSON.parse(data);--%>
    <%--            $("#user_tables").append(--%>
    <%--                ""--%>
    <%--            )--%>
    <%--        },--%>
    <%--        error:function () {--%>
    <%--            alert(失败);--%>
    <%--        }--%>
    <%--    })--%>
    <%--}--%>
    <%--function fn_user_list() {--%>
    <%--    $.ajax({--%>
    <%--        url: "read.do?_method=getList",--%>
    <%--        type: "post",--%>
    <%--        dataType: "json",--%>
    <%--        success:function (data) {--%>
    <%--        for (var i=0;i<data.length;i++){--%>
    <%--            var str =JSON.parse(data);--%>
    <%--            $("<tr id=\"user\">\n") .append("                                        <th scope=\"row\">\n" +--%>
    <%--                "                                            <input type=\"checkbox\" aria-label=\"Checkbox\">\n" +--%>
    <%--                "                                        </th>\n" +--%>
    <%--                "                                        <td class=\"text-center\">"+data.User_Username+"</td>\n" +--%>
    <%--                "                                        <td class=\"text-center\">"+data.User_Tel+"</td>\n" +--%>
    <%--                "                                        <td class=\"text-center\">"+data.User_Email+"</td>\n" +--%>
    <%--                "                                        <td class=\"text-center\">"+data.User_Date+"</td>\n" +--%>
    <%--                "                                        <td><a href=\"/read.do?userId=${user_account.getUser_Id()}&_method=remove\"><i class=\"fas fa-trash-alt tm-trash-icon\"></i></a></td>\n" +--%>
    <%--                "                                        <td><button type=\"button\" class=\"btn btn-default btn-sm\" data-toggle=\"modal\" data-target=\"#mymodal\">编辑</button></td>\n" +--%>
    <%--                "                                        <div class=\"modal fade\" id=\"myModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\">"+" </tr>")--%>
    <%--            }--%>
    <%--        }--%>
    <%--    })--%>
    <%--}--%>
    $('.modal-body').on('hidden.bs.modal', '.modal', function () {
        $(this).removeData('bs.modal');
    });

    <%--//单选和全选--%>
    <%--$("#check_allUser").click(function () {--%>
    <%--    if (flag==0){--%>
    <%--        alert(xxxx);--%>
    <%--        $("user_tables input[type='checkbox']").prop("checked",true);--%>
    <%--        flag=1;--%>
    <%--    }else {--%>
    <%--        alert(yyyyy);--%>
    <%--        $("user_tables input[type='checkbox']").prop("checked",false);--%>
    <%--        flag=0;--%>
    <%--    }--%>
    <%--})--%>
</script>
</body>
</html>
