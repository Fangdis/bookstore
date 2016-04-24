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

                        <label for="address_${index}"><input type="checkbox" class="addressRadio" id="address_${index}"> <input type="hidden" value="${address.id}">${address.province}${address.city}${address.streetaddress}  ${address.addressee}  ${address.contantphone}</label>
                    </li>
                </c:forEach>
            </ul>
            <div>
                <a href="javascript:;" class="fr pink" id="addressNew">新增地址</a>
            </div>
            <div class="updateBox" style="display: none;">
                <form method="post" action="${ctx}/address/add" wx-validator wx-validator-error-tag="p" wx-validator-ajax autocomplete="off"  name="addressAdd">
                    <div class="form-item">
                        <label><i class="require">*</i>收件人：</label>
                        <input type="text" class="w300" name="addressee" id="addressee" wx-validator-rule="required" wx-validator-addressee-required="收件人不能为空" wx-validator-placeholder="收件人">
                    </div>
                    <div class="form-item">
                        <label><i class="require">*</i>手机号码：</label>
                        <input type="text" class="w300" name="contantphone" id="contantphone" wx-validator-rule="required|mobile" wx-validator-contantphone-mobile="请输入正确的手机号码" wx-validator-contantphone-required="手机号码不能为空" wx-validator-placeholder="请输入手机号码">
                        <p class="error-text"></p>
                    </div>
                    <div class="form-item">
                        <label><i class="require">*</i>地区：</label>
                        <div  id="city_region_selector1"></div>
                        <input type="hidden" name="posNum" id="city" wx-validator-rule="required" wx-validator-posnum-required="请选择地区">
                        <input type="hidden" name="province" id="province_1">
                        <input type="hidden" name="city" id="city_1">
                    </div>
                    <div class="form-item">
                        <label><i class="require">*</i>详细地址：</label>
                        <input type="text" class="w300" name="streetaddress" id="streetaddress" wx-validator-rule="required" wx-validator-streetaddress-required="详细地址不能为空" wx-validator-placeholder="详细地址">
                    </div>
                    <div class="form-item">
                        <label><i class="require">*</i>邮政编码：</label>
                        <input type="text" class="w300" name="code" id="code" wx-validator-rule="required" wx-validator-code-required="邮政编码不能为空" wx-validator-placeholder="邮政编码">
                    </div>
                    <div class="form-btn">
                        <input type="submit" value="保存" class="ui-btn ui-btn-pink ui-btn-s mr10">
                        <input type="button" value="取消" class="ui-btn ui-btn-gray ui-btn-s" id="cancleBtn">
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
                            <a href="${ctx}/detail/detail?id=${cart.bookid}" class="productItem">${cart.name}</a>
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
<jsp:include page="${ctx}/pages/common/foot.jsp"></jsp:include>
<script type="text/javascript" src="../../resources/js/plugs/seajs/sea.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/region/region.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.config.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.upload.js"></script>

<script type="text/javascript" src="../../resources/js/common.js"></script>
<script type="text/javascript">
    seajs.use("../../resources/js/index/index");
</script>
<script>
    function  addressAdd(data){
        if (data["status"]=="success"){
            window.location.reload(true);
        }
    }
    $(document).ready(function(){
        $("#addressNew").click(function(){

            if($(".updateBox").is(":hidden")){
                $("#" + "city_region_selector1").city_selector('city', '');
                $(".updateBox").slideDown();
                $("#province").change(function(){
                    $("#province_1").val($(this).find("option:selected").text());
                });
                $("#city").change(function(){
                    $("#city_1").val($(this).find("option:selected").text());
                    if (($(this).find("option:selected").text()) != "请选择城市") {
                        $(this).next().hide();
                    }
                });
            }else{
                $(".updateBox").slideUp();
            }
        });
        $("#cancleBtn").click(function(){
            $(".updateBox").slideUp();
        });
        var total=0;
        $(".goods").each(function(){
            if ($(this).index()!=$(".goods:last").index()){
                var value=$(this).children("td").eq(3).text();
                total+=parseFloat(value);
            }
        });
        $(".totalNum").text("￥"+total.toFixed(2));
        $(".goods:last").children("td").eq(2).text("￥"+total.toFixed(2));
        $("#orderTotalPrice").val(total.toFixed(2));
        $(".toChargrBtn").click(function(){
            if($("#orderRefAddressId").val()==null||$("#orderRefAddressId").val()==""){
                wx.alert("请选择地址");
                return false;
            }
        });
        $(".addressRadio").click(function(){
            $(".addressRadio").removeAttr("checked");
           $(this).attr("checked","checked");
            $("#orderRefAddressId").val($(this).next().val());
        })
    });
</script>
</body>
</html>