<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../UI/CSS/bootstrap.css">
<link rel="stylesheet" href="../UI/CSS/style.css">
<script type="text/javascript" src="../UI/JS/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/TeacherWeb/UI/JS/ajaxSelect.js"></script>
<script type="text/javascript" src="/TeacherWeb/UI/JS/AdminJS.js"></script>
<script type="text/javascript" src="/TeacherWeb/UI/JS/commonUse.js"></script>
<script type="text/javascript" src="/TeacherWeb/UI/JS/bootstrap.min.js"></script>
<script type="text/javascript" src="/TeacherWeb/UI/JS/bootstrap-table.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		//防止用户直接通过路径登录
		String nickname = (String) session.getAttribute("user");
		if (session.getAttribute("user") == null) {
			request.getSession().removeAttribute("user");
			request.getSession().removeAttribute("userType");
			response.sendRedirect("../login.jsp");
		}
		String college = (String) session.getAttribute("Cname"); //获取用户的所属学院
	%>
	<input type="hidden" id="Cname" value="<%=college%>" />
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
			<li class="li-border"><a href="#" class="mystyle-color"> <%=nickname%>,您好
			</a></li>
		</ul>

		<ul class="nav navbar-nav pull-right">
			<li class="li-border"><a href="../login.jsp"
				class="mystyle-color"> 退出登录 </a></li>
		</ul>
	</div>
	</nav>
	<div class="down-main">
		<div class="left-main left-off">
			<div class="sidebar-fold">
				<span class="glyphicon glyphicon-menu-hamburger"></span>
			</div>
			<div class="subNavBox">
				<div class="sBox">
					<div class="subNav sublist-down">
						<span class="title-icon glyphicon glyphicon-chevron-down"></span><span
							class="sublist-title" style="font-size: 15px;">查询</span>
					</div>
					<ul class="navContent" style="display: block">
						<li>
							<div class="showtitle" style="width: 100px;">项目查询</div> <a
							href="../servlet/PageServlet?option=Project&teacher=teacher&option=Project&count=0"
							onclick="Projectchange()" class="active3" target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-search"></span><span
								class="sub-title">项目查询</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">论文查询</div> <a
							href="../servlet/PageServlet?option=Paper&teacher=teacher&option=Paper&count=0"
							onclick="Paperchange()" target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-search"></span><span
								class="sub-title">论文查询</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">荣誉查询</div> <a
							href="../servlet/PageServlet?option=Honor&teacher=teacher&option=Honor&count=0"
							onclick="Honorchange()" target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-search"></span><span
								class="sub-title">荣誉查询</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">专利查询</div> <a
							href="../servlet/PageServlet?option=Patent&teacher=teacher&option=Patent&count=0"
							onclick="Patentchange()" target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-search"></span><span
								class="sub-title">专利查询</span></a>
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
							href="../Teacher/Other/alterPassword.jsp" 
							target="select_frame"><span
								class="sublist-icon glyphicon  glyphicon-asterisk"></span><span
								class="sub-title">密码管理</span></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="table" class="col-md-12">

			<iframe src="" frameborder="1" class="qaq" id="select_frame"
				name="select_frame" frameborder="0" scrolling="no" width="1200px"
				height="1500px" style="border: 0;"></iframe>

		</div>

	</div>
	</div>

	</div>
</body>
</html>

</body>
</html>