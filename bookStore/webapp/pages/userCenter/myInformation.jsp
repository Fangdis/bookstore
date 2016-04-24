<%--
  Created by IntelliJ IDEA.
  User: xqYang
  Date: 2016/3/26
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="shortcut icon" type="text/css" href="../../resources/images/common/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../../resources/css/common/fontello.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/common/common.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/userCenter/userCenter.css">
    <link type="text/css" rel="stylesheet" href="../../resources/js/plugs/wx/wx.css" />
    <script type="text/javascript" src="../../resources/js/plugs/jquery/jquery-1.8.3.min.js"></script>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
    <c:if test="${sessionScope.get('user')==null}">
        <c:redirect url="${ctx}/user/loginPage"></c:redirect>
    </c:if>
</head>
<body>
<jsp:include page="${ctx}/pages/common/right.jsp"></jsp:include>
<jsp:include page="${ctx}/pages/common/head.jsp"></jsp:include>
<div class="siteMTopBox">
    <div class="mainInnerBox clearfix">
        <jsp:include page="${ctx}/pages/common/top.jsp" />
    </div>
</div>
<div class="siteNavBox">
    <div class="mainInnerBox">
        <ul class="navList clearfix">
            <li class="allGoods"><a href="/">精选图书分类</a></li>
            <li><a href="/">图书首页</a></li>
            <li><a href="/">特价好书</a></li>
            <li><a href="/">新品精选</a></li>
        </ul>
    </div>
</div>
<div class="mainWrapper">
    <div class="mainInnerBox clearfix">
       <jsp:include page="common/left.jsp" />
        <div class="userWrap">
            <jsp:include page="common/user.jsp" />
            <div class="orderBox">
                <ul class="tabBox clearfix">
                    <li class="active">个人资料</li>
                </ul>
                <div class="tabInfo">
                    <form class="updatePswForm" action="${ctx}/user/updateInformation" method="post" wx-validator wx-validator-error-tag="p" wx-validator-ajax autocomplete="off"  name="updateInformation">
                        <input name="avatar" value="${(sessionScope.get('user')).avatar}" id="userAvatar" type="hidden">
                        <div class="form-item">
                            <label><i class="require">*</i>手机：</label>
                            <input type="text" value="${(sessionScope.get('user')).phone}" class="w300" readonly>
                            <p class="error-text"></p>
                        </div>
                        <div class="form-item">
                            <label><i class="require">*</i>头像：</label>
                            <div class="updateLogo">
                                <img src="${(sessionScope.get('user')).avatar}" id="userImg">
                                <div class="updateLogoInfo">
                                    <div class="updateLogoBtn">
                                        <input wx-upload-size="40" wx-upload-type="image/bmp,image/png,image/gif,image/jpeg" type="file" wx-upload="/user/upLoadPhoto" name="file" value="" wx-upload-assign="upload_bp=data.fileUrl" wx-upload-set="upload_bp_doc=data.fileUrl" hidefocus="true" wx-upload-param="type=cover" accept="image/jpeg,image/x-png,image/gif,image/x-ms-bmp">
                                        <input type="button" class="ui-btn ui-btn-pink ui-btn-xs" value="选择图片">
                                    </div>
                                    <p>支持JPG,JPEG,GIF,PNG,BMP格式，且不超过5M</p>
                                </div>
                            </div>
                            <p class="error-text"></p>
                        </div>
                        <div class="form-item">
                            <label><i class="require">*</i>昵称：</label>
                            <input type="text" placeholder="请输入有效昵称" class="w300" value="${(sessionScope.get('user')).nickname}" name="nickname">
                            <p class="error-text"></p>
                        </div>
                        <%--<div class="form-item">--%>
                            <%--<label><i class="require">*</i>性别：</label>--%>
                            <%--<span class="sex"><input type="radio">女</span>--%>
                            <%--<span class="sex"><input type="radio">男</span>--%>
                            <%--<span class="sex"><input type="radio">保密</span>--%>
                            <%--<p class="error-text"></p>--%>
                        <%--</div>--%>
                        <div class="form-item">
                            <label><i class="require">*</i>城市：</label>
                            <div  id="city_region_selector1" style="display: inline-block;"></div>
                            <input type="hidden" name="province" class="province">
                            <input type="hidden" name="city" class="city">
                            <input type="hidden" wx-validator-rule="required" name="posnum" wx-validator-param="" id="city" placeholder="" >
                        </div>
                        <div class="form-item">
                            <label><i class="require">*</i>简介：</label>
                            <textarea class="summary" name="introduction">${(sessionScope.get('user')).introduction}</textarea>
                            <p class="error-text"></p>
                        </div>
                        <div class="form-btn">
                            <input type="submit" value="保存" class="ui-btn ui-btn-pink ui-btn-m">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="${ctx}/pages/common/foot.jsp"></jsp:include>
<script type="text/javascript" src="../../resources/js/plugs/region/region.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.config.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.upload.js"></script>

<script type="text/javascript" src="../../resources/js/common.js"></script>
<script>
    $("#" + "city_region_selector1").city_selector('city', '${(sessionScope.get('user')).posnum}');
    function file(data){
        $("#userImg").attr("src",data["data"]["pojos"]["filePath"]);
        $("#userAvatar").val(data["data"]["pojos"]["filePath"]);
    }
    $("#province").change(function(){
        $(".province").val($(this).find("option:selected").text());
    });
    $("#city").change(function(){
        $(".city").val($(this).find("option:selected").text());
    });
    function updateInformation(data){
        if(data["status"]=="success"){
            window.location.reload(true);
        }
    }
</script>
</body>
</html>
