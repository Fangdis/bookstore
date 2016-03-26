<%--
  Created by IntelliJ IDEA.
  User: xqYang
  Date: 2016/3/26
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../../resources/css/common/common.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/common/fontello.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/detail/detail.css">
    <script type="text/javascript" src="../../resources/js/plugs/jquery/jquery-1.8.3.min.js"></script>
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
<div class="siteHTopBox">
    <div class="mainInnerBox">
        <ul class="siteHRight fr clearfix">
            <li><a href=""><i class="icon icon-list-bullet"></i>我的订单</a></li>
            <li><a href=""><i class="icon icon-basket"></i>我的购物车 <span class="cart-num">0</span></a></li>
            <li><a href=""><i class="icon icon-chat"></i>在线客服</a></li>
            <li><a href=""><i class="icon icon-help-circled"></i>帮助中心</a></li>
        </ul>
        <ul class="siteLoginBox fr clearfix">
            <!-- 未登录 begin -->
            <!-- <li>欢迎来到HiGo，请</li>
            <li><a href="" class="pink">登录</a></li>
            <li><a href="" class="pink">免费注册</a></li> -->
            <!-- 未登录 end -->

            <!-- 已登录 begin -->
            <li><a href="">童心未泯_X</a></li>
            <li><a href="">我的收藏<i class="icon-down-dir"></i></a></li>
            <!-- 已登录 end -->
        </ul>
    </div>
