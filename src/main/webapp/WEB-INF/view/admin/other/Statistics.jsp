<%@page import="com.alibaba.fastjson.JSONArray"%>
<%@page import="com.alibaba.fastjson.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>其他成果统计</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/style.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/echarts.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/bootstrap-table.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/statistics/statisticsOther.js"></script>
</head>
<body>
<%
    JSONArray json = (JSONArray)request.getAttribute("json");
    JSONArray jsonList = (JSONArray)request.getAttribute("jsonList");
    String grade = (String)request.getSession().getAttribute("grade");	//获取用户的权限等级
    String cname = (String) request.getAttribute("cname");
%>
<ol class="breadcrumb">
    <li><a href="#">主页</a></li>
    <li><a href="#">统计</a></li>
    <li class="active">其他成果统计</li>
</ol>
<input id="json" value=<%=json%> class="hide">
<input id="grade" value=<%=grade%> class="hide">
<input id="jsonList" value=<%=jsonList%> class="hide">
<input id="cname" value=<%=cname%> class="hide">
<div class="container-fluid">
    <div class="row">
        <div id="other_bar" class="col-md-6" style="height:400px"></div>
        <div id="other_pie" class="col-md-5 col-md-offset-1" style="height:400px"></div>
    </div>
</div>

<div class="container-fluid">
    <div class="row">
        <div id="other_broken_line" class="col-md-12" style="height:400px"></div>
    </div>
</div>

</body>
</html>