<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.slxy.edu.model.Admin" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/style.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajaxSelect.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/AdminJS.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/commonUse.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/bootstrap-table.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		Admin admin = (Admin) request.getAttribute("admin");
		String Cname = (String) request.getAttribute("Cname");	//获取用户的所属学院
		String grade = admin.getAgrad();	//获取用户的权限等级
		String Aname = admin.getUsername(); //获取管理员名
	%>
	<input type="hidden" id="Cname" value="<%=Cname %>"/>
	<input type="hidden" id="grade" value="<%=grade %>"/>
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
			<li class="li-border"><a href="#" class="mystyle-color"><%=Aname%>,您好
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
							class="sublist-title" style="font-size:15px;">查询</span>
					</div>
					<ul class="navContent" style="display: block">
						<li>
							<div class="showtitle" style="width: 100px;">项目查询</div> <a
								href="<%=request.getContextPath()%>/project/findProject.do"
							class="active3" target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-search"></span><span
								class="sub-title">项目查询</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">论文查询</div> <a
								href="<%=request.getContextPath()%>/paper/findPaper.do"
							target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-search"></span><span
								class="sub-title">论文查询</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">荣誉查询</div> <a
								href="<%=request.getContextPath()%>/honor/findHonor.do"
							target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-search"></span><span
								class="sub-title">荣誉查询</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">专利查询</div> <a
							href="<%=request.getContextPath()%>/patent/findPatent.do"
							target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-search"></span><span
								class="sub-title">专利查询</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">其他查询</div> <a
								href="<%=request.getContextPath()%>/project/findProject.do"
								onclick="Projectchange()" class="active3" target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-search"></span><span
								class="sub-title">其他查询</span></a>
						</li>
					</ul>
				</div>
				<div class="sBox">
					<div class="subNav sublist-up">
						<span class="title-icon glyphicon glyphicon-chevron-up"></span><span
							class="sublist-title" style="font-size:15px;">统计</span>
					</div>
					<ul class="navContent" style="display: none">
						<li>
							<div class="showtitle" style="width: 100px;">项目统计</div> <a
							href="../servlet/StatisticsServlet?option=Project&college=<%=Cname %>&grade=<%=grade %>"
							onclick="ProjectStatistics()" target="select_frame"><span
								class="sublist-icon glyphicon  glyphicon-stats"></span><span
								class="sub-title">项目统计</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">论文统计</div> <a
							href="../servlet/StatisticsServlet?option=Paper&college=<%=Cname %>&grade=<%=grade %>"
							onclick="PaperStatistics()" target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-stats"></span><span
								class="sub-title">论文统计</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">荣誉统计</div> <a
							href="../servlet/StatisticsServlet?option=Honor&college=<%=Cname %>&grade=<%=grade %>"
							onclick="HonorStatistics()" target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-stats"></span><span
								class="sub-title">荣誉统计</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">专利统计</div> <a
							href="../servlet/StatisticsServlet?option=Patent&college=<%=Cname %>&grade=<%=grade %>"
							onclick="PatentStatistics()" target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-stats"></span><span
								class="sub-title">专利统计</span></a>
						</li>
					</ul>
				</div>
				<div class="sBox audit">
					<div class="subNav sublist-up">
						<span class="title-icon glyphicon glyphicon-chevron-up"></span><span
							class="sublist-title" style="font-size:15px;">审核</span>
					</div>
					<ul class="navContent" style="display: none">
						<li>
							<div class="showtitle" style="width: 100px;">项目审核</div> <a
							href="../servlet/AuditServlet?option=Project&college=<%=Cname %>"
							onclick="ProjectAudit()" target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-check"></span><span
								class="sub-title">项目审核</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">论文审核</div> <a
							href="../servlet/AuditServlet?option=Paper&college=<%=Cname %>"
							onclick="PaperAudit()" target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-check"></span><span
								class="sub-title">论文审核</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">荣誉审核</div> <a
							href="../servlet/AuditServlet?option=Honor&college=<%=Cname %>"
							onclick="HonorAudit()" target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-check"></span><span
								class="sub-title">荣誉审核</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">专利审核</div> <a
							href="../servlet/AuditServlet?option=Patent&college=<%=Cname %>"
							onclick="PatentAudit()" target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-check"></span><span
								class="sub-title">专利审核</span></a>
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
							<div class="showtitle" style="width: 100px;">教师管理</div> <a
							href="../servlet/PageServlet?option=Teacher&college=<%=Cname %>&teacher=admin"
							onclick="Teacherchange()" target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-user"></span><span
								class="sub-title">教师管理</span></a>
						</li>
						<li class="permissions">
							<div class="showtitle" style="width: 100px;">权限管理</div> <a
							href="" 
							 target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-th"></span><span
								class="sub-title">权限管理</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">密码管理</div> <a
							href="../School/Other/alterPassword.jsp" 
							 target="select_frame"><span
								class="sublist-icon glyphicon  glyphicon-asterisk"></span><span
								class="sub-title">密码管理</span></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="right-product right-off select-main">

			<div class="container-fluid">
				<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					<a href="#" class="navbar-brand">模糊搜索</a>
				</div>
				<form role="search" class="navbar-form navbar-left">
					<!-- 查询下拉框及按要求进行查询  -->
					<select id="college" class="form-control" name="college"
							onchange="selectChange();move()">>
						<%
							if(Cname == null){
						%>
						<option value="请选择所在学院" id="selectCollege">请选择所在学院</option>
						<c:forEach items="${collegeList}" var="collegeName">
							<option value="${collegeName}">${collegeName}</option>
						</c:forEach>
						<%
							}else{
						%>
						<option value="<%=Cname%>"><%=Cname%></option>
						<%}
						%>
					</select>
					<select id="sdept" class="form-control" onchange="selectChange()">
						<option value="">请选择所在专业</option>
					</select>
					<div class="form-group">
						<input type="date" class="form-control" id="starttime"
							onchange="selectChange()"> 
						<input type="date" class="form-control" id="endtime"
							onchange="selectChange()">
					</div>
					<div class="searchTrigger form-group">
						<a class="text-primary" onclick="searchShow()">精确搜索▼</a>
					</div>

				</form>
				</nav>
			</div>
			<div id="search" class="container-fluid">
				<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					<a href="#" class="navbar-brand">精确搜索</a>
				</div>
				<div class="navbar-form navbar-left">
					<div class="form-group">
						<input type="text" class="form-control" id="Tname">
					</div>
					<button class="btn btn-info" name="selectByName" id="selectByName"
						onclick="selectChange()">搜索</button>
				</div>
				</nav>
			</div>
			<div class="table" class="col-md-12">

				<iframe src="/patent/findPatent.do?college=<%=Cname %>&grade=<%=grade %>"
				frameborder="1" class="qaq" id="select_frame" name="select_frame" frameborder="0" scrolling="no" width="1200px"
					height="1800px" style="border: 0"></iframe>
			</div>

		</div>
	</div>

	</div>
</body>
</html>
