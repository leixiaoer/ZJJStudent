<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/6/16
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="addavatar" method="post" enctype="multipart/form-data">
    <tr>
        <td>AID</td>
        <td><input type="text" name="aid"></td>
    </tr>
<%--    <tr>--%>
<%--        <td>photo</td>--%>
<%--        <td><input type="text" name="photo"></td>--%>
<%--    </tr>--%>
    <tr>
        <td>请上传头像:</td>
        <td><input type="file" name="img"></td>
    </tr>
    <tr>
        <td><input type="submit" value="提交"></td>
    </tr>
</form>
</body>
</html>
