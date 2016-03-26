<%--
  Created by IntelliJ IDEA.
  User: xqYang
  Date: 2016/3/26
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../../resources/css/common/common.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/common/fontello.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/userCenter/userCenter.css">
    <script type="text/javascript" src="../../resources/js/plugs/jquery/jquery-1.8.3.min.js"></script>
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
            <li><a href="../order/cart.html"><i class="icon icon-basket"></i>我的购物车 <span class="cart-num">0</span></a></li>
            <li><a href=""><i class="icon icon-chat"></i>在线客服</a></li>
            <li><a href=""><i class="icon icon-help-circled"></i>帮助中心</a></li>
        </ul>
        <ul class="siteLoginBox fr clearfix">
            <!-- 未登录 begin -->
            <li>欢迎来到HiGo，请</li>
            <li><a href="../login/login.html" class="pink">登录</a></li>
            <li><a href="../login/register.html" class="pink">免费注册</a></li>
            <!-- 未登录 end -->

            <!-- 已登录 begin -->
            <!-- <li><a href="">童心未泯_X</a></li>
            <li><a href="">我的收藏<i class="icon-down-dir"></i></a></li> -->
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
<div class="mainWrapper">
    <div class="mainInnerBox clearfix">
        <div class="leftNav">
            <ul class="leftNavItem">
                <h3 class="leftNavTitle">我的</h3>
                <li><a href="myOrder.html">我的订单</a></li>
                <li><a href="myEvaluate.html">我的评价</a></li>
                <li><a href="../order/cart.html">我的购物车</a></li>
            </ul>
            <ul class="leftNavItem">
                <h3 class="leftNavTitle">设置</h3>
                <li><a href="myAddress.html">收货地址</a></li>
                <li><a href="myPassword.html">修改密码</a></li>
                <li class="active"><a href="myInformation.html">个人资料</a></li>
            </ul>
        </div>
        <div class="userWrap">
            <div class="userInfoDetail">
                <div class="userLogo">
                    <img src="../../resources/images/mrLogo.png">
                </div>
                <div class="userInfo">
                    <h2 class="userName">童心未泯_X</h2>
                    <p>浙江  杭州</p>
                </div>
            </div>
            <div class="orderBox">
                <ul class="tabBox clearfix">
                    <li class="active">个人资料</li>
                </ul>
                <div class="tabInfo">
                    <form class="updatePswForm">
                        <div class="form-item">
                            <label><i class="require">*</i>手机：</label>
                            <input type="text" value="18329027983" class="w300" readonly>
                            <p class="error-text"></p>
                        </div>
                        <div class="form-item">
                            <label><i class="require">*</i>头像：</label>
                            <div class="updateLogo">
                                <img src="../../resources/images/mrLogo.png">
                                <div class="updateLogoInfo">
                                    <div class="updateLogoBtn">
                                        <input type="file" value="选择图片">
                                        <input type="button" class="ui-btn ui-btn-pink ui-btn-xs" value="选择图片">
                                    </div>
                                    <p>支持JPG,JPEG,GIF,PNG,BMP格式，且不超过5M</p>
                                </div>
                            </div>
                            <p class="error-text"></p>
                        </div>
                        <div class="form-item">
                            <label><i class="require">*</i>昵称：</label>
                            <input type="text" placeholder="请输入有效昵称" class="w300">
                            <p class="error-text"></p>
                        </div>
                        <div class="form-item">
                            <label><i class="require">*</i>性别：</label>
                            <span class="sex"><input type="radio">女</span>
                            <span class="sex"><input type="radio">男</span>
                            <span class="sex"><input type="radio">保密</span>
                            <p class="error-text"></p>
                        </div>
                        <div class="form-item">
                            <label><i class="require">*</i>城市：</label>
                            <select class="w150 mr10"></select>
                            <select class="w150"></select>
                            <p class="error-text"></p>
                        </div>
                        <div class="form-item">
                            <label><i class="require">*</i>简介：</label>
                            <textarea class="summary"></textarea>
                            <p class="error-text"></p>
                        </div>
                        <div class="form-btn">
                            <input type="submit" value="保存" class="ui-btn ui-btn-pink ui-btn-m">
                        </div>
                    </form>
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
</body>
</html>
