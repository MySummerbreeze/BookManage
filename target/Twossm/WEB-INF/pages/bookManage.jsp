<%@ page import="com.gx.domain.Book" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: 张志琰
  Date: 2020/10/22
  Time: 9:55
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>图书管理</title>
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
<h1 align="center">图书管理</h1>
<button class="btn  btn-success btn-sm" data-toggle="modal" data-target="#myModal" >
    添加图书信息
</button>
<button class="btn  btn-success btn-sm" data-toggle="modal" onclick="returnAdmin()" >
    返回管理首页
</button>
<table id="table" class="table table-bordered table-striped">
    <tr>
        <td class="td1">书号</td>
        <td class="td1">书名</td>
        <td class="td1">作者</td>
        <td class="td1">详情</td>
        <td class="td1">状态</td>
        <td class="td1">价格</td>
        <td class="td1">类别</td>
        <td class="td1">删除</td>
        <td class="td1">删除</td>

    </tr>
    <c:forEach var="book" items="${list}">
        <tr id="trBook${book.bid}" class="info">
            <td>${book.bid}</td>
            <td>${book.bookname}</td>
            <td>${book.author}</td>
            <td>${book.detail}</td>
            <c:if test='${book.status == 0}'><td>已借</td></c:if>
            <c:if test='${book.status == 1}'><td>未借</td></c:if>
            <td>${book.price}</td>
            <td>${book.category}</td>
            <td class="td2"><input type="button" class="btn btn-warning btn-sm " value="修改" onclick="clickModify(${book.bid},'${book.bookname}','${book.author}','${book.detail}',${book.price},'${book.category}')" data-toggle="modal" data-target="#modify" /></td>
            <td class="td2"><input type="button" class="btn btn-danger btn-sm " value="删除" onclick="deleteById(${book.bid})"/></td>
        </tr>
    </c:forEach>
</table>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:80%">
        <form id="myform">
            <div class="modal-content" >
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        图书信息添加
                    </h4>
                </div>
                <div class="modal-body" id="dialogContent">
                    <div class="row">
                        <div class="col-sm-1">书名</div>
                        <div class="col-sm-5"><input id="bookname" class="form-control"></div>
                        <div class="col-sm-1">作者</div>
                        <div class="col-sm-5"><input id="author" class="form-control"></div>
                        <div class="col-sm-1">详情</div>
                        <div class="col-sm-5"><input id="detail"  class="form-control"></div>
                        <input type="text" value="1" id="status" style="display: none" />
                        <div class="col-sm-1">价格</div>
                        <div class="col-sm-5"><input id="price" class="form-control"></div>
                        <div class="col-sm-1">类别</div>
                        <div class="col-sm-5"><input id="category" class="form-control"></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" id="bookSubmit" class="btn btn-primary" onclick="addBook()">
                        添加
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
</div>


