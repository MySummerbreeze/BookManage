<%--
  Created by IntelliJ IDEA.
  User: 张志琰
  Date: 2020/10/22
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>读者管理（普通用户管理）</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/bootstrap.css" />
    <script src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>
    <style>
        #td1{
            text-align: center;
            background-color: #E3E3DC;
            font-size: 20px;
            font-weight: bold;
        }
        #td2{
            text-align: center;

        }
        body{
            background-image:url("<%=request.getContextPath()%>/js/1.jpg");
            background-size:cover;
            background-attachment:fixed;
            background-repeat:no-repeat;
        }
    </style>
    <script src="<%=request.getContextPath()%>/js/jquery.2.1.1.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
</head>
<body>
<h1 align="center">普通用户管理</h1>
<button class="btn  btn-success btn-sm" data-toggle="modal" onclick="returnAdmin()" >
    返回管理首页
</button>
<table id="table" class="table table-bordered table-striped">
    <tr>
        <td class="td1">ID</td>
        <td class="td1">用户名</td>
        <td class="td1">密码</td>
        <td class="td1">修改</td>
        <td class="td1">删除</td>
    </tr>
    <c:forEach var="user" items="${list}">
        <tr id="user${user.id}" class="info">
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td>${user.password}</td>
            <td class="td2"><input type="button" class="btn btn-warning btn-sm " value="修改" onclick="clickModify('${user.id}','${user.username}','${user.password}');" data-toggle="modal" data-target="#modify" /></td>
            <td class="td2"><input type="button" class="btn btn-danger btn-sm " value="删除" onclick="deleteUser(${user.id});"/></td>
        </tr>
    </c:forEach>
</table>
<!-- 模态框（Modal） -->
<div class="modal fade" id="modify" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:80%">
        <form id="myform">
            <div class="modal-content" >
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        用户信息修改
                    </h4>
                </div>
                <div class="modal-body" id="dialogContent">
                    <div class="row">
                        <input type="text" value="" id="id" style="display: none" />
                        <div class="col-sm-1">用户名</div>
                        <div class="col-sm-5"><input id="username" class="form-control"></div>
                        <div class="col-sm-1">密码</div>
                        <div class="col-sm-5"><input id="password" class="form-control"></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" id="bookSubmit" class="btn btn-primary" onclick="modifyUser()">
                        修改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
</div>
</body>
<script type="text/javascript">
    function returnAdmin() {
        window.location.href = "<%=request.getContextPath()%>/admin/admin.action";
    }
    function deleteUser(id){
        $.ajax({
            type:"post",
            url:"<%=request.getContextPath()%>/login/deleteUser.action",
            dataType:"json",
            data:{"id":id},
            success:function (msg) {
                document.getElementById("user"+id).remove();
            }
        })
    }
    function clickModify(id,username,password) {
        document.getElementById("id").value = id;
        document.getElementById("username").value = username;
        document.getElementById("password").value = password;
    }

    function modifyUser() {
        var id = document.getElementById("id").value;
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        $.ajax({
            type:"post",
            url:"<%=request.getContextPath()%>/login/modifyUser.action",
            dataType:"json",
            data:{"id":id, "username":username,"password":password},
            success:function (id) {
                document.getElementById("id").value = null;
                document.getElementById("username").value = null;
                document.getElementById("password").value = null;
                var table = "<tr id=\"user"+id+"\" class=\"info\">\n" +
                    "            <td>"+id+"</td>\n" +
                    "            <td>"+username+"</td>\n" +
                    "            <td>"+password+"</td>\n" +
                    "            <td class=\"td2\"><input type=\"button\" class=\"btn btn-warning btn-sm \" value=\"修改\" onclick=\"clickModify('"+id+"','"+username+"','"+password+"');\" data-toggle=\"modal\" data-target=\"#modify\" /></td>\n" +
                    "            <td class=\"td2\"><input type=\"button\" class=\"btn btn-danger btn-sm \" value=\"删除\" onclick=\"deleteUser("+id+");\"/></td>\n" +
                    "        </tr>";
                document.getElementById("user"+id).innerHTML=table;
                $('#modify').modal("hide");
            }
        })
    }
</script>
</html>
