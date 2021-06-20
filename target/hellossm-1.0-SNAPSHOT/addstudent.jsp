<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>

<center>
    <h1>添加页面</h1>
    <form action="addstudent" method="post">
        <table>
            <tr>
                <td>姓名</td>
                <td><input type="text" name="sname"></td>
            </tr>
            <tr>
                <td>请上传头像：</td>
                <td><input type="text" name="avatar"></td>
            </tr>
            <tr>
                <td>sid</td>
                <td><input type="text" name="sid"></td>
            </tr>
            <tr>
                <td><input type="submit" value="提交"></td>
                <td><input type="reset" value="重置"></td>
            </tr>
        </table>
    </form>
</center>

</body>
</html>