<div class="modal fade" id="modify" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:80%">
        <form>
            <div class="modal-content" >
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title">
                        图书信息修改
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <input id="mbid" style="display: none" type="text" value="" />
                        <div class="col-sm-1">书名</div>
                        <div class="col-sm-5"><input id="mbookname" class="form-control" value=""></div>
                        <div class="col-sm-1">作者</div>
                        <div class="col-sm-5"><input id="mauthor" class="form-control" value=""></div>
                        <div class="col-sm-1">详情</div>
                        <div class="col-sm-5"><input id="mdetail"  class="form-control" value=""></div>
                        <input type="text" value="1" id="mstatus" style="display: none" />
                        <div class="col-sm-1">价格</div>
                        <div class="col-sm-5"><input id="mprice" class="form-control" value=""></div>
                        <div class="col-sm-1">类别</div>
                        <div class="col-sm-5"><input id="mcategory" class="form-control" value=""></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="modifyBook()">修改</button>
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
</div>
</body>
<script type="text/javascript" >
    function deleteById(bid){
        $.ajax({
            type:"post",
            url:"<%=request.getContextPath()%>/book/deleteById.action",
            dataType:"json",
            data:{"bid":bid},
            success:function (msg) {
                document.getElementById("trBook"+bid).remove();
            }
        })
    }
    function addBook() {
        var bookname = document.getElementById("bookname").value;
        var author = document.getElementById("author").value;
        var detail = document.getElementById("detail").value;
        var status = document.getElementById("status").value;
        var price = document.getElementById("price").value;
        var category = document.getElementById("category").value;
        if (bookname == ''||author == ''||detail == ''||price == ''||category == ''){
            alert("信息不能为空！");
            return;
        }
        $.ajax({
            type:"post",
            url:"<%=request.getContextPath()%>/book/addBook.action",
            dataType:"json",
            data:{"bookname":bookname,"author":author,"detail":detail,"status":status,"price":price,"category":category},
            success:function (bid) {
                $('.modal').modal("hide");
                var table = "<tr id=\"trBook"+bid+"\" class=\"info\">\n" +
                    "            <td>"+bid+"</td>\n" +
                    "            <td>"+bookname+"</td>\n" +
                    "            <td>"+author+"</td>\n" +
                    "            <td>"+detail+"</td>\n" +
                    "            <td>未借</td>" +
                    "            <td>"+price+"</td>\n" +
                    "            <td>"+category+"</td>\n" +
                    "            <td class=\"td2\"><input type=\"button\" class=\"btn btn-warning btn-sm \" value=\"修改\" onclick=\"clickModify("+bid+",'"+bookname+"','"+author+"','"+detail+"',"+price+",'"+category+"')\" data-toggle=\"modal\" data-target=\"#modify\" /></td>\n" +
                    "            <td class=\"td2\"><input type=\"button\" class=\"btn btn-danger btn-sm \" value=\"删除\" onclick=\"deleteById("+bid+")\"/></td>\n" +
                    "        </tr>";
                $("#table").append(table);
                document.getElementById("bookname").value = null;
                document.getElementById("author").value = null;
                document.getElementById("detail").value = null;
                document.getElementById("price").value = null;
                document.getElementById("category").value = null;
            }
        })
    }

    function clickModify(bid,bookname,author,detail,price,category) {
        // document.getElementById("#mid").value = bid;
        document.getElementById("mbid").value = bid;
        document.getElementById("mbookname").value = bookname;
        document.getElementById("mauthor").value = author;
        document.getElementById("mdetail").value = detail;
        document.getElementById("mprice").value = price;
        document.getElementById("mcategory").value = category;
    }

    function modifyBook() {
        var bid = document.getElementById("mbid").value;
        var bookname = document.getElementById("mbookname").value;
        var author = document.getElementById("mauthor").value;
        var detail = document.getElementById("mdetail").value;
        var status = document.getElementById("mstatus").value;
        var price = document.getElementById("mprice").value;
        var category = document.getElementById("mcategory").value;
        if (bookname == ''||author == ''||detail == ''||price == ''||category == ''){
            alert("信息不能为空！");
            return;
        }
        $.ajax({
            type:"post",
            url:"<%=request.getContextPath()%>/book/modify.action",
            dataType:"json",
            data:{"bid":bid,"bookname":bookname,"author":author,"detail":detail,"status":status,"price":price,"category":category},
            success:function (bid) {
                $('.modal').modal("hide");
                var table = "<tr id=\"trBook"+bid+"\" class=\"info\">\n" +
                    "            <td>"+bid+"</td>\n" +
                    "            <td>"+bookname+"</td>\n" +
                    "            <td>"+author+"</td>\n" +
                    "            <td>"+detail+"</td>\n" +
                    "            <td>未借</td>" +
                    "            <td>"+price+"</td>\n" +
                    "            <td>"+category+"</td>\n" +
                    "            <td class=\"td2\"><input type=\"button\" class=\"btn btn-warning btn-sm \" value=\"修改\" onclick=\"clickModify("+bid+",'"+bookname+"','"+author+"','"+detail+"',"+price+",'"+category+"')\" data-toggle=\"modal\" data-target=\"#modify\" /></td>\n" +
                    "            <td class=\"td2\"><input type=\"button\" class=\"btn btn-danger btn-sm \" value=\"删除\" onclick=\"deleteById("+bid+")\"/></td>\n" +
                    "        </tr>";
                document.getElementById("trBook"+bid).innerHTML = table;
                document.getElementById("bookname").value = null;
                document.getElementById("author").value = null;
                document.getElementById("detail").value = null;
                document.getElementById("price").value = null;
                document.getElementById("category").value = null;
            }
        })
    }
    function returnAdmin() {
        window.location.href = "<%=request.getContextPath()%>/admin/admin.action";
    }
</script>
</html>