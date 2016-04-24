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

    <link type="text/css" rel="stylesheet" href="../../resources/js/plugs/wx/wx.css" />
    <script type="text/javascript" src="../../resources/js/plugs/jquery/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../../resources/js/plugs/slide/jquery.SuperSlide.2.1.1.js"></script>
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
            <li><a href="#">图书首页</a></li>
            <li><a href="#tab1">新品精选</a></li>
            <li><a href="#tab2">特价好书</a></li>
        </ul>
    </div>
</div>
<div class="indexBanner">
    <div class="mainInnerBox clearfix">
        <ul class="subNavBox">
            <li class="subNavItem">
                <dl>
                    <dt><a href="${ctx}/product/list?kind=文学">文学</a></dt>
                    <dd>
                        <a href="${ctx}/product/list?kind=文艺&minKind=小说" class="pink">小说</a><a href="${ctx}/product/list?kind=文艺&minKind=青春文学">传记</a><a href="${ctx}/product/list?kind=文艺&minKind=传记">动漫</a><a href="${ctx}/product/list?kind=文艺&minKind=传记" class="pink">散文</a>
                    </dd>
                </dl>
            </li>
            <li class="subNavItem">
                <dl>
                    <dt><a href="${ctx}/product/list?kind=少儿">少儿</a></dt>
                    <dd><a href="${ctx}/product/list?kind=少儿&minKind=卡通">卡通</a><a href="${ctx}/product/list?kind=少儿&minKind=绘本" class="pink">绘本</a><a href="${ctx}/product/list?kind=少儿&minKind=科普百科">科普百科</a></dd>
                </dl>
            </li>
            <li class="subNavItem">
                <dl>
                    <dt><a href="${ctx}/product/list?kind=教育">教育</a></dt>
                    <dd><a href="${ctx}/product/list?kind=教育&minKind=教材">教材</a><a href="${ctx}/product/list?kind=教育&minKind=外语" class="pink">外语</a><a href="${ctx}/product/list?kind=教育&minKind=字典">字典</a><a href="${ctx}/product/list?kind=教育&minKind=考试">考试</a></dd>
                </dl>
            </li>
            <li class="subNavItem">
                <dl>
                    <dt><a href="${ctx}/product/list?kind=经管">经管</a></dt>
                    <dd><a href="${ctx}/product/list?kind=经管&minKind=管理" class="pink">管理</a><a href="${ctx}/product/list?kind=经管&minKind=经济">经济</a><a href="${ctx}/product/list?kind=经管&minKind=投资">投资</a><a href="${ctx}/product/list?kind=经管&minKind=股票" class="pink">股票</a></dd>
                </dl>
            </li>
            <li class="subNavItem">
                <dl>
                    <dt><a href="${ctx}/product/list?kind=励志">励志</a></dt>
                    <dd><a href="${ctx}/product/list?kind=社交">社交</a><a href="${ctx}/product/list?kind=心灵鸡汤" class="pink">心灵鸡汤</a><a href="${ctx}/product/list?kind=职场">职场</a></dd>
                </dl>
            </li>
            <li class="subNavItem">
                <dl>
                    <dt><a href="${ctx}/product/list?kind=生活">生活</a></dt>
                    <dd><a href="${ctx}/product/list?kind=生活&minKind=家居" class="pink">家居</a><a href="${ctx}/product/list?kind=生活&minKind=美食" class="pink">美食</a><a href="${ctx}/product/list?kind=生活&minKind=出行">出行</a><a href="${ctx}/product/list?kind=生活&minKind=服饰">服饰</a></dd>
                </dl>
            </li>
            <li class="subNavItem">
                <dl>
                    <dt><a href="${ctx}/product/list?kind=科技">科技</a></dt>
                    <dd><a href="${ctx}/product/list?kind=科技&minKind=建筑">建筑</a><a href="${ctx}/product/list?kind=科技&minKind=医学">医学</a><a href="${ctx}/product/list?kind=科技&minKind=农业">农业</a><a href="${ctx}/product/list?kind=科技&minKind=电子">电子</a></dd>
                </dl>
            </li>
            <li class="subNavItem">
                <dl>
                    <dt><a href="${ctx}/product/list?kind=艺术">艺术</a></dt>
                    <dd><a href="${ctx}/product/list?kind=艺术&minKind=摄影" class="pink">摄影</a><a href="${ctx}/product/list?kind=艺术&minKind=设计">设计</a><a href="${ctx}/product/list?kind=艺术&minKind=绘画" class="pink">绘画</a><a href="${ctx}/product/list?kind=艺术&minKind=音乐">音乐</a></dd>
                </dl>
            </li>
            <li class="subNavItem">
                <dl>
                    <dt><a href="${ctx}/product/list?kind=杂志">杂志</a></dt>
                    <dd><a href="${ctx}/product/list?kind=杂志&minKind=美妆" class="pink">美妆</a><a href="${ctx}/product/list?kind=杂志&minKind=时尚">时尚</a><a href="${ctx}/product/list?kind=杂志&minKind=数码">数码</a><a href="${ctx}/product/list?kind=杂志&minKind=影视">影视</a></dd>
                </dl>
            </li>
            <li class="subNavItem">
                <dl>
                    <dt><a href="${ctx}/product/list?kind=音像">音像</a></dt>
                    <dd><a href="${ctx}/product/list?kind=音像&minKind=音乐">音乐</a> <a href="${ctx}/product/list?kind=音像&minKind=卡通动漫" class="pink">卡通动漫</a><a href="${ctx}/product/list?kind=音像&minKind=影视" class="pink">影视</a></dd>
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
        <div class="floorTitle" name="tab1" id="tab1">新品精选</div>
        <div class="floorBox clearfix" id="lastedList">
            <c:forEach items="${newBook}" var="newBook">
                <div class="item">
                    <a href="${ctx}/detail/detail.html?id=${newBook.id}"><img src="${ctx}/${newBook.cover}"></a>
                    <p class="money">￥<fmt:formatNumber value="${newBook.price*newBook.discount}" pattern="##.##" minFractionDigits="2" /> </p>
                    <a href="${ctx}/detail/detail.html"><p class="info">${newBook.name}</p></a>
                </div>
            </c:forEach>
        </div>
        <div class="floorTitle" name="tab2" id="tab2">特价好书</div>
        <div class="floorBox clearfix">
            <c:forEach items="${bargainBook}" var="bargainBook">
                <div class="item">
                    <a href="../detail/detail.html?id=${bargainBook.id}"><img src="${ctx}/${bargainBook.cover}"></a>
                    <p class="money">￥<fmt:formatNumber value="${bargainBook.price*bargainBook.discount}" pattern="##.##" minFractionDigits="2" /></p>
                    <a href="../detail/detail.html"><p class="info">${bargainBook.name}</p></a>
                </div>
            </c:forEach>
        </div>
        <!--
        <div class="floorTitle">为您推荐</div>
        <div class="floorBox clearfix">
            <c:forEach items="${recommendBook}" var="recommendBook">
                <div class="item">
                    <a href="../detail/detail.html?id=${recommendBook.id}"><img src="${ctx}/${recommendBook.cover}"></a>
                    <p class="money">￥${recommendBook.price}</p>
                    <a href="../detail/detail.html"><p class="info">${recommendBook.name}</p></a>
                </div>
            </c:forEach>
        </div>
        -->
    </div>
</div>
<jsp:include page="${ctx}/pages/common/foot.jsp"></jsp:include>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.config.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.upload.js"></script>
<script type="text/javascript" src="../../resources/js/common.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
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