<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加学生</title>
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
            margin-top: 80px;  /*外边距*/
            /*padding-top: 80px;*/  /*内边距*/
            margin-left: 410px;
            width: 460px; /*盒子宽度*/
            text-align: left;
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

        /*.div1-2{*/
        /*    border: 2px solid red;*/
        /*}*/

        .div1-2-left {
            text-align: right;
            height: 40px;
            width: 70px;
        }

        .div1-2-right {
            float: left;
            box-sizing: border-box;
            padding-left: 50px;
        }

        #yhm, #sr, #dz{
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

        #cz {
            box-sizing: border-box; /*取消内边距的盒子变形*/
            margin-right: 100px;
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

        .div1-3 a {
            text-decoration: none; /*取消超链接的下划线*/
            color: pink;
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
        <a href="/to_add">添加学生</a><br>
        ADD STUDENT
    </div>

    <div class="div1-2">
        <table class="table">
            <form action="add_student" method="post" enctype="multipart/form-data" id="form">
                <tr>
                    <td class="div1-2-left">学生姓名</td>
                    <td class="div1-2-right">
                        <input type="text" name="stuName" id="yhm" placeholder="请输入至少2个字符">
                        <!--添加一行 用来存储提醒信息-->
                        <span id="s_user" class="error"></span>
                    </td>
                </tr>
                <tr>
                    <td class="div1-2-left">生日</td>
                    <td class="div1-2-right">
                        <input type="date" name="birthday" id="sr">
                    </td>
                </tr>
                <tr>
                    <td class="div1-2-left">地址</td>
                    <td class="div1-2-right">
                        <input type="text" name="address" id="dz" placeholder="请输入住址">
                        <!--添加一行 用来存储提醒信息-->
                        <span id="s_dobpass" class="error"></span>
                    </td>
                </tr>
                <tr>
                    <td class="div1-2-left">头像</td>
                    <td class="div1-2-right">
                        <input type="file" name="img">
                        <!--添加一行 用来存储提醒信息-->
                        <span id="s_pass" class="error"></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="left"><input type="reset" id="cz" value="重置">
                        <input type="submit" id="zc" value="添加"></td>
                </tr>
            </form>
        </table>
    </div>

    <div class="div1-3">
        不想添加？<a href="to_main">立即返回</a>
    </div>

</div>
</body>
</html>
