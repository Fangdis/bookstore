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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>菠萝书城 | 后台管理平台</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

    <link rel="stylesheet" type="text/css" href="../resources/js/plugs/bootstrap/bootstrap.min.css" />
    <!-- font Awesome -->
    <link rel="stylesheet" type="text/css" href="../resources/css/login/login.css" />
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
</head>
<body>
<div class="login-box">
    <div class="login-title">菠萝书城</div>
    <form class="login-form" action="${ctx}/user/login.html" method="post">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="用户名" name="phone">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" placeholder="密码" name="password">
        </div>
        <input type="submit" class="btn btn-primary login-btn" value="登  录">
    </form>
</div>
</body>
</html>
