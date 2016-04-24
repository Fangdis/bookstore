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
    <!-- jQuery 2.0.2 -->
    <script type="text/javascript" src="../../resources/js/plugs/jquery/jquery-1.8.3.min.js"></script>
    <!-- Bootstrap -->
    <script type="text/javascript" src="../../resources/js/plugs/bootstrap/bootstrap.min.js"></script>
    <!-- Director App -->
    <script type="text/javascript" src="../../resources/js/plugs/director/app.js"></script>

    <script type="text/javascript" src="../../resources/js/plugs/wx/wx.js"></script>
    <script type="text/javascript" src="../../resources/js/plugs/wx/wx.config.js"></script>
    <script type="text/javascript" src="../../resources/js/plugs/wx/wx.upload.js"></script>
    <c:if test="${sessionScope.get('user')==null}">
        <c:redirect url="${ctx}/user/loginPage"></c:redirect>
    </c:if>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
    <script>
        var minKind=[ "小说,传记,动漫,散文", "卡通,绘本,科普百科",  "教材,外语,字典,考试","管理,经济,投资,股票", "社交,心灵鸡汤,职场",  "家居,美食,出行,服饰",  "建筑,医学,农业,电子", "摄影,设计,绘画,音乐","美妆,时尚,数码,影视","音乐,卡通,动漫影视"];
    </script>
