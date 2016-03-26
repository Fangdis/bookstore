<%--
  Created by IntelliJ IDEA.
  User: xqYang
  Date: 2016/3/26
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../../resources/css/common/common.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/common/fontello.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/login/login.css">
    <script type="text/javascript" src="../../resources/js/plugs/jquery/jquery-1.8.3.min.js"></script>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
</head>
<body>
<div class="loginWrapper">
    <div class="loginTop clearfix">
        <a href="" class="siteLogo">
            <img src="../../resources/images/siteLogo.png">
        </a>
    </div>
    <div class="loginBox clearfix">
        <div class="adBox">
            <img src="">
        </div>
        <div class="loginForm">
            <form wx-validator wx-validator-error-tag="p" wx-validator-ajax autocomplete="off" method="get" action="${ctx}/user/register.html" name="registerForm">
                <p class="loginSpec">已有账号？<a href="${ctx}/user/loginPage.html" class="pink">登录</a></p>
                <div class="form-item">
                    <input type="text" placeholder="手机号" class="w300" wx-validator-rule="required|mobile" name="phone" wx-validator-placeholder="手机号">
                </div>
                <div class="form-item">
                    <input type="password" placeholder="密码" class="w300" name="password">
                </div>
                <div class="form-item">
                    <input type="text" placeholder="验证码" class="w180" name="code">
                    <input type="button" value="获取验证码" class="ui-btn ui-btn-pink ui-btn-s fr" id="button">
                </div>
                <%--<div class="form-item">--%>
                    <%--<p class="aggrement"><input type="checkbox">我已阅读并同意<a href="" class="pink">《金牛筹用户服务协议》</a></p>--%>
                <%--</div>--%>
                <div class="form-button">
                    <input type="submit" value="立即注册" class="ui-btn ui-btn-pink ui-btn-xl">
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.config.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.upload.js"></script>
<script>
    $(document).ready(function(){
       $("#button").click(function(){
           $.post("${ctx}/user/randCode",function(data){
               data= JSON.parse(data);
               if (data["data"]["pojos"]["randCode"]=="success"){
                   alert("验证码发送成功");
               }else{
                   alert("验证码发送失败");
               }
           });
       }) ;
    });
    function registerForm(data){
        if (data["data"]["pojos"]["register"]=="success"){
            setTimeout(function(){
                alert("注册成功");
                window.location.href="${ctx}/user/loginPage.html";
            },3000);

        }else alert("手机或验证码不对")
    }
</script>
</body>
</html>
