<%--
  Created by IntelliJ IDEA.
  User: 张志琰
  Date: 2020/10/28
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>图书馆</title>
    <script src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/bootstrap.css" />
</head>
<body>

<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div>
            <div class="navbar-left">
                <h2 class="nav navbar-nav navbar-left navbar-form">我的借还</h2>
            </div>
            <form class="navbar-form navbar-right" role="search">
                <button class="btn btn-info" onclick="returnLibrary()">
                    返回图书馆
                </button>
                <button class="btn btn-info" onclick="relogin()">
                    退出登录
                </button>
            </form>
            <h4 class="navbar-text navbar-right">当前用户：${user.username}</h4 >
        </div>
    </div>
</nav>

<div class="table table-bordered table-hover">
    <table id="table" class="table">
        <tr>
            <td>书名</td>
            <td>作者</td>
            <td>详情</td>
            <td>价格</td>
            <td>类别</td>
            <td>还书</td>
        </tr>
        <c:forEach var="book" items="${list}">
            <tr id="book${book.bid}">
                <td>${book.bookname}</td>
                <td>${book.author}</td>
                <td>${book.detail}</td>
                <td>${book.price}</td>
                <td>${book.category}</td>
                <td><input type="button" class="btn btn-success btn-sm" onclick="returnBook('${book.bid}')" value="还书" /></td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>

<script type="text/javascript">
    function returnBook(bid) {//还书操作
        //还书需要做的操作
        /**
         *
         * 需要将书籍的状态更改为1，需要将order状态改为0
         * 只需要提交一个书籍的Id即可
         */
        //使用ajax
        $.ajax({
            type:"post",
            url:"<%=request.getContextPath()%>/book/updateBookStatusToOne.action",
            dataType:"json",
            data:{"bid":bid},
            success:function(bid){
                document.getElementById("book"+bid).remove();
            }
        })
    }

    function relogin(){
        window.event.returnValue=false;
        window.location.href = "<%=request.getContextPath()%>/login/login.action";
    }


    function returnLibrary() {
        window.event.returnValue=false;
        window.location.href = "<%=request.getContextPath()%>/login/user.action?id=${user.id}";
    }
</script>
</html>
