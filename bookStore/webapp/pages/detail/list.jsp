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
    <link type="text/css" rel="stylesheet" src="../../resources/js/plugs/wx/wx.css" />
    <script type="text/javascript" src="../../resources/js/plugs/jquery/jquery-1.8.3.min.js"></script>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
</head>
<body>
<jsp:include page="${ctx}/pages/common/right.jsp"></jsp:include>
<jsp:include page="${ctx}/pages/common/head.jsp"></jsp:include>
<div class="siteMTopBox">
    <div class="mainInnerBox clearfix">
        <a href="" class="siteLogo">
            <img src="../../resources/images/common/siteLogo.png">
        </a>
        <div class="searchBox">
            <ul class="searchTab">
                <li class="active">宝贝</li><li>店铺</li>
            </ul>
            <div class="searchInner clearfix">
                <input type="text" placeholder="你的美腿还缺一条牛仔裤">
                <span class="searchBtn icon-search-1"></span>
            </div>
            <div class="hotWord">
                <span>热门搜索：</span>
                <a href="">童书优惠</a>
                <a href="" class="pink">动漫</a>
                <a href="">中华书局</a>
                <a href="" class="pink">语文高考</a>
                <a href="" class="pink">教材</a>
                <a href="">字典词典</a>
                <a href="">投资</a>
                <a href="">青春</a>
                <a href="">文学名著</a>
            </div>
        </div>
        <div class="basketBox">
            <span><i class="icon icon-basket"></i>购物车<i class="num">0</i>件</span><a class="goPayLink">去结算></a>
        </div>
    </div>
</div>
<div class="siteNavBox">
    <div class="mainInnerBox">
        <ul class="navList clearfix">
            <li class="allGoods"><a href="javascript:;">精选图书分类</a></li>
            <li><a href="">图书首页</a></li>
            <li><a href="">特价好书</a></li>
            <li><a href="">新品精选</a></li>
        </ul>
    </div>
</div>
<div class="mainWrapper">
    <div class="mainInnerBox">
        <ul class="breadcrumb clearfix">
            <li><strong><a href="">图书</a></strong></li>
            <li class="toNext">></li>
            <li><a href="">${kind}</a></li>
            <c:if test="${minKind!=null||minKind==''}">
                <li class="toNext">></li>
                <li><a href="">${minKind}</a></li>
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
                        <a href="${ctx}/detail/detail.html?id=${book.id}"><img src="${ctx}${book.cover}"></a>
                        <p class="money">￥${book.price}</p>
                        <a href="../detail/detail.html"><p class="info">${book.name}</p></a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<div class="siteFooterBox">
    <div class="mainInnerBox">
        <ul class="serviceList clearfix">
            <li>品类齐全 轻松购物</li>
            <li>多仓直发 极速配送</li>
            <li>正品行货 精致服务</li>
            <li>天天低价 畅选无忧</li>
        </ul>
        <div class="linkList clearfix">
            <div class="linkItem">
                <h3>帮助中心</h3>
                <p><a href="">购物指南</a></p>
                <p><a href="">支付方式</a></p>
                <p><a href="">配送方式</a></p>
            </div>
            <div class="linkItem">
                <h3>服务支持</h3>
                <p><a href="">售后政策</a></p>
                <p><a href="">自主服务</a></p>
                <p><a href="">相关下载</a></p>
            </div>
            <div class="linkItem">
                <h3>关于我们</h3>
                <p><a href="">了解我们</a></p>
                <p><a href="">加入我们</a></p>
                <p><a href="">联系我们</a></p>
            </div>
            <div class="linkItem">
                <h3>关注我们</h3>
                <p><a href="">新浪微博</a></p>
                <p><a href="">官方微信</a></p>
                <p><a href="">腾讯微博</a></p>
            </div>
            <div class="linkItem">
                <h3>售后服务</h3>
                <p><a href="">售后政策</a></p>
                <p><a href="">价格保护</a></p>
                <p><a href="">退款说明</a></p>
            </div>
            <div class="customItem">
                <h3>4000-800-577</h3>
                <p>周一至周日：09:00-22:00</p>
                <p>（仅收市话费）</p>
                <span class="customBtn"><i class="icon icon-chat"></i>24小时在线客服</span>
            </div>
        </div>
        <div class="copyright">
            <p>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备1101080212535号 京网文[2014]0059-0009号</p>
            <p>违法和不良信息举报电话：185-0130-1238</p>
            <ul class="infoLinks">
                <li><img src="../../resources/images/copyright/v-logo-1.png"></li>
                <li><img src="../../resources/images/copyright/v-logo-2.png"></li>
                <li><img src="../../resources/images/copyright/v-logo-3.png"></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
