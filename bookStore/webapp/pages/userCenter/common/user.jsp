<%--
  Created by IntelliJ IDEA.
  User: xqYang
  Date: 2016/3/27
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="userInfoDetail">
    <div class="userLogo">
        <img src="${ctx}/${(sessionScope.get('user')).avatar}">
    </div>
    <div class="userInfo">
        <h2 class="userName">${(sessionScope.get('user')).nickname}</h2>
        <p>${(sessionScope.get('user')).province} ${(sessionScope.get('user')).city}</p>
    </div>
</div>
