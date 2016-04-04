<%--
  Created by IntelliJ IDEA.
  User: xqYang
  Date: 2016/4/3
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>菠萝书城 | 后台管理平台</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- bootstrap 3.0.2 -->
    <link rel="stylesheet" type="text/css" href="../../resources/js/plugs/bootstrap/bootstrap.min.css" />
    <!-- font Awesome -->
    <link rel="stylesheet" type="text/css" href="../../resources/font/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="../../resources/css/admin/admin.css" />
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
    <style>
        .orderBox {
            padding: 0 23px 50px;
            border: 1px solid #ededed;
            border-radius: 5px;
            margin-top: 20px;
        }
        .orderBox .tabBox {
            border-bottom: 3px solid #f8f8f8;
            height: 57px;
            margin-bottom: 25px;
        }
        div, p, h1, h2, h3, textarea {
            word-wrap: break-word;
            word-break: break-all;
        }
        .orderBox .tabBox {
            border-bottom: 3px solid #f8f8f8;
            height: 57px;
            margin-bottom: 25px;
        }
        ol, ul {
            list-style: none;
        }
        .orderBox .tabBox li.active {
            border-bottom: 3px solid #9ea74b;
        }
        .orderBox .tabBox li {
            padding: 0 20px;
            height: 57px;
            line-height: 57px;
            float: left;
            cursor: pointer;
            font-size: 15px;
        }
        button, input[type="button"], input[type="reset"], input[type="submit"], input[type="file"] {
            cursor: pointer;
            -webkit-appearance: button;
            border: none;
        }
        .ui-btn-xs {
            width: 80px;
            height: 30px;
            line-height: 30px;
        }
        .ui-btn-pink {
            background-color: #3c8dbc;
            color: #fff;
        }
        .ui-btn {
            border-radius: 3px;
            text-align: center;
            display: inline-block;
        }
        button, input, select, textarea {
            outline: none;
        }
        body, textarea, input, select, button {
            font: 12px/1.5 "Microsoft YaHei", "Helvetica Neue", "Hiragino Sans GB", "Segoe UI", Tahoma, Arial, STHeiti, sans-serif;
            color: #3c8dbc;
        }
        .ui-table .ui-table-title {
            border: 1px solid #ededed;
            background-color: #f8f8f8;
            height: 35px;
            line-height: 35px;
        }
        .ui-table .goods td:first-child {
            border-left: 1px solid #ededed;
        }
        .ui-table tr td.pl27 {
            padding-left: 27px;
        }
        .ui-table tr td.text-left {
            text-align: left;
        }

        .ui-table .goods td {
            text-align: center;
            padding: 10px 15px;
            border-bottom: 1px solid #ededed;
        }
        .ui-table thead tr {
            border: 1px solid #ededed;
        }
        .ui-table tr th {
            background-color: #f8f8f8;
            line-height: 40px;
            font-weight: normal;
            text-align: center;
        }

        .mr10 {
            margin-right: 10px;
        }
        Inherited from td.text-left.pl27
        .ui-table tr td.text-left {
            text-align: left;
        }
        .ui-table .ui-table-title td {
            text-align: center;
        }
    </style>
