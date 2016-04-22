<%--
  Created by IntelliJ IDEA.
  User: xqYang
  Date: 2016/4/16
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>菠萝书城</title>
    <link rel="shortcut icon" type="text/css" href="../../resources/images/common/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../../resources/css/common/common.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/login/login.css">
    <link type="text/css" rel="stylesheet" href="../../resources/js/plugs/wx/wx.css" />
    <script type="text/javascript" src="../../resources/js/plugs/jquery/jquery-1.8.3.min.js"></script>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
</head>
<body>
<div class="findPswBox" id="findPswBox1">
    <h2 class="title">通过您的手机号找回密码</h2>
    <form class="findPswForm" wx-validator wx-validator-error-tag="p" wx-validator-ajax autocomplete="off" method="post" action="${ctx}/user/findPwdStepOne.html" name="findPwd1">
        <div class="form-item">
            <label><i class="require">*</i>手机号：</label>
            <input type="text" placeholder="手机号" class="w300" name="phone">
        </div>
        <div class="form-item">
            <label><i class="require">*</i>验证码：</label>
            <input type="text" placeholder="验证码" class="w150" name="code">
            <a href="javascript:;" class="changeCaptcha pink fr">换一张</a>
            <img width="90" height="36" isblank="true" src="${ctx}/user/code.html" class="fr">
        </div>
        <div class="form-btn">
            <input type="submit" value="下一步" class="ui-btn ui-btn-pink ui-btn-m">
        </div>
    </form>
</div>
<div class="findPswBox" style="display: none;" id="findPswBox2">
    <h2 class="title">“菠萝书城手机验证短信”已发送至您的手机</h2>
    <form class="findPswForm" wx-validator wx-validator-error-tag="p" wx-validator-ajax autocomplete="off" method="post" action="${ctx}/user/findPwdStepTwo.html" name="findPwd2">
        <div class="form-item">
            <label><i class="require">*</i>验证码：</label>
            <input type="text" placeholder="验证码" class="w300" name="code">
        </div>
        <div class="form-item mt25" style="padding-left: 98px;">没收到短信？<input type="button" value="60s重新发送" class="reGetPhoneCode ui-btn ui-btn-pink" id="getVoiceCode"></div>
        <div class="form-btn">
            <input type="submit" value="下一步" class="ui-btn ui-btn-pink ui-btn-m">
        </div>
    </form>
</div>
<div class="findPswBox" style="display: none;" id="findPswBox3">
    <h2 class="title">重置密码：请输入您的新密码</h2>
    <form class="findPswForm" wx-validator wx-validator-error-tag="p" wx-validator-ajax autocomplete="off" method="post" action="${ctx}/user/findPwdStepThree.html" name="findPwd3">
        <div class="form-item">
            <label><i class="require">*</i>新密码：</label>
            <input type="text" placeholder="新密码" class="w300">
        </div>
        <div class="form-item">
            <label><i class="require">*</i>确认密码：</label>
            <input type="text" placeholder="确认密码" class="w300" name="password">
        </div>
        <div class="form-btn">
            <input type="submit" value="下一步" class="ui-btn ui-btn-pink ui-btn-m">
        </div>
    </form>
</div>
<div class="findPswBox text-center" style="display: none;"id="findPswBox4">
    <h2 class="title">恭喜您，已经成功重置您的密码！</h2>
    <a href="${ctx}/user/loginPage.html" class="ui-btn ui-btn-pink ui-btn-m">返回的登录</a>
</div>

<script type="text/javascript" src="../../resources/js/plugs/wx/wx.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.config.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.upload.js"></script>
<script>
    function findPwd1(data){
        if (data["data"]["pojos"]["findPwd"]=="success"){

            var btn=jQuery("#getVoiceCode");
            var count=60;
            var countdown=setInterval(function(){
                addBtnDisable(jQuery("#getVoiceCode"));
                btn.val(count + "秒重新获取");
                if (count == 0) {
                    btn.val("获取手机验证码");
                    removeBtnDisable(btn);
                    clearInterval(countdown);
                }
                count--;
            }, 1000);
            $("#findPswBox1").hide();
            $("#findPswBox2").show();
        }else wx.alert("手机或验证码错误");
    }
    function findPwd2(data){
        if (data["data"]["pojos"]["findPwd"]=="success"){
            $("#findPswBox2").hide();
            $("#findPswBox3").show();
        }else wx.alert("验证码错误");
    }
    function findPwd3(data){
        if (data["data"]["pojos"]["findPwd"]=="success"){
            $("#findPswBox3").hide();
            $("#findPswBox4").show();
        }else wx.alert("验证码错误");
    }
    // 获取手机验证码
    function getPhoneCode() {
        var btn = $("#getCodeBtn");
        var count = 60;
        var countdown = setInterval(function() {
            addBtnDisable(btn);
            btn.val(count + "s后重发");
            if (count == 0) {
                btn.val("点击获取");
                removeBtnDisable(btn);
                clearInterval(countdown);
            }
            count--;
        }, 1000);
    }
    // 增加按钮disable
    function addBtnDisable(clickitem) {
        clickitem.attr("disabled", "disabled");
        clickitem.css({
            "cursor": "not-allowed",
            "background-color": "#dedcdc",
            "color": "#999"
        });
    }
    // 移除按钮disable
    function removeBtnDisable(clickitem) {
        clickitem.removeAttr("disabled");
        clickitem.css({
            "cursor": "pointer",
            "background-color": "#9a9898",
            "color": "#fff"
        });
    }
</script>
</body>
</html>
