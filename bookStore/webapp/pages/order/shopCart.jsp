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
    <link rel="shortcut icon" type="text/css" href="../../resources/images/common/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../../resources/css/common/fontello.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/common/common.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/cart/cart.css">
    <link type="text/css" rel="stylesheet" href="../../resources/js/plugs/wx/wx.css" />
    <script type="text/javascript" src="../../resources/js/plugs/jquery/jquery-1.8.3.min.js"></script>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
    <c:if test="${sessionScope.get('user')==null}">
        <c:redirect url="${ctx}/user/loginPage"></c:redirect>
    </c:if>
</head>
<body>
<jsp:include page="${ctx}/pages/common/right.jsp"></jsp:include>
<jsp:include page="${ctx}/pages/common/head.jsp"></jsp:include>
<div class="cartTopBox">
    <div class="mainInner2Box clearfix">
        <a href="/" class="siteLogo">
            <img src="../../resources/images/common/siteLogo.png">
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
                                <a href="${ctx}/detail/detail.html?id=${cart.bookid}" class="productItem">${cart.name}</a>
                            </td>
                            <td>${cart.price}</td>
                            <td>
                                <a href="javascript:;" class="reduce-btn" id="reduceBtn">-</a>
                                <input type="text" class="buy-num-text buyNum" value="${cart.total}" name="total">
                                <a href="javascript:;" class="add-btn" id="addBtn">+</a>
                                <span style="display: none">${cart.totalBook}</span>
                                <b style="display: none">${cart.id}</b>
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
<jsp:include page="${ctx}/pages/common/foot.jsp"></jsp:include>
<script type="text/javascript" src="../../resources/js/plugs/seajs/sea.js"></script>
<script type="text/javascript">
    seajs.use("../../resources/js/index/index");
</script>

<script type="text/javascript" src="../../resources/js/plugs/wx/wx.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.config.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.upload.js"></script>
<script>
    $(document).ready(function(){
        $(".quanxuan").click(function(){
            if($(this).is(":checked")){
                $(".goods").children("td").children("input").attr("checked",true);
                sum();
            }else{
                $(".goods").children("td").children("input").removeAttr("checked");
                $(".totalNum").text("￥"+"0.00");
            }

        }) ;

        function sum(){
            var total=0;
            $(".goods").each(function(){
                var price=$(this).children("td").eq(2).text();
                var num=$(this).children("td").eq(3).children("input").val();
                var totalPrice=parseFloat(parseFloat(price).toFixed(2)*num);
                $(this).children("td").eq(4).text(totalPrice.toFixed(2));
                if($(this).children("td").children("input").is(":checked")){
                    total=total+totalPrice;
                }
            });
            $(".totalNum").text("￥"+parseFloat(total).toFixed(2));
        }

        $(".toChargrBtn").click(function(){
            var url="${ctx}/order/shopOrder";
            var size= $(".goods").children("td").children("input").length;
            var total=0;
            $(".goods").children("td").children("input").each(function(){
                if(!$(this).is(":checked"))
                    total++;
            });
            if(total==size){
                wx.alert("请选择想要结算的图书");
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
        $(".goods").children("td").children("input[type='checkbox']").click(function(){
            var total=0;
            $(".goods").children("td").children("input").each(function(){
                if($(this).is(":checked")){
                    total+=parseFloat($(this).parent().parent().children("td").eq(4).text());
                }
            });
            $(".totalNum").text("￥"+parseFloat(total).toFixed(2));
        });
        $('.reduce-btn').click(function(){
            var count = $(this).siblings("span").text();
            var cartId=$(this).siblings("b").text();
            if($(this).next().val()>1){
                $(this).next().val( $(this).next().val()-1);
                updateCart(cartId,-1);
            }
        });
        $('.add-btn').click(function(){
            var count = $(this).siblings("span").text();
            var cartId=$(this).siblings("b").text();
            if($(this).prev().val()<count){
                $(this).prev().val(Number($(this).prev().val())+1);
                 updateCart(cartId,1);
            }
        });
        function updateCart(cartId,num){
            $.get("${ctx}/order/updateCart.html",{
                "cartId":cartId,
                "num":num
            },function(data){
                sum();
            });
        }
    });
</script>
</body>
</html>