<%--
  Created by IntelliJ IDEA.
  User: xqYang
  Date: 2016/4/3
  Time: 23:08
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
    <link rel="stylesheet" type="text/css" href="../../resources/css/detail/detail.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/index/index.css">
    <link type="text/css" rel="stylesheet" href="../../resources/js/plugs/wx/wx.css" />
    <script type="text/javascript" src="../../resources/js/plugs/jquery/jquery-1.8.3.min.js"></script>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
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
            <li class="allGoods"><a href="javascript:;">精选图书分类</a></li>
            <li><a href="/">图书首页</a></li>
            <li><a href="/">新品精选</a></li>
            <li><a href="/">特价好书</a></li>
        </ul>
    </div>
</div>
<div class="mainWrapper">
    <div class="mainInnerBox">
        <ul class="breadcrumb clearfix">
            <li><strong><a href="">图书</a></strong></li>
            <c:if test="${kind!=null||kind==''}">
                <li class="toNext">></li>
                <li><a href="${ctx}/product/list?kind=${kind}">${kind}</a></li>
            </c:if>
            <c:if test="${minKind!=null||minKind==''}">
                <li class="toNext">></li>
                <li><a href="${ctx}/product/list?kind=${kind}&minKind=${minKind}">${minKind}</a></li>
            </c:if>
        </ul>
        <div class="productListBox">
            <ul class="filter clearfix">
                <li class="active">综合排序</li>
                <li>销量</li>
                <li>价格</li>
                <li>上架时间</li>
            </ul>
            <div class="productList clearfix">
                <c:forEach items="${books}" var="book">
                    <div class="item">
                        <a href="${ctx}/detail/detail.html?id=${book.id}"><img src="${ctx}/${book.cover}"></a>
                        <p class="money">￥${book.price}</p>
                        <a href="../detail/detail.html"><p class="info">${book.name}</p></a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<jsp:include page="${ctx}/pages/common/foot.jsp"></jsp:include>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.config.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.upload.js"></script>
<script type="text/javascript" src="../../resources/js/common.js"></script>
</body>
</html>
