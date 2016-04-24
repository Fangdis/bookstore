<%--
  Created by IntelliJ IDEA.
  User: xqYang
  Date: 2016/3/26
  Time: 21:52
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
    <title>菠萝书城</title>
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
                    <li class="active">全部订单</li>
                    <li>待付款</li>
                    <li>待发货</li>
                    <li>待收货</li>
                </ul>
                <div class="tabInfo" id="tab1">
                    <table width="100%" class="ui-table orderTable">
                        <colgroup>
                            <col width="35%"></col>
                            <col width="10%"></col>
                            <col width="10%"></col>
                            <col width="10%"></col>
                            <col width="15%"></col>
                            <col width="20%"></col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>商品信息</th>
                            <th>单价</th>
                            <th>数量</th>
                            <th>合计（元）</th>
                            <th>交易记录</th>
                            <th>交易操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="empty"><td colspan="6"></td></tr>
                        <c:forEach items="${orders}" var="orders">
                                <tr class="ui-table-title">
                                    <td colspan="6" class="text-left pl27">
                                        <span class="mr10">${orders.addTime}</span>
                                        <span>订单编号：${orders.orderNumber}</span>
                                    </td>
                                </tr>
                                <c:forEach items="${orders.cart}" var="cart">
                                    <tr class="goods">
                                        <td class="text-left pl27">
                                            <img src="${ctx}/${cart.cover}">
                                            <a href="${ctx}/detail/detail.html?id=${cart.bookid}" class="productItem">${cart.name}</a>
                                        </td>
                                        <td>${cart.price}</td>
                                        <td>${cart.total}</td>
                                        <td><fmt:formatNumber value="${cart.total*cart.price}" pattern="##.##" minFractionDigits="2"/> </td>
                                        <td><c:if test="${orders.status==0}">
                                            待付款
                                        <td><input type="button" value="确认付款" class="ui-btn ui-btn-pink ui-btn-xs"></td>
                                        </c:if><c:if test="${orders.status==1}">
                                                待收货
                                        <td><input type="button" value="确认收货" class="ui-btn ui-btn-pink ui-btn-xs"></td>
                                            </c:if>
                                            <c:if test="${orders.status==2}">
                                                待发货 <td><input type="button" value="确认催货" class="ui-btn ui-btn-pink ui-btn-xs"></td>
                                            </c:if>
                                            </td>

                                    </tr>
                                </c:forEach>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="tabInfo" id="tab2" style="display: none;">
                    <table width="100%" class="ui-table orderTable">
                        <colgroup>
                            <col width="35%"></col>
                            <col width="10%"></col>
                            <col width="10%"></col>
                            <col width="10%"></col>
                            <col width="15%"></col>
                            <col width="20%"></col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>商品信息</th>
                            <th>单价</th>
                            <th>数量</th>
                            <th>合计（元）</th>
                            <th>交易记录</th>
                            <th>交易操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="empty"><td colspan="6"></td></tr>
                        <c:forEach items="${orders}" var="orders">
                            <c:if test="${orders.status==0}">
                                <tr class="ui-table-title">
                                    <td colspan="6" class="text-left pl27">
                                        <span class="mr10">${orders.addTime}</span>
                                        <span>订单编号：${orders.orderNumber}</span>
                                    </td>
                                </tr>
                                <c:forEach items="${orders.cart}" var="cart">
                                    <tr class="goods">
                                        <td class="text-left pl27">
                                            <img src="${ctx}/${cart.cover}">
                                            <a href="" class="productItem">${cart.name}</a>
                                        </td>
                                        <td>${cart.price}</td>
                                        <td>${cart.total}</td>
                                        <td><fmt:formatNumber value="${cart.total*cart.price}" pattern="##.##" minFractionDigits="2"/> </td>
                                        <td>待付款</td>
                                        <td><input type="button" value="确认付款" class="ui-btn ui-btn-pink ui-btn-xs"></td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="tabInfo" id="tab3" style="display: none;">
                    <table width="100%" class="ui-table orderTable">
                        <colgroup>
                            <col width="35%"></col>
                            <col width="10%"></col>
                            <col width="10%"></col>
                            <col width="10%"></col>
                            <col width="15%"></col>
                            <col width="20%"></col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>商品信息</th>
                            <th>单价</th>
                            <th>数量</th>
                            <th>合计（元）</th>
                            <th>交易记录</th>
                            <th>交易操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="empty"><td colspan="6"></td></tr>
                        <c:forEach items="${orders}" var="orders">
                            <c:if test="${orders.status==1}">
                                <tr class="ui-table-title">
                                    <td colspan="6" class="text-left pl27">
                                        <span class="mr10">${orders.addTime}</span>
                                        <span>订单编号：${orders.orderNumber}</span>
                                    </td>
                                </tr>
                                <c:forEach items="${orders.cart}" var="cart">
                                    <tr class="goods">
                                        <td class="text-left pl27">
                                            <img src="${ctx}/${cart.cover}">
                                            <a href="" class="productItem">${cart.name}</a>
                                        </td>
                                        <td>${cart.price}</td>
                                        <td>${cart.total}</td>
                                        <td><fmt:formatNumber value="${cart.total*cart.price}" pattern="##.##" minFractionDigits="2"/> </td>
                                        <td>待发货</td>
                                        <td><input type="button" value="确认催货" class="ui-btn ui-btn-pink ui-btn-xs"></td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="tabInfo" id="tab4" style="display: none;">
                    <table width="100%" class="ui-table orderTable">
                        <colgroup>
                            <col width="35%"></col>
                            <col width="10%"></col>
                            <col width="10%"></col>
                            <col width="10%"></col>
                            <col width="15%"></col>
                            <col width="20%"></col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>商品信息</th>
                            <th>单价</th>
                            <th>数量</th>
                            <th>合计（元）</th>
                            <th>交易记录</th>
                            <th>交易操作</th>
                        </tr>
                        </thead>
                        <tbody class="empty">
                        <tr><td colspan="6"></td></tr>
                        </tbody>
                        <tbody>
                        <c:forEach items="${orders}" var="orders">
                            <c:if test="${orders.status==2}">
                                <tr class="ui-table-title">
                                    <td colspan="6" class="text-left pl27">
                                        <span class="mr10">${orders.addTime}</span>
                                        <span>订单编号：${orders.orderNumber}</span>
                                    </td>
                                </tr>
                                <c:forEach items="${orders.cart}" var="cart">
                                    <tr class="goods">
                                        <td class="text-left pl27">
                                            <img src="${ctx}/${cart.cover}">
                                            <a href="" class="productItem">${cart.name}</a>
                                        </td>
                                        <td>${cart.price}</td>
                                        <td>${cart.total}</td>
                                        <td><fmt:formatNumber value="${cart.total*cart.price}" pattern="##.##" minFractionDigits="2"/> </td>
                                        <td>待收货</td>
                                        <td><input type="button" value="确认收货" class="ui-btn ui-btn-pink ui-btn-xs"></td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
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
<script type="text/javascript">
    $(document).ready(function(){
        $(".tabBox li").each(function(index,domEle){
            $(domEle).click(function(){
                $(this).addClass("active").siblings().removeClass("active");
                $(".tabInfo").hide();
                $("#tab"+Math.floor(index+1)).show();
            });
        });
    });
</script>
</body>
</html>
