<%--
  Created by IntelliJ IDEA.
  User: 张志琰
  Date: 2020/10/20
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>图书管理系统</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/bootstrap.css">
    <!-- <link rel="stylesheet" href="css/bootstrap.css.map"> -->
    <script src="<%=request.getContextPath()%>/js/jquery.2.1.1.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
    <style>
        body{
            background-image:url("<%=request.getContextPath()%>/js/1.jpg");
            background-size:cover;
            background-attachment:fixed;
            background-repeat:no-repeat;
        }
    </style>

</head>
<body background="">

<nav class="navbar navbar-default" role="navigation">

    <div class="container-fluid">
        <h2  class="navbar-text navbar-left">图书管理系统</h2>
        <div class="navbar-form navbar-left" role="search">
            <button class="btn btn-default" onclick="skip(1)">
                图书管理
            </button>
        </div>
        <div class="navbar-form navbar-left" role="search">
            <button class="btn btn-default" onclick="skip(2)">
                读者管理
            </button>
        </div>
        <div class="navbar-form navbar-left" role="search">
            <button class="btn btn-default" onclick="reExit()">
                退出登录
            </button>
        </div>
    </div>
</nav>
</body>


<script type="text/javascript" language="javascript">
    function skip(num){
        if (num == 1) {
            window.location.href ="<%=request.getContextPath()%>/admin/bookManage.action";
        }else if (num == 2) {
            window.location.href ="<%=request.getContextPath()%>/login/getCommonUser.action";
        }
    }

    function reExit() {
        window.location.href ="<%=request.getContextPath()%>/login/login.action";
    }
</script>
</html>