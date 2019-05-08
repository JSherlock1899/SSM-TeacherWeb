<%@ page import="com.slxy.edu.model.Honor" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>项目审核</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/bootstrap.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxHonorData.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/commonUse.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/bootstrap-table.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxSelect.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/style.css">
</head>
<body>
<%
    Honor honor = (Honor) request.getAttribute("honor");
%>
<div class="table-main col-md-12">
    <div class="col-md-4" >
        <ol class="breadcrumb">
            <li><a>主页</a></li>
            <li><a>审核</a></li>
            <li>荣誉审核</li>
            <li class="active">详细信息</li>
        </ol>
    </div>
    <div class="row">
        <div class="col-md-11 col-md-offset-1 ">
            <div class="col-md-10 button-div form-inline">
                <table border="1" id="table" class="table table-striped table-bordered table-hover table-condensed">
                    <tr class="info">
                        <td>名称</td>
                        <td class="Hname text-center" colspan="5"><%=honor.getHname()%></td>
                    </tr>
                    <tr>
                        <td >编号</td>
                        <td class="Hsn" colspan="2"><%=honor.getHsn()%></td>
                        <td colspan="1">获奖者</td>
                        <td class="Hwinner" colspan="4"><%=honor.getHwinner()%></td>
                    </tr>
                    <tr>
                        <td>时间</td>
                        <td class="Hdate" colspan="2"><%=honor.getHdate()%></td>
                        <td>颁奖单位</td>
                        <td class="Hcompany" colspan="2"><%=honor.getHcompany()%></td>
                    </tr>
                    <tr>
                        <td>级别</td>
                        <td class="Hgrad" colspan="2"><%=honor.getHgrad()%></td>
                        <td>第一完成单位</td>1
                        <td class="department" colspan="2"><%=honor.getDepartment()%></td>
                    </tr>
                    <tr>
                        <td>附件</td>
                        <td class="Paccessory"  colspan="5" ><a href="/file/download.do?model=honor&majorkey=<%=honor.getHsn()%>&name=<%=honor.getHname()%>" class=" btn btn-primary Download">查看附件</a></td>
                        <input type="hidden" class="accessoryPath" value="<%=honor.getHaccessory() %>"/>
                    </tr>
                    <tr>
                        <td>备注</td>
                        <td class="Hremarks" colspan="5"><%=honor.getHremarks()%></td>
                    </tr>
                    <tr>
                        <td>审核意见</td>
                        <td><input type="text" id="message" style="width:600px"></td>
                        <td class="" colspan="4"><a id="pass" class="btn btn-success">通过</a>&nbsp<a id="nopass" class="btn btn-danger">不通过</a></td>
                    </tr>
                </table>
            </div>
        </div>
</body>
</html>