</div>
<div class="siteMTopBox">
    <div class="mainInnerBox clearfix">
        <a href="" class="siteLogo">
            <img src="../../resources/images/siteLogo.png">
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
            <li><a href="">${detail.kind}</a></li>
            <li class="toNext">></li>
            <li><a href="">${detail.minkind}</a></li>
            <li class="toNext">></li>
            <li><a href="">${detail.name}</a></li>
        </ul>
        <div class="productDetailBox clearfix">
            <div class="picInfo">
                <img src="${ctx}/${detail.cover}">
                <ul class="thumbnailList clearfix">
                    <li><img src="${ctx}/${detail.picture}"></li>
                    <li><img src="${ctx}/${detail.picture}"></li>
                </ul>
            </div>
            <div class="detailInfo">
                <h1 class="title">${detail.name}</h1>
                <p class="summary">${detail.feature}</p>
                <div class="author">
                    <span>作者：${detail.author}</span>
                    <span>出版社：${detail.publish}</span>
                    <span>出版时间：${detail.publishtime} </span>
                </div>
                <div class="price">
                    <div class="evaluate">
                        <p>累计评价</p>
                        <a href="" class="pink">201</a>
                    </div>
                    <div class="detailItem clearfix">
                        <div class="left letter22">定价</div>
                        <div class="right">
                            <span class="prevPrice">￥<fmt:formatNumber value="${detail.price}" pattern="##.##" minFractionDigits="2"/> </span>
                        </div>
                    </div>
                    <div class="detailItem clearfix">
                        <div class="left letter5">京东价</div>
                        <div class="right">
                            <span class="nowPrice">¥<fmt:formatNumber value="${detail.discount*detail.price}" pattern="##.##" minFractionDigits="2"/><i>[<fmt:formatNumber value="${detail.discount*10}" pattern="##.##" minFractionDigits="2"/>折]</i></span>
                        </div>
                    </div>
                </div>
                <div class="otherinfo">
                    <div class="detailItem clearfix">
                        <div class="left letter5">配送至</div>
                        <div class="right">
                            <div class="address"><span>北京朝阳区三环以内</span><i class="icon icon-down-dir"></i></div>
                            <%--<div class="addressInfo"><span>有货</span>支持79免运费</div>--%>
                        </div>
                    </div>
                    <div class="detailItem clearfix">
                        <div class="left letter22">服务</div>
                        <div class="right">
                            <div>由"文轩网"直接销售和发货，并提供售后服务</div>
                            <div class="ad">
                                <span>正品低价<span class="space">|</span>闪电发货<span class="space">|</span>货到付款<span class="space">|</span>高效退换货</span>
                            </div>
                        </div>
                    </div>
                </div>
                <form  action="${ctx}/order/cart.html" method="post">
                    <input type="hidden" name="bookid" value="${detail.id}">
                    <input type="hidden" name="cover" value="${detail.cover}">
                    <input type="hidden" name="name" value="${detail.name}">
                    <input type="hidden" name="price" value="<fmt:formatNumber value="${detail.discount*detail.price}" pattern="##.##" minFractionDigits="2"/>">
                    <div class="detailItem clearfix">
                        <div class="left">购买数量</div>
                        <div class="right">
                            <a href="javascript:;" class="reduce-btn">-</a>
                            <input type="text" class="buy-num-text" value="1" name="total">
                            <a href="javascript:;" class="add-btn">+</a>
                        </div>
                    </div>
                     <div class="addToCart">
                        <input type="submit" class="ui-btn ui-btn-pink ui-btn-l" value="加入购物车">
                     </div>
                </form>
            </div>
        </div>
        <div class="productMainBox clearfix">
            <div class="slidebar">
                <h2 class="title">看了又看</h2>
                <ul class="productList">
                    <li>
                        <img src="../../resources/images/temp/item/items.jpg">
                        <p><a href="">别告诉我你懂PPT：全新升级版</a></p>
                        <p class="money">￥29.00</p>
                    </li>
                    <li>
                        <img src="../../resources/images/temp/item/items.jpg">
                        <p><a href="">别告诉我你懂PPT：全新升级版</a></p>
                        <p class="money">￥29.00</p>
                    </li>
                    <li>
                        <img src="../../resources/images/temp/item/items.jpg">
                        <p><a href="">别告诉我你懂PPT：全新升级版</a></p>
                        <p class="money">￥29.00</p>
                    </li>
                    <li>
                        <img src="../../resources/images/temp/item/items.jpg">
                        <p><a href="">别告诉我你懂PPT：全新升级版</a></p>
                        <p class="money">￥29.00</p>
                    </li>
                    <li>
                        <img src="../../resources/images/temp/item/items.jpg">
                        <p><a href="">别告诉我你懂PPT：全新升级版</a></p>
                        <p class="money">￥29.00</p>
                    </li>
                </ul>
            </div>
            <div class="content">
                <div class="topNav" id="topNav">
                    <ul class="tabBox clearfix">
                        <li class="active">商品介绍</li>
                        <li>商品评价<i>(6)</i></li>
                    </ul>
                    <div class="fr">
                        <input type="button" class="ui-btn-pink addCart-btn" value="加入购物车">
                    </div>
                </div>
                <div class="tabInfo" id="tab1">
                    <ul class="productDetail clearfix">
                        <li>出版社： ${detail.publish}</li>
                        <li>ISBN： ${detail.isbn}</li>
                        <li>版次：${detail.edition}</li>
                        <li>商品编码：${detail.productnumber}</li>
                        <li>包装：${detail.bookpackage}</li>
                        <li>开本：${detail.format}</li>
                        <li>出版时间：${detail.publishtime}</li>
                        <li>用纸：=${detail.paper}</li>
                        <li>页数：${detail.pages}</li>
                        <li>正文语种：${detail.booklanguage}</li>
                    </ul>
                    <div class="productIntro">
                        <h2 class="title"><span>内容简介</span></h2>
                        <div class="intro">
                            ${detail.introduction}

                        </div>
                        <h2 class="title"><span>作者简介</span></h2>
                        <div class="intro">
                            ${detail.authorinduce}
                        </div>
                        <h2 class="title"><span>产品特色</span></h2>
                        <div class="intro">
                            ${detail.producefeature}
                        </div>
                    </div>
                </div>
                <div class="tabInfo" id="tab2" style="display: none;">
                    <div class="productDetail clearfix">
                        <div class="rate">
                            <span><i>100</i>%</span>
                            <p>好评度</p>
                        </div>
                        <div class="percent">
                            <dl class="clearfix">
                                <dt>好评<span>(60%)</span></dt>
                                <dd><div style="width: 100%;"></div></dd>
                            </dl>
                            <dl class="clearfix">
                                <dt>中评<span>(10%)</span></dt>
                                <dd><div style="width: 10%;"></div></dd>
                            </dl>
                            <dl class="clearfix">
                                <dt>差评<span>(30%)</span></dt>
                                <dd><div style="width: 30%;"></div></dd>
                            </dl>
                        </div>
                        <div class="evaluate">
                            <p>您可对已购商品进行评价</p>
                            <a href="" class="ui-btn ui-btn-pink sendBtn hover">发评价拿金豆</a>
                        </div>
                    </div>
                    <div class="productIntro">
                        <table width="100%" class="ui-table evaluateList">
                            <colgroup>
                                <col width="65%"></col>
                                <col width="15%"></col>
                                <col width="10%"></col>
                                <col width="10%"></col>
                            </colgroup>
                            <thead>
                            <tr>
                                <th>评价心得</th>
                                <th>顾客满意度</th>
                                <th>购买信息</th>
                                <th>评论者</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="goods">
                                <td class="text-left">
                                    <p>略微几次见过苏更生，确实表现出“记者”人格，总是开朗、有趣的，和文中描写的女性，完全不同。就像她在序中所说，在写作时，她会让开朗、热情的人格走远些，变成一个固执、冷静的人。苏更生的小故事，透出来的总有一丝丝寒意，也许和在夜晚失眠时写成有关。这些小说中挣扎的人儿，小心翼翼地掩藏着心中的波动和感受，选择对抗、沉默和离开。苏更生不吝惜自我剖析，她没有女孩儿们都有的小小心思，是真诚的问答。确实十分爽利。心情不好的时候，看完之后就更加阴郁了，还是阳光猛烈，正能量爆表的时候拿来慢慢回味，总能让人抓到寒意背后隐藏的感动和柔善。 </p>
                                </td>
                                <td>五颗星</td>
                                <td>--</td>
                                <td>匿名</td>
                            </tr>
                            <tr class="goods">
                                <td class="text-left">
                                    <p>略微几次见过苏更生，确实表现出“记者”人格，总是开朗、有趣的，和文中描写的女性，完全不同。就像她在序中所说，在写作时，她会让开朗、热情的人格走远些，变成一个固执、冷静的人。苏更生的小故事，透出来的总有一丝丝寒意，也许和在夜晚失眠时写成有关。这些小说中挣扎的人儿，小心翼翼地掩藏着心中的波动和感受，选择对抗、沉默和离开。苏更生不吝惜自我剖析，她没有女孩儿们都有的小小心思，是真诚的问答。确实十分爽利。心情不好的时候，看完之后就更加阴郁了，还是阳光猛烈，正能量爆表的时候拿来慢慢回味，总能让人抓到寒意背后隐藏的感动和柔善。 </p>
                                </td>
                                <td>五颗星</td>
                                <td>--</td>
                                <td>匿名</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
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
<script type="text/javascript">
    $(document).ready(function(){
        $(".tabBox li").each(function(index,domEle){
            $(domEle).click(function(){
                $(this).addClass("active").siblings().removeClass("active");
                $(".tabInfo").hide();
                $("#tab"+Math.floor(index+1)).show();
            });
        });
        $(window).scroll(function(){
            var scrollTop = $(window).scrollTop();
            scrollTop > 713 ? $("#topNav").addClass("ui-fixed") : $("#topNav").removeClass("ui-fixed");
        });
    });
</script>
</body>
</html>