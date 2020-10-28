<%--
  Created by IntelliJ IDEA.
  User: 张志琰
  Date: 2020/10/20
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
 import="javax.servlet.http.HttpServletRequest" %>
<html>
<head>
    <title>用户注册</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/bootstrap.css" />
    <script src="<%=request.getContextPath()%>/js/jquery.2.1.1.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
</head>
<body>

<form class="form-horizontal" role="form" id="registerForm">
    <h1 class="text-center">注册账号</h1>

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
        <label class="col-sm-4 control-label">注册类型</label>
        <div class="col-sm-4">
            <label class="radio-inline">
                <input type="radio" name="grade"  value="1" > 普通用户
            </label>
            <label class="radio-inline">
                <input type="radio" name="grade"  value="0" > 管理员
            </label>

        </div>
    </div>

    <div class="form-group btn-group-justified">
        <div class="col-sm-offset-5 col-sm-8">
            <button type="button" class="btn btn-default" id="zhuce">注&nbsp;&nbsp;册</button>
            <button type="reset" class="btn btn-default" id="reset">重&nbsp;&nbsp;置</button>
        </div>
    </div>
</form>
<script>
    $(function(){
        $("#zhuce").click(function(){
            var username=document.getElementById("username").value;
            var password=document.getElementById("password").value;
            var grade = $('input:radio:checked').val();
            if(username.length==0){
                alert("请输入用户名！");
                return;
            }else if (username.length!=0&&password.length==0) {
                alert("请输入密码！");
                return;
            }else if (grade == null){
                alert("请填写注册类型！");
                return;
            }
            $.ajax({
                type:"post",
                url:"<%=request.getContextPath()%>/login/addUser.action",
                dataType:"json",
                data:{"username":username,"password":password,"grade":grade},
                success:function (msg) {
                    if (!msg["msg"]){//若返回false则不可用该昵称
                        alert("该昵称不可用！");
                        return;//否则继续执行
                    }
                    alert("注册成功");
                    if (grade == 0){
                        var url = "<%=request.getContextPath()%>/admin/admin.action";
                    }else{
                        var url = "<%=request.getContextPath()%>/admin/user.action?username="+encodeURI(encodeURI(username));
                    }
                    window.location.href = url;
                }
            })
        });
    });
</script>
</body>
</html>
