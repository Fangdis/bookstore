<%--
  Created by IntelliJ IDEA.
  User: xqYang
  Date: 2016/3/27
  Time: 22:12
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
    <link rel="stylesheet" type="text/css" href="../../resources/css/common/common.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/common/fontello.css">
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
        <jsp:include page="${ctx}/pages/common/top.jsp"></jsp:include>
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
                    <li class="active">修改密码</li>
                </ul>
                <div class="tabInfo">
                    <form class="updatePswForm" method="post" action="${ctx}/user/updatePsw" wx-validator wx-validator-error-tag="p" wx-validator-ajax autocomplete="off"  name="updatePswForm">
                        <div class="form-item">
                            <label><i class="require">*</i>原始密码：</label>
                            <input type="password" placeholder="请输入原始密码" class="w300" name="oldPassword">
                            <p class="error-text"></p>
                        </div>
                        <div class="form-item">
                            <label><i class="require">*</i>新密码：</label>
                            <input type="password" placeholder="请输入新密码" class="w300" name="password">
                            <p class="error-text"></p>
                        </div>
                        <div class="form-item">
                            <label><i class="require">*</i>确认密码：</label>
                            <input type="password" placeholder="请输入确认密码" class="w300" name="newPassword">
                            <p class="error-text"></p>
                        </div>
                        <div class="form-btn">
                            <input type="submit" value="确 认" class="ui-btn ui-btn-pink ui-btn-m">
                        </div>
                    </form>
                </div>
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
    function  updatePswForm(data){
        if(data["desc"]=="success"){
            wx.alert("修改成功");
        }else{
            wx.alert("密码有误");
        }
       window.location.reload(true);
    }
</script>
</body>
</html>
