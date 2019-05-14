<%@ page import="com.slxy.edu.model.Other" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>详细信息</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/fileinput.min.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/commonUse.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/bootstrap-table.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/fileinput.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/zh.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/style.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxOtherData.js"></script>
</head>
<body>
<%
    Other other = (Other) request.getAttribute("other");
    String cname = (String) request.getSession().getAttribute("cname");
%>
<div class="table-main col-md-12">
    <div class="col-md-4">
        <ol class="breadcrumb" style="margin-left:5em;margin-top:2em">
            <li><a href="#">主页</a></li>
            <li><a href="#">查询</a></li>
            <li><a href="<%=request.getContextPath()%>/other/audit.do?cname=<%=cname%>">其他成果审核</a></li>
            <li class="active">详细信息</li>
        </ol>
    </div>
    <div class="row">
        <div class="col-md-11 col-md-offset-1 ">
            <div class="col-md-10 button-div form-inline">
                <input type="file" id="file" style="display: none">
            </div>
            <table border="2" id="table" class="table table-striped table-bordered table-condensed">
                <tr class="info">
                    <td>名称</td>
                    <td class="other_name text-center" colspan="5"><%=other.getOther_name()%></td>
                </tr>
                <tr>
                    <td>发表人</td>
                    <td class="Tname" colspan="2"><%=other.getTname()%></td>
                    <td>类型</td>
                    <td colspan="2" class="other_type"><%=other.getother_type()%></td>
                </tr>
                <tr>
                    <td>日期</td>
                    <td class="other_date" colspan="2"><%=other.getOther_date()%></td>
                    <td>发表单位</td>
                    <td class="Publisher" colspan="2"><%=other.getPublisher()%></td>
                </tr>
                <tr>
                    <td>附件</td>
                    <td colspan="5"><a href="<%=request.getContextPath()%>/file/download.do?model=other&majorkey=<%=other.getOther_name()%>&name=<%=other.getOther_name()%>"  class="btn btn-primary Download" value="上传">下载附件</a></td>
                    <input type="hidden" id="accessoryPath" value="<%=other.getAccessory() %>"/>
                </tr>
                <tr>
                    <td>成果描述</td>
                    <td class="describe" colspan="5"><%=other.getother_describe()%></td>
                </tr>
                <tr>
                    <td>审核意见</td>
                    <td colspan="4"><input type="text" id="message" style="width:600px"></td>
                    <td class=""><a id="pass" class="btn btn-success">通过</a>&nbsp<a id="nopass" class="btn btn-danger">不通过</a></td>
                </tr>
            </table>
        </div>
    </div>
</div>
</body>
</html>