<%--
  Created by IntelliJ IDEA.
  User: xqYang
  Date: 2016/3/26
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>菠萝书城</title>
    <link rel="shortcut icon" type="image/x-icon" href="../../resources/images/common/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../../resources/css/common/fontello.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/common/common.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/index/index.css">
    <script type="text/javascript" src="../../resources/js/plugs/jquery/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../../resources/js/plugs/slide/jquery.SuperSlide.2.1.1.js"></script>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
</head>
<body>
<ul class="rightBar">
    <li class="rightBarItem">
        <a href="../order/cart.html"><i class="icon-basket"></i>购物车</a>
    </li>
    <li class="rightBarItem">
        <a href=""><i class="icon-basket"></i>优惠券</a>
    </li>
    <li class="rightBarItem">
        <a href=""><i class="icon-basket"></i>优惠券</a>
    </li>
</ul>
<jsp:include page="${ctx}/pages/common/head.jsp"></jsp:include>
<div class="siteMTopBox">
    <div class="mainInnerBox clearfix">
        <a href="" class="siteLogo">
            <img src="../../resources/images/common/siteLogo.png">
        </a>
        <div class="searchBox">
            <ul class="searchTab">
                <li class="active">书名</li><li>作者</li>
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
            <span><i class="icon icon-basket"></i>购物车<i class="num">0</i>件</span><a href="../order/cart.html" class="goPayLink">去结算></a>
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
<div class="indexBanner">
    <div class="mainInnerBox clearfix">
        <ul class="subNavBox">
            <li class="subNavItem">
                <dl>
                    <dt><a href="">文艺</a></dt>
                    <dd><a href="" class="pink">小说</a><a href="">青春文学</a><a href="">传记</a></dd>
                </dl>
            </li>
            <li class="subNavItem">
                <dl>
                    <dt><a href="">少儿</a></dt>
                    <dd><a href="">儿童文学</a><a href="" class="pink">绘本</a><a href="">科普</a></dd>
                </dl>
            </li>
            <li class="subNavItem">
                <dl>
                    <dt><a href="">教育</a></dt>
                    <dd><a href="">教材</a><a href="" class="pink">外语</a><a href="">字典词典</a></dd>
                </dl>
            </li>
            <li class="subNavItem">
                <dl>
                    <dt><a href="">经管</a></dt>
                    <dd><a href="" class="pink">管理</a><a href="">经济</a><a href="">投资理财</a></dd>
                </dl>
            </li>
            <li class="subNavItem">
                <dl>
                    <dt><a href="">励志</a></dt>
                    <dd><a href="">心灵鸡汤</a><a href="" class="pink">成功学</a><a href="">职场</a></dd>
                </dl>
            </li>
            <li class="subNavItem">
                <dl>
                    <dt><a href="">生活</a></dt>
                    <dd><a href="" class="pink">旅游地图</a><a href="" class="pink">美食</a><a href="">DIY</a></dd>
                </dl>
            </li>
            <li class="subNavItem">
                <dl>
                    <dt><a href="">科技</a></dt>
                    <dd><a href="" class="pink">建筑设计</a><a href="">通信</a><a href="">医学</a></dd>
                </dl>
            </li>
            <li class="subNavItem">
                <dl>
                    <dt><a href="">艺术</a></dt>
                    <dd><a href="" class="pink">摄影</a><a href="">连环画</a><a href="" class="pink">绘画</a></dd>
                </dl>
            </li>
            <li class="subNavItem">
                <dl>
                    <dt><a href="">杂志</a></dt>
                    <dd><a href="" class="pink">美妆</a><a href="">家居装修</a><a href="">旅游</a></dd>
                </dl>
            </li>
            <li class="subNavItem">
                <dl>
                    <dt><a href="">音像</a></dt>
                    <dd><a href="">音乐</a><a href="" class="pink">动画片</a><a href="" class="pink">影视</a></dd>
                </dl>
            </li>
        </ul>
        <div class="bannerBox" id="slideBox">
            <div class="bd">
                <ul>
                    <li><a href=""><img src="../../resources/images/temp/slide/slide1.jpg" style="width: 100%; height: 410px"></a></li>
                    <li><a href=""><img src="../../resources/images/temp/slide/slide2.jpg" style="width: 100%; height: 410px;"></a></li>
                </ul>
            </div>
            <div class="hd">
                <ul><li></li><li></li></ul>
            </div>
        </div>
    </div>
</div>
<div class="mainWrapper">
    <div class="mainInnerBox">
        <div class="floorTitle">新品精选</div>
        <div class="floorBox clearfix" id="lastedList">
            <c:forEach items="${newBook}" var="newBook">
                <div class="item">
                    <a href="${ctx}/detail/detail.html?id=${newBook.id}"><img src="${ctx}/${newBook.cover}"></a>
                    <p class="money">￥<fmt:formatNumber value="${newBook.price*newBook.discount}" pattern="##.##" minFractionDigits="2" /> </p>
                    <a href="${ctx}/detail/detail.html"><p class="info">${newBook.name}</p></a>
                </div>
            </c:forEach>
        </div>
        <div class="floorTitle">特价好书</div>
        <div class="floorBox clearfix">
            <c:forEach items="${bargainBook}" var="bargainBook">
                <div class="item">
                    <a href="../detail/detail.html?id=${bargainBook.id}"><img src="${ctx}/${bargainBook.cover}"></a>
                    <p class="money">￥<fmt:formatNumber value="${bargainBook.price*bargainBook.discount}" pattern="##.##" minFractionDigits="2" /></p>
                    <a href="../detail/detail.html"><p class="info">${bargainBook.name}</p></a>
                </div>
            </c:forEach>
        </div>
        <div class="floorTitle">为你推荐</div>
        <div class="floorBox clearfix">
            <c:forEach items="${recommendBook}" var="recommendBook">
                <div class="item">
                    <a href="../detail/detail.html?id=${recommendBook.id}"><img src="${ctx}/${recommendBook.cover}"></a>
                    <p class="money">￥${recommendBook.price}</p>
                    <a href="../detail/detail.html"><p class="info">${recommendBook.name}</p></a>
                </div>
            </c:forEach>
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
                <p><a href="">在线客服</a></p>
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
            <p>版权所有&copy; 菠萝书城</p>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        $('.searchTab li').click(function(){
            $(this).addClass('active').siblings().removeClass('active');
        });
        $('#slideBox').slide({
            mainCell: '.bd ul',
            autoPlay: true
        });
        var width=$('#slideBox .hd').width();
        $('#slideBox .hd').css('margin-left', -width/2+'px');

    });
</script>
</body>
</html>