<%--
  Created by IntelliJ IDEA.
  User: 张志琰
  Date: 2020/10/20
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>登录页面</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/bootstrap.css" />
    <script src="<%=request.getContextPath()%>/js/jquery.2.1.1.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
    <script>
        $(function(){
            if (${msg!=null}){
                alert("${msg}");
            }
            /*$("#denglu").click(function(){
                var un=document.getElementById("username").value;
                var pw=document.getElementById("password").value;
                if(un.length==0){
                    alert("请输入用户名！");
                    return;
                }else if (un.length!=0&&pw.length==0) {
                    alert("请输入密码！");
                    return;
                }*/
                /*var username = document.getElementById("username").value;
                var password = document.getElementById("password").value;
                $.ajax({
                    type:"post",
                    url:"<%=request.getContextPath()%>/book/modify.action",
                    dataType:"json",
                    data:{"username":username, "password":password},
                    success:function () {

                    }
                })
            });*/
        });

        function checkIsNull() {
            var un=document.getElementById("username").value;
            var pw=document.getElementById("password").value;
            if(un.length==0){
                alert("请输入用户名！");
                return false;
            }else if (un.length!=0&&pw.length==0) {
                alert("请输入密码！");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<form action="<%=request.getContextPath()%>/login/checkLogin.action" method="post" class="form-horizontal" role="form">
    <h1 class="text-center">用户登录</h1>
    <div class="form-group">
        <label class="col-sm-4 control-label">用户名</label>
        <div class="col-sm-4">
            <input type="text" name="username" class="form-control" id="username" placeholder="请输入用户名">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-4 control-label">密码</label>
        <div class="col-sm-4">
            <input type="password" name="password" class="form-control" id="password" placeholder="请输密码">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-4 col-sm-8">
            <button type="submit" class="btn btn-default" onclick="return checkIsNull();">登录</button>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-4 col-sm-8">
            <a href="<%=request.getContextPath()%>/login/register.action">没有账号？立马注册</a>
        </div>
    </div>
</form>
</body>
</html>

