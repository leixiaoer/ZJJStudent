<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生管理</title>
    <script type="text/javascript" src="../../js/jquery.min.js"></script>
    <style>
        #bac {
            background-repeat: no-repeat;
            background-size: 100%;
        }

        .div1 {
            width: 1150px; /*宽度*/
            height: 600px; /*高度*/
            margin-top: 35px;
            margin-left: 168px;
            background: white;
            border: 6px solid lightgrey; /*solid 实线*/

        }

        .table {
            box-sizing: border-box;
            margin-top: 36px; /*外边距*/
            /*padding-top: 80px;*/ /*内边距*/
            margin-left: 280px;
            width: 760px; /*盒子宽度*/
            text-align: left;
        }

        .page {
            /*padding-top: 80px;*/ /*内边距*/
            margin-left: 168px;
            /*width: 760px; !*盒子宽度*!*/
            text-align: center;
        }

        .div1-1 {
            box-sizing: border-box;
            margin-top: 18px;
            margin-left: 28px;
            font-size: 24px;
            float: left;
            color: #999999;

        }

        .div1-1 a {
            text-decoration: none; /*取消超链接的下划线*/
            color: peru;
        }

        .div1-2 a {
            text-decoration: none; /*取消超链接的下划线*/
            color: pink;
        }

        #yhm, #sr, #dz {
            width: 150px;
            height: 32px;
            border: 1px solid #A6A6A6;
            /*设置边框圆角*/
            border-radius: 5px;
            padding-left: 10px;
        }


        #zc {
            box-sizing: border-box; /*取消内边距的盒子变形*/
            margin-right: 10px;
            text-align: center;
            width: 100px;
            height: 40px;
            background-color: #f0f0f0;
            border: 1px solid #FFD026;
        }


        .div1-3 {
            box-sizing: border-box; /*取消内边距的盒子变形*/
            font-size: 18px;
            margin-top: -235px;
            margin-right: 30px;
            float: right;
        }


        /*给提醒添加颜色*/
        .error {
            color: red;
        }
    </style>
    <script>
        /*
           * 分析
           *   1.给表单绑定onsubmit事件  确定按钮
           *       都为true  监听器返回true
           *       有一个false就返回false
           *   2.定义一些方法分别校验
           *   3.个各个表单绑定onblur 失去焦点事件
           * */


        //页面加载完才进行操作
        window.onload = function () {
            //1.给表单绑定onsubmit事件
            document.getElementById("form").onsubmit = function () {
                //调用用户校验方法   chekUsername();
                //调用密码校验方法   chekPassword();
                //return checkUsername() && checkPassword();

                return checkUsername() && checkPassword() && checkTwoPassword();
            }
            //给用户名和密码框分别绑定离焦事件  还有判断密码二次输入的结果
            document.getElementById("yhm").onblur = checkUsername;
            document.getElementById("mm").onblur = checkPassword;
            document.getElementById("dmm").onblur = checkTwoPassword
            // document.getElementById("验证码").onblur =Img_Check;


        }

        //校验用户名
        function checkUsername() {
            //1.获取用户名的值
            var yhm = document.getElementById("yhm").value;
            //2.定义正则表达式
            var reg_username = /^[\u4e00-\u9fa5,\w]{2,12}$/;
            //3.判断值是否符合正则的规则
            var flag = reg_username.test(yhm);
            //4.提示信息
            var s_user = document.getElementById("s_user");

            if (flag) {
                //提示绿色对勾
                s_user.innerHTML = "<img width='35' height='25' src='img/gou.png'/>";
            } else {
                //提示红色用户名有误
                s_user.innerHTML = "用户名格式有误";
            }
            return flag;
        }

        //校验密码
        function checkPassword() {
            //1.获取用户名的值
            var mm = document.getElementById("mm").value;
            //2.定义正则表达式
            var reg_password = /^\w{6,12}$/;
            //3.判断值是否符合正则的规则
            var flag = reg_password.test(mm);
            //4.提示信息
            var s_pass = document.getElementById("s_pass");

            if (flag) {
                //提示绿色对勾
                s_pass.innerHTML = "<img width='35' height='25' src='img/gou.png'/>";
            } else {
                //提示红色用户名有误
                s_pass.innerHTML = "密码格式有误";
            }
            return flag;
        }

        //确定密码
        function checkTwoPassword() {
            //获取输入值
            var dmm = document.getElementById("dmm").value;
            var mm = document.getElementById("mm").value;
            //对第一次输入密码的值和第二次进行判定
            var flag = dmm === mm;
            //定义输出判断结果类
            var s_dobpass = document.getElementById("s_dobpass");

            if (flag) {
                s_dobpass.innerHTML = "<img width='35' height='25' src='img/gou.png'/>";
            } else {
                s_dobpass.innerHTML = "密码不一致";
            }
        }
    </script>
