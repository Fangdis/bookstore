<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xqYang
  Date: 2016/3/26
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="siteHTopBox">
    <div class="mainInnerBox">
        <ul class="siteHRight fr clearfix">
            <li><a href="${ctx}/user/userOrder.html"><i class="icon icon-list-bullet"></i>我的订单</a></li>
            <li><a href="${ctx}/order/shopCart.html"><i class="icon icon-basket"></i>我的购物车 <span class="cart-num">0</span></a></li>
            <li><a href=""><i class="icon icon-chat"></i>在线客服</a></li>
            <li><a href=""><i class="icon icon-help-circled"></i>帮助中心</a></li>
        </ul>
        <ul class="siteLoginBox fr clearfix">
            <!-- 未登录 begin -->
            <c:choose>
                <c:when test="${sessionScope.get('user')==null}">
                    <li>欢迎来到菠萝书城，请</li>
                    <li><a href="${ctx}/user/loginPage.html" class="pink">登录</a></li>
                    <li><a href="${ctx}/user/register.html" class="pink">免费注册</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="">童心未泯_X</a></li>
                    <li><a href="">我的收藏<i class="icon-down-dir"></i></a></li>
                </c:otherwise>
            </c:choose>

            <!-- 未登录 end -->

            <!-- 已登录 begin -->
            <!-- <li><a href="">童心未泯_X</a></li>
            <li><a href="">我的收藏<i class="icon-down-dir"></i></a></li> -->
            <!-- 已登录 end -->
        </ul>
    </div>
</div>
