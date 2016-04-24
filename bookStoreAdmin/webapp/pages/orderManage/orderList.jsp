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
        .tabBox {
            border-bottom: 3px solid #f8f8f8;
            height: 57px;
            margin-bottom: 25px;
        }
        .tabBox li {
            padding: 0 20px;
            height: 57px;
            line-height: 57px;
            float: left;
            cursor: pointer;
            font-size: 15px;
            list-style: none;
        }
        .tabBox li.active {
            border-bottom: 3px solid #39435C;
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
                <ul class="tabBox clearfix">
                        <li class="active">全部订单</li>
                        <li>待付款</li>
                        <li>待发货</li>
                        <li>待收货</li>
                    </ul>
                <div class="tabInfo" id="tab1">
                    <table class="table table-hover" width="100%">
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
                            <c:forEach items="${orders}" var="orders">
                                <tr>
                                    <td colspan="7" class="tl">订单时间：${orders.addTime}  订单编号：${orders.orderNumber}   用户编号：${orders.userId}</td>
                                </tr>
                                <c:forEach items="${orders.cart}" var="cart">
                                    <tr>
                                        <td>${cart.bookid}</td>
                                        <td class="tl">${cart.name}</td>
                                        <td>${cart.price}</td>
                                        <td>${cart.total}</td>
                                        <td><fmt:formatNumber value="${cart.total*cart.price}" pattern="##.##" minFractionDigits="2"/> </td>
                                        <td>
                                            <c:if test="${orders.status==0}">待付款</c:if>
                                            <c:if test="${orders.status==1}">待发货</c:if>
                                            <c:if test="${orders.status==2}">待确认收货</c:if>
                                        </td>
                                        <td>
                                            <c:if test="${orders.status==1}">
                                                <input type="button" value="发货" class="btn btn-primary"><input type="button" value="撤销" class="btn btn-primary"></td>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <tr><td colspan="7" style="background: #f0f3f4;"></td></tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="tabInfo" id="tab2" style="display: none;">
                    <table class="table table-hover" width="100%">
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
                            <c:forEach items="${orders}" var="orders">
                                <c:if test="${orders.status==0}">
                                    <tr>
                                        <td colspan="7" class="tl">订单时间：${orders.addTime}  订单编号：${orders.orderNumber}   用户编号：${orders.userId}</td>
                                    </tr>
                                    <c:forEach items="${orders.cart}" var="cart">
                                        <tr>
                                            <td>${cart.bookid}</td>
                                            <td class="tl">${cart.name}</td>
                                            <td>${cart.price}</td>
                                            <td>${cart.total}</td>
                                            <td><fmt:formatNumber value="${cart.total*cart.price}" pattern="##.##" minFractionDigits="2"/></td>
                                            <td>待付款</td>
                                            <td></td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <tr><td colspan="7" style="background: #f0f3f4;"></td></tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="tabInfo" id="tab3" style="display: none;">
                    <table class="table table-hover" width="100%">
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
                            <c:forEach items="${orders}" var="orders">
                                <c:if test="${orders.status==1}">
                                    <tr>
                                        <td colspan="7" class="tl">订单时间：${orders.addTime}  订单编号：${orders.orderNumber}   用户编号：${orders.userId}</td>
                                    </tr>
                                    <c:forEach items="${orders.cart}" var="cart">
                                        <tr>
                                            <td>${cart.bookid}</td>
                                            <td class="tl">${cart.name}</td>
                                            <td>${cart.price}</td>
                                            <td>${cart.total}</td>
                                            <td><fmt:formatNumber value="${cart.total*cart.price}" pattern="##.##" minFractionDigits="2"/></td>
                                            <td>待发货</td>
                                            <td><input type="button" value="发货" class="btn btn-primary"></td>
                                            <%--<td><input type="button" value="撤销" class="btn btn-primary"></td>--%>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <tr><td colspan="7" style="background: #f0f3f4;"></td></tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="tabInfo" id="tab4" style="display: none;">
                    <table class="table table-hover" width="100%">
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
                            <c:forEach items="${orders}" var="orders">
                                <c:if test="${orders.status==2}">
                                    <tr>
                                        <td colspan="7" class="tl">订单时间：${orders.addTime}  订单编号：${orders.orderNumber}   用户编号：${orders.userId}</td>
                                    </tr>
                                    <c:forEach items="${orders.cart}" var="cart">
                                        <tr>
                                            <td>${cart.bookid}</td>
                                            <td class="tl">${cart.name}</td>
                                            <td>${cart.price}</td>
                                            <td>${cart.total}</td>
                                            <td><fmt:formatNumber value="${cart.total*cart.price}" pattern="##.##" minFractionDigits="2"/> </td>
                                            <td>待确认收货</td>
                                            <td></td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <tr><td colspan="7" style="background: #f0f3f4;"></td></tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </section><!-- /.content -->
        <div class="footer-main">
            版权所有&copy; 菠萝书城
        </div>
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