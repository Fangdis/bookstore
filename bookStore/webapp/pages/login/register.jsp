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
        <form wx-validator wx-validator-error-tag="p" wx-validator-ajax autocomplete="off" method="get" action="${ctx}/user/register.html" name="registerForm">
            <p class="loginSpec">已有账号？<a href="${ctx}/user/loginPage.html" class="pink">登录</a></p>
            <div class="form-item">
                <input type="text" class="w300" name="phone" wx-validator-rule="required|mobile" wx-validator-placeholder="手机号" id="mobilephone">
                <p id="wx-validator-phone-required" class="error-text" style="display: none;">不能为空</p>
                <p id="wx-validator-phone-mobile" class="error-text" style="display: none;">请填写正确的手机号码</p>
                <p id="mobilephoneValid" class="error-text" style="display: none;">手机号码已存在</p>
            </div>
            <div class="form-item">
                <input type="password" class="w300" name="password" wx-validator-rule="required|password" wx-validator-placeholder="密码">
            </div>
            <div class="form-item">
                <input type="text" class="w180" name="code" wx-validator-rule="required" wx-validator-placeholder="手机验证码" id="phonecode">
                <input type="button" value="获取验证码" class="ui-btn ui-btn-pink ui-btn-s fr" id="getCodeBtn">
                <p id="codeValid" class="error-text" style="display: none;">手机验证码错误</p>
            </div>
            <div class="form-button">
                <input type="submit" value="立即注册" class="ui-btn ui-btn-pink ui-btn-xl">
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" src="../../resources/js/common.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.config.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.upload.js"></script>
<script>
    $(document).ready(function(){
        $("#mobilephone").change(function() {
            $("#mobilephoneValid").hide();
            var that = this;
            $.ajax({
                type: "post",
                url: path + "/account/clientInfo_judgeMobile",
                cache: false,
                async: false,
                dataType: "json",
                data: {"clientinfo.mobilephone":$("#mobilephone").val()},
                success: function(result){
                    if (result.mobile == "error") {
                        if ($(that).nextAll("#wx-validator-phone-mobile").is(":hidden") && $(that).nextAll("#wx-validator-phone-required").is(":hidden") && $(that).nextAll("#mobilephoneValid").is(":hidden")) {
                            $("#mobilephoneValid").show(1,function(){
                                $("#mobilephone").addClass("wx-inputErrBorder");
                            });
                        }
                    }
                }
            });
        });
        $("#getCodeBtn").click(function(){
           if (isEmpty($("#mobilephone").val())) {
               $("#mobilephone").addClass("wx-inputErrBorder");
               $("#wx-validator-phone-required").show();
               return false;
           } else if (!$("#mobilephoneValid").is(":hidden")||!$("#wx-validator-phone-mobile").is(":hidden")||!$("#wx-validator-phone-required").is(":hidden")) {
               return false;
           } else {
               $.post("${ctx}/user/randCode",function(data){
                   data= JSON.parse(data);
                   if (data["data"]["pojos"]["randCode"]=="success"){
                       getPhoneCode();
                   }else{
                       wx.alert("您点击太过频繁，请稍后再试");
                   }
               });
           }
       }) ;
    });
    function registerForm_before($form,$target){
        var result=false;
        $.ajax({
            cache: false,
            async: false,
            dataType: 'json',
            type: 'post',
            url: "/account/clientInfo_checkMobileCode",
            data:{"mobileCode":$("#phonecode").val()},
            success: function(data){
                if (data.mobileMessage == "error") {
                    $("#codeValid").show(1,function(){
                        $("#codeValid").addClass("wx-inputErrBorder");
                    });
                    result= false;
                } else if (data.mobileMessage == "success") {
                    $("#codeValid").text("");
                    result= true;
                }
            }
        });
        return result;
    }
    function registerForm(data){
        if (data["data"]["pojos"]["register"]=="success"){
            window.location.href="${ctx}/user/loginPage.html";
        }
    }
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
    function addBtnDisable(clickitem) {
        clickitem.attr("disabled", "disabled");
        clickitem.css({
            "cursor": "not-allowed",
            "background-color": "#dedcdc",
            "color": "#999"
        });
    }
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
