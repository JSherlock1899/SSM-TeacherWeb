<%@ page import="com.slxy.edu.model.Patent" %>
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
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxPatentData.js"></script>
</head>
<body>
<%
    Patent patent = (Patent) request.getAttribute("patent");
    String cname = (String) request.getSession().getAttribute("cname");
%>
<div class="table-main col-md-12">
    <div class="col-md-4">
        <ol class="breadcrumb" style="margin-left:5em;margin-top:2em">
            <li><a href="#">主页</a></li>
            <li><a href="#">审核</a></li>
            <li><a href="<%=request.getContextPath()%>/patent/audit.do?cname=<%=cname%>">专利审核</a></li>
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
                    <td class="Patname text-center" colspan="6"><%=patent.getPatname()%></td>
                </tr>
                <tr>
                    <td>发明人</td>
                    <td class="inventor"><%=patent.getInventor()%></td>
                    <td>专利权人</td>
                    <td class="tname"><%=patent.getTname()%></td>
                    <td>授权号</td>
                    <td class="Patsn"><%=patent.getPatsn()%></td>
                </tr>
                <tr>
                    <td>申请时间</td>
                    <td class="Patapdate" colspan="2"><%=patent.getPatapdate()%></td>
                    <td>授权时间</td>
                    <td class="Patendate" colspan="2"><%=patent.getPatendate()%></td>
                </tr>
                <tr>
                    <td>类别</td>
                    <td class="Patgrad"><%=patent.getPatgrad()%></td>
                    <td>附件</td>
                    <td colspan="3"><a href="<%=request.getContextPath()%>/file/download.do?model=patent&majorkey=<%=patent.getPatsn()%>&name=<%=patent.getPatname()%>" class="btn btn-primary Download">下载附件</a></td>
                    <input type="hidden" id="accessoryPath" value="<%=patent.getPaccessory() %>"/>
                </tr>
                <tr>
                    <td>备注</td>
                    <td class="Patremarks" colspan="5"><%=patent.getPatremarks()%></td>
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