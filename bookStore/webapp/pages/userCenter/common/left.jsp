<%--
  Created by IntelliJ IDEA.
  User: xqYang
  Date: 2016/3/27
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="leftNav">
    <ul class="leftNavItem">
        <h3 class="leftNavTitle">我的</h3>
        <li ><a href="${ctx}/user/userOrder.html">我的订单</a></li>
        <%--<li><a href="myEvaluate.html">我的评价</a></li>--%>
        <li><a href="${ctx}/order/shopCart.html">我的购物车</a></li>
    </ul>
    <ul class="leftNavItem">
        <h3 class="leftNavTitle">设置</h3>
        <li><a href="${ctx}/user/myAddress.html">收货地址</a></li>
        <li><a href="${ctx}/user/myPassword.html">修改密码</a></li>
        <li><a href="${ctx}/user/myInformation.html">个人资料</a></li>
    </ul>
</div>
