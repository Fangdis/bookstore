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
            <li><a href="../userCenter/myOrder.html"><i class="icon icon-list-bullet"></i>我的订单</a></li>
            <li><a href="../order/cart.html"><i class="icon icon-basket"></i>我的购物车 <span class="cart-num">0</span></a></li>
            <li><a href=""><i class="icon icon-chat"></i>在线客服</a></li>
            <li><a href=""><i class="icon icon-help-circled"></i>帮助中心</a></li>
        </ul>
        <ul class="siteLoginBox fr clearfix">
            <!-- 未登录 begin -->
            <li>欢迎来到HiGo，请</li>
            <li><a href="${ctx}/user/loginPage.html" class="pink">登录</a></li>
            <li><a href="${ctx}/user/register.html" class="pink">免费注册</a></li>
            <!-- 未登录 end -->

            <!-- 已登录 begin -->
            <!-- <li><a href="">童心未泯_X</a></li>
            <li><a href="">我的收藏<i class="icon-down-dir"></i></a></li> -->
            <!-- 已登录 end -->
        </ul>
    </div>
</div>
