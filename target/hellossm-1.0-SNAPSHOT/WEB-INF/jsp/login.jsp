<%--
  Created by IntelliJ IDEA.
  User: PeiChen
  Date: 2020/2/10
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--国际化依赖-->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/usersLogin.css">
    <link rel="icon" href="${pageContext.request.contextPath}/images/favicon.ico" sizes="32x32"/>
    <link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.js"></script>
    <script src="${pageContext.request.contextPath}/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/login.js"></script>
    <title>登录页面</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/login" name="myform" method="post">
    <div id="particles-js">
        <div class="login">
            <div class="login-top">
                <from>
                    <tr>
                        <td><spring:message code="title"/></td>
                    </tr>
                </from>
            </div>
            <div class="login-center clearfix">
                <div class="login-center-img"><img src="${pageContext.request.contextPath}/images/name.png"/></div>
                <div class="login-center-input">
                    <from>
                        <tr>
                            <td><spring:message code="username"/></td>
                            <td><input type="text" id="username" name="username" placeholder="请输入您的用户名"
                                       onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的用户名'"/>
                            </td>
                        </tr>
                    </from>
                    <div class="login-center-input-text"></div>
                </div>
            </div>
            <div class="login-center clearfix">
                <div class="login-center-img"><img src="${pageContext.request.contextPath}/images/password.png"/></div>
                <div class="login-center-input">
                    <tr>
                        <td><spring:message code="password"/></td>
                        <td><input type="password" id="password" name="password" placeholder="请输入您的密码"
                                   onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的密码'"/>
                        </td>
                    </tr>
                    <div class="login-center-input-text"></div>
                </div>
            </div>
            <div class="login-button" onclick="check()">
                <tr>
                    <td><spring:message code="login"/></td>
                </tr>
            </div>
            <span style="text-align: center;color: red;"><br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;${msg}</span>
        </div>
        <div class="sk-rotating-plane"></div>
    </div>
</form>
<script src="${pageContext.request.contextPath}/js/particles.min.js"></script>
<script src="${pageContext.request.contextPath}/js/app.js"></script>
<script type="text/javascript">
    function check() {
        var username = $("#username").val().trim();
        var password = $("#password").val().trim();
        if (username == null || username == "" || username.length == 0) {
            layer.msg('请输入用户帐号');
            return false;
        }
        if (password == null || password == "" || password.length == 0) {
            layer.msg('请输入登录密码');
            return false;
        }
        if (password.length < 4 || password.length > 20) {
            layer.msg('密码格式有误（4-20位字符）');
            return false;
        }
        document.myform.submit();
    }
</script>
</body>
</html>
