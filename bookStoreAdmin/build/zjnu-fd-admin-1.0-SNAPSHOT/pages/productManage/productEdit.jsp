<%--
  Created by IntelliJ IDEA.
  User: xqYang
  Date: 2016/4/3
  Time: 19:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>菠萝书城 | 后台管理平台</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- bootstrap 3.0.2 -->

    <link rel="stylesheet" type="text/css" href="../../resources/js/plugs/bootstrap/bootstrap.min.css" />
    <!-- font Awesome -->
    <link rel="stylesheet" type="text/css" href="../../resources/font/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="../../resources/css/admin/admin.css" />
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
    <style>
        .updateLogo {
            display: inline-block;
        }.updateLogo .updateLogoInfo {
             margin-left: 80px;
         }.updateLogo .updateLogoBtn {
              position: relative;
              overflow: hidden;
              width: 80px;
              margin: 5px 0 10px;
          }.updateLogoInfo input[type="file"] {
               font-size: 100px;
               position: absolute;
               top: 0;
               right: 0;
               display: block;
               height: 30px;
               cursor: pointer;
               opacity: 0;
               filter: alpha(opacity=0);
               -moz-opacity: 0;
           }button, input[type="button"], input[type="reset"], input[type="submit"], input[type="file"] {
                cursor: pointer;
                -webkit-appearance: button;
                border: none;
            }
    </style>
