<%--
  Created by IntelliJ IDEA.
  User: xqYang
  Date: 2016/4/3
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="left-side sidebar-offcanvas">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${ctx}/imgs/qq.png" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
                <p>Hello, Admin</p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li >
                <a href="${ctx}/product/list.html">
                    <i class="fa fa-dashboard"></i> <span>商品管理</span>
                </a>
            </li>
            <li>
                <a href="${ctx}/order/list.html">
                    <i class="fa fa-gavel"></i> <span>订单管理</span>
                </a>
            </li>
            <li>
                <a href="${ctx}/user/list.html">
                    <i class="fa fa-globe"></i> <span>用户管理</span>
                </a>
            </li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>