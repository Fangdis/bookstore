<%--
  Created by IntelliJ IDEA.
  User: xqYang
  Date: 2016/4/3
  Time: 17:44
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

    <link rel="stylesheet" type="text/css" href="../resources/js/plugs/bootstrap/bootstrap.min.css" />
    <!-- font Awesome -->
    <link rel="stylesheet" type="text/css" href="../resources/font/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="../resources/css/admin/admin.css" />
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
        <section class="content"></section><!-- /.content -->
        <!-- <div class="footer-main">
            版权所有&copy; 菠萝书城
        </div> -->
    </aside><!-- /.right-side -->
</div><!-- ./wrapper -->
<!-- jQuery 2.0.2 -->
<script type="text/javascript" src="../resources/js/plugs/jquery/jquery-1.8.3.min.js"></script>
<!-- Bootstrap -->
<script type="text/javascript" src="../resources/js/plugs/bootstrap/bootstrap.min.js"></script>
<!-- Director App -->
<script type="text/javascript" src="../resources/js/plugs/director/app.js"></script>
</body>
</html>
