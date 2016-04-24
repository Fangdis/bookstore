<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xqYang
  Date: 2016/4/23
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<a href="/" class="siteLogo">
    <img src="../../resources/images/common/siteLogo.png">
</a>
<form action="${ctx}/product/search.html" method="get" id="searchForm">
    <input type="hidden" name="flag" value="1" id="searchFlag">
    <div class="searchBox">
        <ul class="searchTab">
            <li class="active">书名</li>
            <li>作者</li>
        </ul>
        <div class="searchInner clearfix">
            <input type="text" placeholder="平凡的世界" id="searchText" name="searchName">
            <input class="searchBtn icon-search-1" type="submit" value="搜索"/>
        </div>
        <div class="hotWord">
            <span>热门搜索：</span>
            <a href="${ctx}/product/search.html?flag=1&searchName=卡通动漫">卡通动漫</a>
            <a href="${ctx}/product/search.html?flag=1&searchName=心灵鸡汤" class="pink">心灵鸡汤</a>
            <a href="${ctx}/product/search.html?flag=1&searchName=经济" class="pink">经济</a>
            <a href="${ctx}/product/search.html?flag=1&searchName=科普百科">科普百科</a>
            <a href="${ctx}/product/search.html?flag=1&searchName=美食">美食</a>
            <a href="${ctx}/product/search.html?flag=1&searchName=影视" class="pink">影视</a>
            <a href="${ctx}/product/search.html?flag=1&searchName=文学名著">文学名著</a>
        </div>
    </div>
</form>
<div class="basketBox">
    <span><i class="icon icon-basket"></i>购物车<i class="num">
        <c:choose>
            <c:when test="${sessionScope.get('user')==null}">
                0
            </c:when>
            <c:otherwise>
                ${sessionScope.get("sumCart")}
            </c:otherwise>
        </c:choose>
    </i>件</span><a class="goPayLink" href="${ctx}/order/shopCart.html">去结算></a>
</div>
