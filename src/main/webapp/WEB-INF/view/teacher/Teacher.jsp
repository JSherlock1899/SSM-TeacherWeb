<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/style.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxSelect.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/AdminJS.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/commonUse.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/bootstrap-table.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>

<%
    String Tname = (String) request.getSession().getAttribute("Tname"); //获取教师名
    String tsn = (String) request.getSession().getAttribute("username");//获取教师号
%>
<nav class="navbar-default navbar-fixed-top">
    <div class="navbar-header">
        <a class="navbar-brand mystyle-brand"><span
                class="glyphicon glyphicon-home"></span></a>
    </div>
    <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
            <li class="li-border"><a class="mystyle-color" href="#">管理控制台</a></li>
        </ul>
        <ul class="nav navbar-nav">
            <li class="li-border"><a href="#" class="mystyle-color"><%=Tname%>,您好
            </a></li>
        </ul>

        <ul class="nav navbar-nav pull-right">
            <li class="li-border"><a href="<%=request.getContextPath()%>/user/exitLogin.do"
                                     class="mystyle-color"> 退出登录 </a></li>
        </ul>
    </div>
</nav>

    <div class="down-main">
        <div class="left-main left-full">
            <div class="sidebar-fold">
                <span class="glyphicon glyphicon-menu-hamburger"></span>
            </div>
            <div class="subNavBox">
                <div class="sBox">
                    <div class="subNav sublist-down">
                        <span class="title-icon glyphicon glyphicon-chevron-down"></span><span
                            class="sublist-title" style="font-size:15px;">查询</span>
                    </div>
                    <ul class="navContent" style="display: block">
                        <li>
                            <div class="showtitle" style="width: 100px;">项目查询</div>
                            <a
                                    href="<%=request.getContextPath()%>/teacher/findProject.do?&tsn=<%=tsn%>"
                                    class="active3" target="select_frame"><span
                                    class="sublist-icon glyphicon glyphicon-search"></span><span
                                    class="sub-title">项目查询</span></a>
                        </li>
                        <li>
                            <div class="showtitle" style="width: 100px;">论文查询</div>
                            <a
                                    href="<%=request.getContextPath()%>/teacher/findPaper.do?&tsn=<%=tsn%>"
                                    target="select_frame" ><span
                                    class="sublist-icon glyphicon glyphicon-search"></span><span
                                    class="sub-title">论文查询</span></a>
                        </li>
                        <li>
                            <div class="showtitle" style="width: 100px;">荣誉查询</div>
                            <a
                                    href="<%=request.getContextPath()%>/teacher/findHonor.do?&tsn=<%=tsn%>"
                                    target="select_frame"><span
                                    class="sublist-icon glyphicon glyphicon-search"></span><span
                                    class="sub-title">荣誉查询</span></a>
                        </li>
                        <li>
                            <div class="showtitle" style="width: 100px;">专利查询</div>
                            <a
                                    href="<%=request.getContextPath()%>/teacher/findPatent.do?&tsn=<%=tsn%>"
                                    target="select_frame"><span
                                    class="sublist-icon glyphicon glyphicon-search"></span><span
                                    class="sub-title">专利查询</span></a>
                        </li>
                        <li>
                            <div class="showtitle" style="width: 130px;">其他成果查询</div>
                            <a
                                    href="<%=request.getContextPath()%>/teacher/findOther.do?&tsn=<%=tsn%>"
                                    target="select_frame"><span
                                    class="sublist-icon glyphicon glyphicon-search"></span><span
                                    class="sub-title">其他成果查询</span></a>
                        </li>
                    </ul>
                </div>
                <div class="sBox otherAction">
                    <div class="subNav sublist-up">
                        <span class="title-icon glyphicon glyphicon-chevron-up"></span><span
                            class="sublist-title" style="font-size:15px;">其他</span>
                    </div>
                    <ul class="navContent" style="display: none">
                        <li>
                            <div class="showtitle" style="width: 100px;">密码管理</div> <a
                                href="<%=request.getContextPath()%>/user/password.do"
                                target="select_frame"><span
                                class="sublist-icon glyphicon  glyphicon-asterisk"></span><span
                                class="sub-title">密码管理</span></a>
                        </li>
                        <li>
                            <div class="showtitle" style="width: 100px;">我的信息</div> <a
                                href="<%=request.getContextPath()%>/user/myInformation.do"
                                target="select_frame"><span
                                class="sublist-icon glyphicon glyphicon-user"></span><span
                                class="sub-title">我的信息</span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="right-product right-full select-main">
            <div class="table" class="col-md-10">
                <iframe src="<%=request.getContextPath()%>/teacher/findProject.do?&tsn=<%=tsn%>"  id="select_frame" name="select_frame"
                        frameborder="0" scrolling="no" width="1200px"
                        height="1800px"></iframe>
            </div>
        </div>
    </div>
</body>
</html>