</head>
<!-- 这次使用html + CSS制作注册页面-->
<body id="bac" background="../../img/girl.jpg">
<div class="div1">

    <div class="div1-1">
        欢迎${sessionScope.adminInfo.username}登录<br>
        <a href="/logout">退出登录</a>
    </div>

    <div class="div1-2">
        <table class="table" border="1px" style="text-align: center">
            <tr>
                <td>编号</td>
                <td>学生姓名</td>
                <td>生日</td>
                <td>地址</td>
                <td>头像</td>
                <td><a href="toadd">添加学生信息</a></td>

            </tr>
            <c:forEach items="${page.list}" var="s">
                <tr>
                    <td>${s.sid}</td>
                    <td>${s.stuName}</td>
                    <td>
                        <fmt:formatDate value="${s.birthday}" pattern="yyyy-MM-dd"></fmt:formatDate>
                    </td>
                    <td>${s.address}</td>
                    <td>
                        <%--调用方法去读取本地的图片去显示图片--%>
                        <img src="show?photo=${s.photo}" width="150px" height="150px"/>
                    </td>
                    <td>
                        <a href="load?sid=${s.sid}">修改</a>
                        <a href="delete?sid=${s.sid}">删除</a>
                        <a href="download?photo=${s.photo}">下载头像</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <p class="page">
            <input type="button" onclick="toFirst()" value="首页">
            <input type="button" onclick="toPrev()" value="上一页">
            总共${page.pages}页，当前第${page.pageNum}页，共 ${page.total}条数据。 每页
            <select class="form-control" id="pageNo" onchange="changePageSize()">
                <option>${page.pageSize}</option>

                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
            </select> 条
            <input type="button" onclick="toNext()" value="下一页">
            <input type="button" onclick="toLast()" value="尾页">
            <%-- 每页显示<input type="text" size="2" id="pageNo" value="${page.pageSize}">条记录--%>
        </p>
    </div>

</div>
<script>
    function changePageSize() {
        //获取下拉框的值
        var pageSize = $("#pageNo").val();

        //向服务器发送请求，改变没页显示条数
        location.href = "${pageContext.request.contextPath}/listpage?currentPage=1&pageSize=" + pageSize;
    }

    // 首页
    function toFirst() {
        //var pageSize=pageSize = document.getElementById("pageNo").value;
        var pageSize = $("#pageNo").val();
        location.href = "listpage?currentPage=1&pageSize=" + pageSize;
    }

    // 上一页
    function toPrev() {
        var pageSize = $("#pageNo").val();
        location.href = "listpage?currentPage=${page.prePage}&pageSize=" + pageSize;
    }

    // 下一页
    function toNext() {
        var pageSize = $("#pageNo").val();
        location.href = "listpage?currentPage=${page.nextPage}&pageSize=" + pageSize;
    }

    // 最后一页
    function toLast() {
        var pageSize = $("#pageNo").val();
        location.href = "listpage?currentPage=${page.lastPage}&pageSize=" + pageSize;
    }
</script>
</body>
</html>

