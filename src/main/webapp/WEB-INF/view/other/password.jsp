<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/style.css">
    <link href="<%=request.getContextPath()%>/assets/CSS/password.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/alterPassword.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/jquery.validate.v1.3.1.js"></script>
    <title>修改密码</title>
</head>
<body>
<%
    String Tsn = (String) request.getSession().getAttribute("username");
%>
<div class="main main-bg w" style="display: block;">
    <div class="main-cont mAuto">
        <div class="box-one js-div add-top-julli hide" style="display: block;">
            <form action="${pageContext.request.contextPath}/user/changePassword.do" method="post">
                <table class="login-lf-box tables">
                    <tbody>
                    <tr>
                        <td class="red-hou">
                            原登陆密码
                            <span class="red-xiang">*</span>
                        </td>
                        <td>
                            <input class="bg-user password-add old-password" type="password" name="oldPassword">
                            <label class="js-hide-add old-error">请输入原密码</label>
                            <label class="hide">原密码不正确</label>
                        </td>
                    </tr>
                    <tr>

                        <td class="red-hou">
                            新登陆密码
                            <span class="red-xiang">*</span>
                        </td>
                        <td class="box-js">
                            <input class="bg-user password-add-add new-password" type="password" name="newPassword" value="">
                            <label class="js-hide-add new-error">6~16个字符，区分大小写</label>
                            <label class="hide">格式不正确</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="red-hou">
                            确认新密码
                            <span class="red-xiang">*</span>
                        </td>
                        <td>
                            <input class="bg-user password-add js-affirm con-password" type="password" name="">
                            <label class="js-hide-add con-error">请输入确认密码</label>
                            <!-- <label class="hide show-js-jiaoyao js-tishi-add-red">两次输入不一致</label> -->
                        </td>
                    </tr>
                    </tbody>
                </table>
                <input class="w-width-btn btn clear-add save-js" type="submit" value="修改密码">
                <input class="w-qx-btn btn clear-add" type="reset" value="取消">
            </form>
        </div>
    </div>
</div>
</body>
</html>