</head>
<body class="skin-black">
<jsp:include page="${ctx}/pages/common/head.jsp"></jsp:include>
<div class="wrapper row-offcanvas row-offcanvas-left">
  <jsp:include page="${ctx}/pages/common/left.jsp"></jsp:include>
    <aside class="right-side">
        <!-- Main content -->
        <section class="content">
            <div class="panel">
                <form class="addForm" action="${ctx}/product/add.html" method="post">
                    <input name="id" value="${book.id}" type="hidden">
                    <div class="row">
                        <div class="form-item col-md-6">
                            <label><i class="require">*</i>一级分类</label>
                            <select class="w250" name="kind">
                                <option value="文学">文学</option>
                            </select>
                        </div>
                        <div class="form-item col-md-6">
                            <label><i class="require">*</i>二级分类</label>
                            <select class="w250" name="minkind">
                                <option value="文学">文学</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-item col-md-6">
                            <label><i class="require">*</i>书名</label>
                            <input type="text" placeholder="书名" name="name" class="w250" value="${book.name}">
                        </div>
                        <div class="form-item col-md-6">
                            <label><i class="require">*</i>作者</label>
                            <input type="text" placeholder="作者" name="author" class="w250"  value="${book.author}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-item col-md-6">
                            <label><i class="require">*</i>出版社</label>
                            <input type="text" placeholder="出版社" name="publish" class="w250"  value="${book.publish}">
                        </div>
                        <div class="form-item col-md-6">
                            <label><i class="require">*</i>出版时间</label>
                            <input type="text" placeholder="出版时间" name="publishtime" class="w250" value="${book.publishtime}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-item col-md-6">
                            <label><i class="require">*</i>单价</label>
                            <input type="text" placeholder="单价"  name="price" class="w250" value="${book.price}">
                        </div>
                        <div class="form-item col-md-6">
                            <label><i class="require">*</i>折扣</label>
                            <input type="text" placeholder="折扣" name="discount" class="w250" value="${book.discount}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-item col-md-6">
                            <label><i class="require">*</i>总量</label>
                            <input type="text" placeholder="总量" name="total" class="w250" value="${book.total}">
                        </div>
                        <div class="form-item col-md-6">
                            <label><i class="require">*</i>ISBN</label>
                            <input type="text" placeholder="ISBN" name="isbn" class="w250" value="${book.isbn}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-item col-md-6">
                            <label><i class="require">*</i>版次</label>
                            <input type="text" placeholder="版次" name="edition" class="w250"  value="${book.edition}">
                        </div>
                        <div class="form-item col-md-6">
                            <label><i class="require">*</i>商品编码</label>
                            <input type="text" placeholder="商品编码" name="productnumber" class="w250"   value="${book.productnumber}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-item col-md-6">
                            <label><i class="require">*</i>包装</label>
                            <input type="text" placeholder="包装" name="bookpackage" class="w250" value="${book.bookpackage}">
                        </div>
                        <div class="form-item col-md-6">
                            <label><i class="require">*</i>开本</label>
                            <input type="text" placeholder="开本" name="format" class="w250" value="${book.format}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-item col-md-6">
                            <label><i class="require">*</i>用纸</label>
                            <input type="text" placeholder="用纸" name="paper" class="w250" value="${book.paper}">
                        </div>
                        <div class="form-item col-md-6">
                            <label><i class="require">*</i>页数</label>
                            <input type="text" placeholder="页数" name="pages" class="w250" value="${book.pages}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-item col-md-6">
                            <label><i class="require">*</i>正文语种</label>
                            <input type="text" placeholder="正文语种" name="booklanguage" class="w250" value="${book.booklanguage}">
                        </div>
                        <div class="form-item col-md-6">
                            <label><i class="require">*</i>图书特色</label>
                            <input type="text" placeholder="图书特色" name="feature" class="w250" value="${book.feature}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-item col-md-12">
                            <label><i class="require">*</i>内容简介</label>
                            <textarea class="w500 h100" name="introduction">${book.introduction}</textarea>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-item col-md-12">
                            <label><i class="require">*</i>作者简介</label>
                            <textarea class="w500 h100" name="authorinduce"> ${book.authorinduce}</textarea>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-item col-md-12">
                            <label><i class="require">*</i>产品特色</label>
                            <textarea class="w500 h100" name="producefeature">${book.producefeature}</textarea>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-item col-md-12">
                            <label><i class="require">*</i>封面：</label>
                            <div class="updateLogo">
                                <img src="${ctx}${book.cover}" id="userImg" >
                                <input type="hidden" name="cover" id="coverImg" value="${book.cover}">
                                <div class="updateLogoInfo">
                                    <div class="updateLogoBtn">
                                        <input wx-upload-size="40" wx-upload-type="image/bmp,image/png,image/gif,image/jpeg" type="file" wx-upload="/admin/upLoadPhoto" name="file" value="" wx-upload-assign="upload_bp=data.fileUrl" wx-upload-set="upload_bp_doc=data.fileUrl" hidefocus="true" wx-upload-param="type=cover" accept="image/jpeg,image/x-png,image/gif,image/x-ms-bmp">


                                        <input type="button" class="ui-btn ui-btn-pink ui-btn-xs" value="选择图片">
                                    </div>
                                    <p>支持JPG,JPEG,GIF,PNG,BMP格式，且不超过5M</p>
                                </div>
                            </div>
                        </div>
                        <p class="error-text"></p>
                    </div>
                    <div class="form-btn">
                        <input type="submit" value="保存" class="btn btn-primary" />
                    </div>

                </form>
            </div>
        </section><!-- /.content -->
        <div class="footer-main">
            版权所有&copy; 菠萝书城
        </div>
    </aside><!-- /.right-side -->
</div><!-- ./wrapper -->
<!-- jQuery 2.0.2 -->
<script type="text/javascript" src="../../resources/js/plugs/jquery/jquery-1.8.3.min.js"></script>
<!-- Bootstrap -->
<script type="text/javascript" src="../../resources/js/plugs/bootstrap/bootstrap.min.js"></script>
<!-- Director App -->
<script type="text/javascript" src="../../resources/js/plugs/director/app.js"></script>

<script type="text/javascript" src="../../resources/js/plugs/wx/wx.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.config.js"></script>
<script type="text/javascript" src="../../resources/js/plugs/wx/wx.upload.js"></script>
<script>
    function file(data){
        $("#userImg").attr("src",data["data"]["pojos"]["filePath"]);
        $("#coverImg").val(data["data"]["pojos"]["filePath"]);
    }
</script>
</body>
</html>
