<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.slxy.edu.model.Admin" %>
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
		Admin admin = (Admin) request.getAttribute("admin");
		String Cname = (String) request.getSession().getAttribute("cname");	//获取用户的所属学院
		String grade = admin.getAgrad();	//获取用户的权限等级
		String Aname = (String) request.getAttribute("username"); //获取管理员名
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
							<div class="showtitle" style="width: 100px;">项目查询</div> <a onclick="Projectchange()"
								href="<%=request.getContextPath()%>/project/findProject.do?cname=<%=Cname%>"
							class="active3" target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-search"></span><span
								class="sub-title">项目查询</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">论文查询</div> <a
								href="<%=request.getContextPath()%>/paper/findPaper.do?cname=<%=Cname%>"
							target="select_frame"  onclick="Paperchange()"><span
								class="sublist-icon glyphicon glyphicon-search"></span><span
								class="sub-title">论文查询</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">荣誉查询</div> <a onclick="Honorchange()"
								href="<%=request.getContextPath()%>/honor/findHonor.do?cname=<%=Cname%>"
							target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-search"></span><span
								class="sub-title">荣誉查询</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">专利查询</div> <a onclick="Patentchange()"
							href="<%=request.getContextPath()%>/patent/findPatent.do?cname=<%=Cname%>"
							target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-search"></span><span
								class="sub-title">专利查询</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 130px;">其他成果查询</div> <a
								href="<%=request.getContextPath()%>/other/findOther.do?cname=<%=Cname%>"
								onclick="Otherchange()"  target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-search"></span><span
								class="sub-title">其他成果查询</span></a>
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
							href="<%=request.getContextPath()%>/project/Statistics.do?grade=<%=grade %>"
							onclick="ProjectStatistics()" target="select_frame"><span
								class="sublist-icon glyphicon  glyphicon-stats"></span><span
								class="sub-title">项目统计</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">论文统计</div> <a
								href="<%=request.getContextPath()%>/paper/Statistics.do?grade=<%=grade %>"
							onclick="PaperStatistics()" target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-stats"></span><span
								class="sub-title">论文统计</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">荣誉统计</div> <a
								href="<%=request.getContextPath()%>/honor/Statistics.do?grade=<%=grade %>"
							onclick="HonorStatistics()" target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-stats"></span><span
								class="sub-title">荣誉统计</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">专利统计</div> <a
								href="<%=request.getContextPath()%>/patent/Statistics.do?grade=<%=grade %>"
							onclick="PatentStatistics()" target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-stats"></span><span
								class="sub-title">专利统计</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 130px;">其他成果统计</div> <a
								href="<%=request.getContextPath()%>/other/Statistics.do?grade=<%=grade %>"
							onclick="OtherStatistics()" target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-stats"></span><span
								class="sub-title">其他成果统计</span></a>
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
								href="<%=request.getContextPath()%>/project/audit.do?cname=<%=Cname%>"
							onclick="ProjectAudit()" target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-check"></span><span
								class="sub-title">项目审核</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">论文审核</div> <a
								href="<%=request.getContextPath()%>/paper/audit.do?cname=<%=Cname%>"
							onclick="PaperAudit()" target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-check"></span><span
								class="sub-title">论文审核</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">荣誉审核</div> <a
								href="<%=request.getContextPath()%>/honor/audit.do?cname=<%=Cname%>"
							onclick="HonorAudit()" target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-check"></span><span
								class="sub-title">荣誉审核</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">专利审核</div> <a
							href="<%=request.getContextPath()%>/patent/audit.do?cname=<%=Cname%>"
							onclick="PatentAudit()" target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-check"></span><span
								class="sub-title">专利审核</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 130px;">其他成果审核</div> <a
							href="<%=request.getContextPath()%>/other/audit.do?cname=<%=Cname%>"
							onclick="OtherAudit()" target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-check"></span><span
								class="sub-title">其他成果审核</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 130px;">教师信息审核</div> <a
							href="<%=request.getContextPath()%>/teacher/audit.do?cname=<%=Cname%>"
							onclick="OtherAudit()" target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-check"></span><span
								class="sub-title">教师信息审核</span></a>
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
							href="<%=request.getContextPath()%>/teacher/findTeacher.do?cname=<%=Cname%>"
							onclick="Teacherchange()" target="select_frame"><span
								class="sublist-icon glyphicon glyphicon-user"></span><span
								class="sub-title">教师管理</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">密码管理</div> <a
								href="<%=request.getContextPath()%>/user/password.do"
							 target="select_frame"><span
								class="sublist-icon glyphicon  glyphicon-asterisk"></span><span
								class="sub-title">密码管理</span></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="right-product right-full select-main">
			<div class="container-fluid">
				<div class="row">
					<nav class="navbar navbar-default" role="navigation">
						<div class="navbar-header">
							<a href="#" class="navbar-brand">模糊搜索</a>
						</div>
						<form role="search" class="navbar-form navbar-left">
							<!-- 查询下拉框及按要求进行查询  -->
							<select id="college" class="form-control" name="college"
									onchange="move();selectChange()">>
								<%
									if(Cname == null){
								%>
								<option value="">请选择所在学院</option>
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

			</div>
			<div id="search" class="container-fluid">
				<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					<a href="#" class="navbar-brand">按教师名搜索</a>
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
				<iframe src="<%=request.getContextPath()%>/project/Statistics.do?grade=<%=grade %>"
				frameborder="1"  id="select_frame" name="select_frame" frameborder="0" scrolling="no" width="1200px"
					height="1800px" style="border: 0"></iframe>
			</div>
		</div>
	</div>
</body>
</html>
