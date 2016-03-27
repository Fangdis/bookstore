<%--
  Created by IntelliJ IDEA.
  User: xqYang
  Date: 2016/3/26
  Time: 17:11
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
            <img src="../../resources/images/siteLogo.png">
        </a>
        <div class="cartStepBox">
            <div class="cartStepBg step1"></div>
            <ul class="caerStep clearfix">
                <li class="first active">我的购物车</li>
                <li class="second">填写核对订单信息</li>
                <li class="third">付款，完成购买</li>
            </ul>
        </div>
    </div>
</div>
<div class="mainWrapper">
    <div class="mainInner2Box">
        <div class="cartTop">
            <span class="fl totalPro">全部商品(<c:out value="${fn:length(cart)}"></c:out>)</span>
        </div>

        <div class="cartContainer">
            <form >
                <table width="100%" class="ui-table cartTable">
                    <colgroup>
                        <col width="10%"></col>
                        <col width="30%"></col>
                        <col width="15%"></col>
                        <col width="15%"></col>
                        <col width="15%"></col>
                        <col width="15%"></col>
                    </colgroup>
                    <thead>

                    <tr>
                        <th><input type="checkbox" class="quanxuan">全选</th>
                        <th>商品信息</th>
                        <th>单价（元）</th>
                        <th>数量</th>
                        <th>小计（元）</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${cart}" var="cart">
                        <tr class="goods">
                            <td class="text-left pl27"><input type="checkbox"><input type="hidden" value="${cart.id}"></td>
                            <td class="text-left">
                                <img src="${ctx}/${cart.cover}">
                                <a href="" class="productItem">${cart.name}</a>
                            </td>
                            <td>${cart.price}</td>
                            <td>
                                <a href="javascript:;" class="reduce-btn">-</a>
                                <input type="text" class="buy-num-text" value="1">
                                <a href="javascript:;" class="add-btn">+</a>
                            </td>
                            <td><fmt:formatNumber value="${cart.total*cart.price}" pattern="##.##" minFractionDigits="2"/> </td>
                            <td><a href="${ctx}/order/delete.html?id=${cart.id}" class="pink">删除</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                    <tbody class="empty">
                    <tr><td colspan="6"></td></tr>
                    </tbody>
                    <tfoot>
                    <tr>
                        <td class="text-left pl27"><input type="checkbox" class="quanxuan">全选</td>
                        <td></td>
                        <td colspan="3">商品总价（不含运费和优惠扣减）<span class="totalNum">￥0.00</span></td>
                        <td> <a  href="javascript:void(0)" class="ui-btn-pink toChargrBtn">去结算</a></td>
                    </tr>
                    </tfoot>
                </table>
            </form>
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
<script type="text/javascript" src="../../resources/js/plugs/seajs/sea.js"></script>
<script type="text/javascript">
    seajs.use("../../resources/js/index/index");
</script>
<script>
    $(document).ready(function(){
        $(".quanxuan").click(function(){
            if($(this).is(":checked")){
                $(".goods").children("td").children("input").attr("checked",true);
            }else{
                $(".goods").children("td").children("input").removeAttr("checked");
            }
            sum();
        }) ;
        function sum(){
            var total=0;
            $(".goods").children("td").children("input").each(function(){
                if ($(this).is(":checked")){
                    total+=parseFloat($(this).parent().parent().children("td").eq(4).text());
                }
            });
            $(".totalNum").text("$"+parseFloat(total).toFixed(2));
        }
        $(".goods").children("td").children("input").click(function(){
            sum();
        });
        $(".toChargrBtn").click(function(){
            var url="${ctx}/order/shopOrder";
            var size= $(".goods").children("td").children("input").length;
            var total=0;
            $(".goods").children("td").children("input").each(function(){
                if(!$(this).is(":checked"))
                    total++;
            });
            if(total==size){
                alert("没有选择商品");
                return ;
            }
            var ids="";
            $(".goods").children("td").children("input").each(function(){
                if($(this).is(":checked")){
                    ids=ids+$(this).next().val()+",";
                }
            });

            window.location.href=url+"?ids="+encodeURI(ids);
        });
    });
</script>
</body>
</html>