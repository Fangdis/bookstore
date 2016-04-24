<%--
  Created by IntelliJ IDEA.
  User: xqYang
  Date: 2016/3/27
  Time: 17:42
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
    <link rel="stylesheet" type="text/css" href="../../resources/css/userCenter/userCenter.css">
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
<div class="siteMTopBox">
    <div class="mainInnerBox clearfix">
        <jsp:include page="${ctx}/pages/common/top.jsp" />
        <div class="basketBox">
            <span><i class="icon icon-basket"></i>购物车<i class="num">0</i>件</span><a href="../order/cart.html" class="goPayLink">去结算></a>
        </div>
    </div>
</div>
<div class="siteNavBox">
    <div class="mainInnerBox">
        <ul class="navList clearfix">
            <li class="allGoods"><a href="/">精选图书分类</a></li>
            <li><a href="/">图书首页</a></li>
            <li><a href="/">特价好书</a></li>
            <li><a href="/">新品精选</a></li>
        </ul>
    </div>
</div>
<div class="mainWrapper">
    <div class="mainInnerBox clearfix">
       <jsp:include page="common/left.jsp" />
        <div class="userWrap">
          <jsp:include page="common/user.jsp" />
            <div class="orderBox">
                <ul class="tabBox clearfix">
                    <li class="active">收货地址</li>
                    <input type="button" class="ui-btn ui-btn-pink ui-btn-m" style="float: right; margin-top: 21px;" id="addNewAddress" value="添加新地址" />
                </ul>
                <div class="tabInfo">
                    <table width="100%" class="ui-table orderTable">
                        <colgroup>
                            <col width="10%"></col>
                            <col width="15%"></col>
                            <col width="30%"></col>
                            <col width="15%"></col>
                            <col width="15%"></col>
                            <col width="15%"></col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>收件人</th>
                            <th>所在地区</th>
                            <th>详细地址</th>
                            <th>邮编</th>
                            <th>联系方式</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <c:forEach items="${addressList}" var="address">
                            <tbody>
                                <tr class="empty"><td colspan="6"></td></tr>
                                <tr class="ui-table-title">
                                    <td colspan="5"></td>
                                    <td>
                                        <a href="${ctx}/address/delete?addressId=${address.id}" class="icon icon-basket"></a>
                                    </td>
                                </tr>
                                <tr class="goods">
                                    <td>${address.addressee}</td>
                                    <td>${address.province}${address.city}</td>
                                    <td>${address.streetaddress}</td>
                                    <td>${address.code}</td>
                                    <td>${address.contantphone}</td>
                                    <td>
                                        <p><a href="javascript:;" class="pink updateAddress" >修改</a><span style="display: none">${address.id}</span><span style="display: none">${address.province}</span><span style="display: none">${address.city}</span><span style="display: none">${address.posnum}</span></p>
                                        <p><c:if test="${address.status!=1}">
                                            <a href="${ctx}/address/setMask?addressId=${address.id}" class="pink">设为默认地址</a>
                                        </c:if></p>
                                    </td>
                                </tr>
                            </tbody>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="hide-background" style="display: none;"></div>
<div class="addAddressBox" style="display: none;">
    <form method="post" action="${ctx}/address/add" wx-validator wx-validator-error-tag="p" wx-validator-ajax autocomplete="off"  name="addressAdd">
        <input id="addressId" name="id" style="display: none">
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
            <input type="hidden" name="posnum" id="city" wx-validator-rule="required" wx-validator-posnum-required="请选择地区">
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
            <input type="submit" value="保存并使用" class="ui-btn ui-btn-pink ui-btn-s mr10">
            <input type="button" value="取消" class="ui-btn ui-btn-gray ui-btn-s" id="cancelBtn">
        </div>
    </form>
</div>
<jsp:include page="${ctx}/pages/common/foot.jsp"></jsp:include>

<script type="text/javascript" src="../../resources/js/plugs/region/region.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.config.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.upload.js"></script>

<script type="text/javascript" src="../../resources/js/common.js"></script>
<script>

   // $("#" + "city_region_selector2").city_selector('city', '');
//    $("#province").change(function(){
//        $("#province_1").val($(this).find("option:selected").text());
//    });
//    $("#city").change(function(){
//        $("#city_1").val($(this).find("option:selected").text());
//        if (($(this).find("option:selected").text()) != "请选择城市") {
//            $(this).next().hide();
//        }
//    });
    function  addressAdd(data){
        if (data["status"]=="success"){
            window.location.reload(true);
        }
    }
    $("#addNewAddress").click(function(){
        $(".hide-background, .addAddressBox").show();
        $("#" + "city_region_selector1").city_selector('city', '');
        $("#province").change(function(){
            $("#province_1").val($(this).find("option:selected").text());
        });
        $("#city").change(function(){
            $("#city_1").val($(this).find("option:selected").text());
            if (($(this).find("option:selected").text()) != "请选择城市") {
                $(this).next().hide();
            }
        });
    });
    $("#cancelBtn").click(function(){
        $(".hide-background, .addAddressBox").hide();
    });
    $(".updateAddress").click(function(){
        $("#" + "city_region_selector1").city_selector('city',$(this).next().next().next().next().text() );
        $("#province").change(function(){
            $("#province_1").val($(this).find("option:selected").text());
        });
        $("#city").change(function(){
            $("#city_1").val($(this).find("option:selected").text());
            if (($(this).find("option:selected").text()) != "请选择城市") {
                $(this).next().hide();
            }
        });
        $(".hide-background, .addAddressBox").show();
        $("#addressId").val($(this).next().text());
        $("#addressee").val($(this).parent().parent().parent().children().eq(0).text());
        $("#contantphone").val($(this).parent().parent().parent().children("td").eq(4).text());
        $("#province_1").val($(this).next().next().text());
        $("#city_1").val($(this).next().next().next().text());
        $("#streetaddress").val($(this).parent().parent().parent().children("td").eq(2).text());
    });
</script>
</body>
</html>
