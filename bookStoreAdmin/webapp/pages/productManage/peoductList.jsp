<%--
  Created by IntelliJ IDEA.
  User: xqYang
  Date: 2016/4/3
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>菠萝书城 | 后台管理平台</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- bootstrap 3.0.2 -->
    <link rel="stylesheet" type="text/css" href="../../resources/js/plugs/bootstrap/bootstrap.min.css" />
    <!-- font Awesome -->
    <link rel="stylesheet" type="text/css" href="../../resources/font/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="../../resources/css/admin/admin.css" />
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
</head>
<body class="skin-black">
<!-- header logo: style can be found in header.less -->
<jsp:include page="${ctx}/pages/common/head.jsp"></jsp:include>
<div class="wrapper row-offcanvas row-offcanvas-left">
    <!-- Left side column. contains the logo and sidebar -->
    <jsp:include page="${ctx}/pages/common/left.jsp"></jsp:include>
    <aside class="right-side">
        <!-- Main content -->
        <section class="content">
            <div class="panel">
                <div class="row" style="padding: 10px 30px;"><a href="${ctx}/product/addPage.html" class="btn btn-primary pull-right">添加</a></div>
                <table class="table table-hover" width="100%">
                    <colgroup>
                        <col width="5%"></col>
                        <col width="8%"></col>
                        <col width="8%"></col>
                        <col width="19%"></col>
                        <col width="10%"></col>
                        <col width="27%"></col>
                        <col width="8%"></col>
                        <col width="10%"></col>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>一级分类</th>
                        <th>二级分类</th>
                        <th>书名</th>
                        <th>作者</th>
                        <th>特色</th>
                        <th>库存</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${books}" var="book" varStatus="status">
                        <tr>
                            <td>${book.productnumber}</td>
                            <td>${book.kind}</td>
                            <td>${book.minkind}</td>
                            <td class="tl">${book.name}</td>
                            <td>${book.author}</td>
                            <td class="tl">${book.feature}</td>
                            <td>${book.total}</td>
                            <td><a href="${ctx}/product/delete?id=${book.id}" class="tbtn">删除</a><a href="${ctx}/product/edit?id=${book.id}" class="tbtn">编辑</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </section><!-- /.content -->
        <!-- <div class="footer-main">
            版权所有&copy; 菠萝书城
        </div> -->
    </aside><!-- /.right-side -->
</div><!-- ./wrapper -->
<!-- jQuery 2.0.2 -->
<script type="text/javascript" src="../../resources/js/plugs/jquery/jquery-1.8.3.min.js"></script>
<!-- Bootstrap -->
<script type="text/javascript" src="../../resources/js/plugs/bootstrap/bootstrap.min.js"></script>
<!-- Director App -->
<script type="text/javascript" src="../../resources/js/plugs/director/app.js"></script>
</body>
</html>
