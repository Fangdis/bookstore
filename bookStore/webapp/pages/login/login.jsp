<%--
  Created by IntelliJ IDEA.
  User: xqYang
  Date: 2016/3/26
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>菠萝书城</title>
    <link rel="shortcut icon" type="text/css" href="../../resources/images/common/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../../resources/css/common/fontello.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/common/common.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/login/login.css">
    <link type="text/css" rel="stylesheet" href="../../resources/js/plugs/wx/wx.css" />
    <script type="text/javascript" src="../../resources/js/plugs/jquery/jquery-1.8.3.min.js"></script>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
</head>
<body>
<div class="loginBox clearfix">
    <div class="adBox">
        <img src="../../resources/images/login/login_bg.png">
    </div>
    <div class="loginForm">
        <form wx-validator wx-validator-error-tag="p" wx-validator-ajax autocomplete="off" method="get" action="${ctx}/user/login.html" name="loginForm" >
            <p class="loginSpec">没有账号？<a href="${ctx}/user/registerPage.html" class="pink">注册</a></p>
            <div class="form-item">
                <input type="text" placeholder="请输入手机号码" class="w300" name="phone" id="phone" wx-validator-rule="required|mobile" wx-validator-placeholder="请输入手机号码">
            </div>
            <div class="form-item">
                <input type="password" placeholder="请输入密码" class="w300" name="password" id="password" wx-validator-rule="required" wx-validator-placeholder="请输入密码">
            </div>
            <div id="verify-login"></div>
            <div class="form-item mt25">
                <span><input type="checkbox">记住我</span>
                <a href="${ctx}/user/tofindPwd.html"class="pink fr">忘记密码</a>
            </div>
            <div class="form-button">
                <input type="submit" value="立即登录" class="ui-btn ui-btn-pink ui-btn-xl">
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.config.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.upload.js"></script>
<script>
    function loginForm(data){
        if (data["data"]["pojos"]["login"]=="success"){
            window.location.href="${ctx}/user/userOrder.html";
        }else{
            $("#verify-login").html("手机号码或密码错误！");
            $("#phone, #password").addClass('wx-inputErrBorder');
        } ;
    }

</script>
</body>
</html>
