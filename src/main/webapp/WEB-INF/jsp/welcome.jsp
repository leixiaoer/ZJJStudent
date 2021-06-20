<%--
  Created by IntelliJ IDEA.
  User: WanPeiChen
  Date: 2019/12/18
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.js"></script>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>系统时间</legend>
</fieldset>

<blockquote class="layui-elem-quote" id="mytime"></blockquote>

<script>
    function showTime(){
        var nowtime =new Date();
        var year=nowtime.getFullYear();
        var month=nowtime.getMonth()+1;
        var date=nowtime.getDate();
        var h = nowtime.getHours();
        var m = nowtime.getMinutes();
        var s = nowtime.getSeconds();
        document.getElementById("mytime").innerText=year+"年"+month+"月"+date+"日"+" "+h+"时"+m+"分"+s+"秒";
    }
    setInterval("showTime()",1000);
</script>
</body>
</html>