</head>
<body class="skin-black">
<!-- header logo: style can be found in header.less -->
<jsp:include page="${ctx}/pages/common/head.jsp"></jsp:include>
<div class="wrapper row-offcanvas row-offcanvas-left">
    <!-- Left side column. contains the logo and sidebar -->
    <jsp:include page="${ctx}/pages/common/left.jsp"></jsp:include>
    <aside class="right-side">
        <!-- Main content -->
        <section class="content">
            <div class="panel">
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
                                <col width="5%"></col>
                                <col width="30%"></col>
                                <col width="10%"></col>
                                <col width="10%"></col>
                                <col width="10%"></col>
                                <col width="15%"></col>
                                <col width="20%"></col>
                            </colgroup>
                            <thead>
                            <tr>
                                <th>商品编号</th>
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
                                        <span class="mr10">订单编号：${orders.orderNumber}</span>
                                        <span class="mr10">用户编号：${orders.userId}</span>
                                    </td>
                                </tr>
                                <c:forEach items="${orders.cart}" var="cart">
                                    <tr class="goods">
                                        <td>${cart.bookid}</td>
                                        <td class="text-left pl27">
                                            <img src="${ctx}/${cart.cover}">
                                            <a href="${ctx}/detail/detail.html?id=${cart.bookid}" class="productItem">${cart.name}</a>
                                        </td>
                                        <td>${cart.price}</td>
                                        <td>${cart.total}</td>
                                        <td><fmt:formatNumber value="${cart.total*cart.price}" pattern="##.##" minFractionDigits="2"/> </td>
                                        <td><c:if test="${orders.status==0}">
                                            待付款
                                        <%--<td><input type="button" value="确认付款" class="ui-btn ui-btn-pink ui-btn-xs"></td>--%>
                                            </c:if><c:if test="${orders.status==1}">
                                        待发货
                                        <td><input type="button" value="发货" class="ui-btn ui-btn-pink ui-btn-xs"><input type="button" value="撤销" class="ui-btn ui-btn-pink ui-btn-xs"></td>
                                        </c:if>
                                        <c:if test="${orders.status==2}">
                                            待确认收货
                                            <%--<td><input type="button" value="" class="ui-btn ui-btn-pink ui-btn-xs"></td>--%>
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
                                <col width="5%"></col>
                                <col width="30%"></col>
                                <col width="10%"></col>
                                <col width="10%"></col>
                                <col width="10%"></col>
                                <col width="15%"></col>
                                <col width="20%"></col>
                            </colgroup>
                            <thead>
                            <tr>
                                <th>商品编号</th>
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
                                            <span class="mr10">用户编号：${orders.userId}</span>
                                        </td>
                                    </tr>
                                    <c:forEach items="${orders.cart}" var="cart">
                                        <tr class="goods">
                                            <td>${cart.bookid}</td>
                                            <td class="text-left pl27">
                                                <img src="${ctx}/${cart.cover}">
                                                <a href="" class="productItem">${cart.name}</a>
                                            </td>
                                            <td>${cart.price}</td>
                                            <td>${cart.total}</td>
                                            <td><fmt:formatNumber value="${cart.total*cart.price}" pattern="##.##" minFractionDigits="2"/> </td>
                                            <td>待付款</td>
                                            <%--<td><input type="button" value="确认付款" class="ui-btn ui-btn-pink ui-btn-xs"></td>--%>
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
                                <col width="5%"></col>
                                <col width="30%"></col>
                                <col width="10%"></col>
                                <col width="10%"></col>
                                <col width="10%"></col>
                                <col width="15%"></col>
                                <col width="20%"></col>
                            </colgroup>
                            <thead>
                            <tr>
                                <th>用户编号</th>
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
                                            <span class="mr10">用户编号：${orders.userId}</span>
                                        </td>
                                    </tr>
                                    <c:forEach items="${orders.cart}" var="cart">
                                        <tr class="goods">
                                            <td>${cart.bookid}</td>
                                            <td class="text-left pl27">
                                                <img src="${ctx}/${cart.cover}">
                                                <a href="" class="productItem">${cart.name}</a>
                                            </td>
                                            <td>${cart.price}</td>
                                            <td>${cart.total}</td>
                                            <td><fmt:formatNumber value="${cart.total*cart.price}" pattern="##.##" minFractionDigits="2"/> </td>
                                            <td>待发货</td>
                                            <td><input type="button" value="发货" class="ui-btn ui-btn-pink ui-btn-xs"></td>
                                            <td><input type="button" value="撤销" class="ui-btn ui-btn-pink ui-btn-xs"></td>
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
                                <col width="5%"></col>
                                <col width="30%"></col>
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
                                            <span class="mr10">用户编号：${orders.userId}</span>
                                        </td>
                                    </tr>
                                    <c:forEach items="${orders.cart}" var="cart">
                                        <tr class="goods">
                                            <td>${cart.bookid}</td>
                                            <td class="text-left pl27">
                                                <img src="${ctx}/${cart.cover}">
                                                <a href="" class="productItem">${cart.name}</a>
                                            </td>
                                            <td>${cart.price}</td>
                                            <td>${cart.total}</td>
                                            <td><fmt:formatNumber value="${cart.total*cart.price}" pattern="##.##" minFractionDigits="2"/> </td>
                                            <td>待确认收货</td>
                                            <%--<td><input type="button" value="确认收货" class="ui-btn ui-btn-pink ui-btn-xs"></td>--%>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

            </div>
        </section><!-- /.content -->
        <!-- <div class="footer-main">
            版权所有&copy; 菠萝书城
        </div> -->
    </aside><!-- /.right-side -->
</div><!-- ./wrapper -->
<!-- jQuery 2.0.2 -->
<script type="text/javascript" src="../../resources/js/plugs/jquery/jquery-1.8.3.min.js"></script>
<!-- Bootstrap -->
<script type="text/javascript" src="../../resources/js/plugs/bootstrap/bootstrap.min.js"></script>
<!-- Director App -->
<script type="text/javascript" src="../../resources/js/plugs/director/app.js"></script>
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
