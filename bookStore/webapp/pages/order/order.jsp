<%--
  Created by IntelliJ IDEA.
  User: xqYang
  Date: 2016/3/26
  Time: 18:48
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
    <link rel="shortcut icon" type="text/css" href="../../resources/images/common/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../../resources/css/common/common.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/cart/cart.css">
    <script type="text/javascript" src="../../resources/js/plugs/jquery/jquery-1.8.3.min.js"></script>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
    <c:if test="${sessionScope.get('user')==null}">
        <c:redirect url="${ctx}/user/loginPage"></c:redirect>
    </c:if>
</head>
<body>
<ul class="rightBar">
    <li class="rightBarItem">
        <a href=""><i class="icon-basket"></i>购物车</a>
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
<div class="cartTopBox">
    <div class="mainInner2Box clearfix">
        <a href="" class="siteLogo">
            <img src="../../resources/images/common/siteLogo.png">
        </a>
        <div class="cartStepBox">
            <div class="cartStepBg step2"></div>
            <ul class="caerStep clearfix">
                <li class="first active">我的购物车</li>
                <li class="second active">填写核对订单信息</li>
                <li class="third">付款，完成购买</li>
            </ul>
        </div>
    </div>
</div>
<div class="mainWrapper">
    <div class="mainInner2Box">
        <div class="cartTop">
            <span class="fl totalPro">确认订单</span>
        </div>
        <div class="addressBox">
            <ul class="addressList">
                <c:forEach items="${addressList}" var="address">
                    <li>
                        <input type="radio" class="addressRadio"><input type="hidden" value="${address.id}">
                        <span>${address.province}${address.city}${address.streetaddress}  ${address.addressee}  ${address.contantphone}</span>

                    </li>
                </c:forEach>

                <%--<li>--%>
                    <%--<input type="radio">--%>
                    <%--<span>浙江省绍兴市越城区马山镇丽都花园  方迪  1832****983</span>--%>
                    <%--<a href="" class="fr pink">修改此地址</a>--%>
                <%--</li>--%>
            </ul>
            <ul>
                <li>  <a href="javascript:void(0)" class="fr pink" id="addressNew">新增地址</a></li>
            </ul>

                <div class="updateBox" style="display: none;">
                    <form method="post" action="${ctx}/address/add" wx-validator wx-validator-error-tag="p" wx-validator-ajax autocomplete="off"  name="addressAdd">
                        <input type="hidden" wx-validator-rule="required" name="posNum" wx-validator-param="" id="city" placeholder="" >
                        <div class="form-item">
                            <label><i class="require">*</i>所在地：</label>
                            <div  id="city_region_selector1"></div>
                            <input type="hidden" name="province" class="province">
                            <input type="hidden" name="city" class="city">
                        </div>
                        <div class="form-item">
                            <label><i class="require">*</i>街道地址：</label>
                            <input type="text" class="w450" name="streetaddress">
                        </div>
                        <div class="form-item">
                            <label><i class="require">*</i>收件人：</label>
                            <input type="text" class="w300" name="addressee">
                        </div>
                        <div class="form-item">
                            <label><i class="require">*</i>联系电话：</label>
                            <input type="text" class="w300" name="contantphone">
                            <p class="error-text"></p>
                        </div>
                        <div class="form-btn">
                            <input type="submit" value="保存并使用" class="ui-btn ui-btn-pink ui-btn-s mr10">
                            <input type="button" value="取消" class="ui-btn ui-btn-gray ui-btn-s">
                        </div>
                    </form>
                </div>
        </div>
        <form method="post" action="${ctx}/order/makeOrder">
            <input name="addressId" type="hidden" id="orderRefAddressId">
            <input name="totalPrice" type="hidden" id="orderTotalPrice">
        <div class="cartContainer">
            <table width="100%" class="ui-table cartTable">
                <colgroup>
                    <col width="40%"></col>
                    <col width="20%"></col>
                    <col width="20%"></col>
                    <col width="20%"></col>
                </colgroup>
                <thead>
                <tr>
                    <th>商品信息</th>
                    <th>单价（元）</th>
                    <th>数量</th>
                    <th>小计（元）</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${cart}" var="cart">
                    <input type="hidden" name="ids" value="${cart.id}">
                    <tr class="goods">
                        <td class="text-left pl27">
                            <img src="${ctx}/${cart.cover}">
                            <a href="" class="productItem">${cart.name}</a>
                        </td>
                        <td>${cart.price}</td>
                        <td>${cart.total}</td>
                        <td><fmt:formatNumber value="${cart.total*cart.price}" pattern="##.##" minFractionDigits="2"/></td>
                    </tr>
                </c:forEach>
                <tr class="goods">
                    <td colspan="2" class="text-left pl27">
                        <span>购买留言：</span>
                        <input type="text" placeholder="选填" class="msg-text">
                    </td>
                    <td>运费：免运费</td>
                    <td>0.00</td>
                </tr>
                </tbody>
                <tbody class="empty">
                <tr><td colspan="3"></td></tr>
                </tbody>
                <tfoot>
                <tr>
                    <td colspan="2" class="text-right"><a href="${ctx}/order/shopCart.html" class="pink">返回购物车</a></td>
                    <td>商品总价：<span class="totalNum">￥0.00</span></td>
                    <td><input type="submit" class="ui-btn-pink toChargrBtn" value="提交订单"></td>
                </tr>
                </tfoot>
            </table>
        </div>
        </form>
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
<script type="text/javascript" src="../../resources/js/plugs/seajs/sea.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/region/region.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.config.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.upload.js"></script>
<script type="text/javascript">
    seajs.use("../../resources/js/index/index");
</script>
<script>
    $("#" + "city_region_selector1").city_selector('city', '');
    $("#province").change(function(){
        $(".province").val($(this).find("option:selected").text());
    });
    $("#city").change(function(){
        $(".city").val($(this).find("option:selected").text());
    });
    function  addressAdd(data){
        if (data["status"]=="success"){
            window.location.reload(true);
        }
    }
    $(document).ready(function(){
        $("#addressNew").click(function(){
            if($(".updateBox").is(":hidden")){
                $(".updateBox").show();
            }else{
                $(".updateBox").hide();
            }
        });
        var total=0;
        $(".goods").children("td").eq(3).each(function(){
            total+=parseFloat($(this).text());
        });
        $(".totalNum").text("$"+total.toFixed(2));
        $(".goods:last").children("td").eq(2).text("$"+total.toFixed(2));
        $("#orderTotalPrice").val(total.toFixed(2));
        $(".toChargrBtn").click(function(){
//            if(isEmptyObject()){
//                alert("请选择地址");
//            }
            if($("#orderRefAddressId").val()==null||$("#orderRefAddressId").val()==""){
                alert("请选择地址");
                return false;
            }
        });
        $(".addressRadio").click(function(){
            if($(this).is(":checked")){
                $("#orderRefAddressId").val($(this).next().val());
            }
        })
    });

</script>
</body>
</html>