</head>
<body class="skin-black">
<jsp:include page="${ctx}/pages/common/head.jsp"></jsp:include>
<div class="wrapper row-offcanvas row-offcanvas-left">
  <jsp:include page="${ctx}/pages/common/left.jsp"></jsp:include>
    <aside class="right-side">
        <!-- Main content -->
        <section class="content">
            <div class="panel">
                <form action="${ctx}/product/add.html" method="post" class="form-horizontal" style="padding: 50px 0 50px 90px;">
                    <input name="id" value="${book.id}" type="hidden">
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label class="col-md-10">一级分类</label>
                            <div class="col-md-10">
                                <select class="form-control selectOption" name="kind" >
                                    <c:forEach items="${kind}" var="kind">
                                        <option value="${kind}" class="optionKind">${kind}</option>
                                    </c:forEach>
                                </select>
                                <script>
                                    $(document).ready(function(){
                                        $(".selectOption option[value='${book.kind}']").attr("selected","selected");
                                    });
                                </script>
                            </div>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-md-10">二级分类</label>
                            <div class="col-md-10">
                                <select class="form-control minKindSelect" name="minkind">
                                    <option value="文学">文学</option>
                                </select>
                                <script>
                                    $(document).ready(function(){
                                        var index=$(".selectOption option[value='${book.kind}']").index();
                                        var str= minKind[index];
                                        var minKinValue=str.split(",");
                                        $(".minKindSelect").html("");
                                        for(var i=0;i<minKinValue.length;i++){
                                            $(".minKindSelect").append("<option value='"+minKinValue[i]+"' class='optionKind'>"+minKinValue[i]+"</option>");
                                        }
                                        $(".minKindSelect option[value='${book.minkind}']").attr("selected","selected");
                                    });
                                </script>
                            </div>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-md-10">类别</label>
                            <div class="col-md-10">
                                <select class="form-control bookTypeOption" name="bookType" >
                                    <option value="1">新品精选</option>
                                    <option value="2">特价好书</option>
                                </select>
                                <script>
                                    $(document).ready(function(){
                                        console.log("${book.bookType}");
                                        $(".bookTypeOption option[value='${book.bookType}']").attr("selected","selected");
                                    });
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label class="col-md-10">书名</label>
                            <div class="col-md-10">
                                <input type="text" placeholder="书名" name="name" class="form-control col-md-10" value="${book.name}">
                            </div>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-md-10">作者</label>
                            <div class="col-md-10">
                                <input type="text" placeholder="作者" name="name" class="form-control" value="${book.author}">
                            </div>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-md-10">ISBN</label>
                            <div class="col-md-10">
                                <input type="text" placeholder="ISBN" name="isbn" class="form-control" value="${book.isbn}">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label class="col-md-10">出版社</label>
                            <div class="col-md-10">
                                <input type="text" placeholder="出版社" name="publish" class="form-control"  value="${book.publish}">
                            </div>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-md-10">出版时间</label>
                            <div class="col-md-10">
                                <input type="date" placeholder="出版时间" name="publishtime" class="form-control" value="${book.publishtime}">
                            </div>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-md-10">版次</label>
                            <div class="col-md-10">
                                <input type="text" placeholder="版次" name="edition" class="form-control"  value="${book.edition}">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label class="col-md-10">单价</label>
                            <div class="col-md-10">
                                <input type="text" placeholder="单价"  name="price" class="form-control" value="${book.price}">
                            </div>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-md-10">折扣</label>
                            <div class="col-md-10">
                                <input type="text" placeholder="折扣" name="discount" class="form-control" value="${book.discount}">
                            </div>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-md-10">总量</label>
                            <div class="col-md-10">
                                <input type="text" placeholder="总量" name="total" class="form-control" value="${book.total}">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label class="col-md-10">商品编码</label>
                            <div class="col-md-10">
                                <input type="text" placeholder="商品编码" name="productnumber" class="form-control"   value="${book.productnumber}">
                            </div>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-md-10">包装</label>
                            <div class="col-md-10">
                                <select class="form-control bookpackageOption " name="bookpackage">
                                    <option value="平装">平装</option>
                                    <option value="精装">精装</option>
                                </select>
                                <script>
                                    $(document).ready(function(){
                                        $(".bookpackageOption option[value='${book.bookpackage}']").attr("selected","selected");
                                    });
                                </script>
                                <%--<input type="text" placeholder="包装" name="bookpackage" class="form-control" value="${book.bookpackage}">--%>
                            </div>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-md-10">开本</label>
                            <div class="col-md-10">
                                <select class="form-control formatOption" name="format">
                                    <option value="16开">16开</option>
                                    <option value="24开">24开</option>
                                    <option value="32开">32开</option>
                                </select>
                                <script>
                                    $(document).ready(function(){
                                        $(".formatOption option[value='${book.format}']").attr("selected","selected");
                                    });
                                </script>
                                <%--<input type="text" placeholder="开本" name="format" class="form-control" value="${book.format}">--%>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label class="col-md-10">用纸</label>
                            <div class="col-md-10">
                                <select class="form-control paperOption" name="paper">
                                    <option value="纯质纸">纯质纸</option>
                                    <option value="胶版纸">胶版纸</option>
                                    <option value="铜版纸">铜版纸</option>
                                    <option value="铜版纸">轻涂纸</option>
                                    <option value="哑粉纸">哑粉纸</option>
                                    <option value="白板纸">白板纸</option>
                                    <option value="特种纸">特种纸</option>
                                </select>
                                <script>
                                    $(document).ready(function(){
                                        $(".paperOption option[value='${book.paper}']").attr("selected","selected");
                                    });
                                </script>

                                <%--<input type="text" placeholder="用纸" name="paper" class="form-control" value="${book.paper}">--%>
                            </div>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-md-10">页数</label>
                            <div class="col-md-10">
                                <input type="text" placeholder="页数" name="pages" class="form-control" value="${book.pages}">
                            </div>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-md-10">正文语种</label>
                            <div class="col-md-10">
                                <input type="text" placeholder="正文语种" name="booklanguage" class="form-control" value="${book.booklanguage}">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label class="col-md-10">图书简介</label>
                            <div class="col-md-10">
                                <textarea class="form-control" name="feature" rows="5">${book.feature}</textarea>
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="col-md-10">内容介绍</label>
                            <div class="col-md-10">
                                <textarea class="form-control" name="introduction" rows="5">${book.introduction}</textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label class="col-md-10">作者介绍</label>
                            <div class="col-md-10">
                                <textarea class="form-control" name="authorinduce" rows="5"> ${book.authorinduce}</textarea>
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="col-md-10">图书特色</label>
                            <div class="col-md-10">
                                <textarea class="form-control" name="producefeature" rows="5">${book.producefeature}</textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label class="col-md-10">封面：</label>
                            <div class="updateLogo col-md-10">
                                <div  class="col-md-3">
                                    <img src="${ctx}${book.cover}" id="userImg" width="80" height="80">
                                </div>
                                <input type="hidden" name="cover" id="coverImg" value="${book.cover}">
                                <div class="updateLogoInfo col-md-9">
                                    <div class="updateLogoBtn">
                                        <input wx-upload-size="40" wx-upload-type="image/bmp,image/png,image/gif,image/jpeg" type="file" wx-upload="/admin/upLoadPhoto" name="file" value="" wx-upload-assign="upload_bp=data.fileUrl" wx-upload-set="upload_bp_doc=data.fileUrl" hidefocus="true" wx-upload-param="type=cover" accept="image/jpeg,image/x-png,image/gif,image/x-ms-bmp">
                                        <input type="button" class="btn btn-primary" value="选择图片">
                                    </div>
                                    <p>支持JPG,JPEG,GIF,PNG,BMP格式，且不超过5M</p>
                                </div>
                            </div>
                        </div>
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
    $(document).ready(function(){
        $(".selectOption").change(function(){
            var index=$(".selectOption option:checked").index();
            var str= minKind[index];
            var minKinValue=str.split(",");
            $(".minKindSelect").html("");

            for(var i=0;i<minKinValue.length;i++){
                $(".minKindSelect").append("<option value='"+minKinValue[i]+"' class='optionKind'>"+minKinValue[i]+"</option>");
            }
        });
    });
</script>

</body>
</html>
