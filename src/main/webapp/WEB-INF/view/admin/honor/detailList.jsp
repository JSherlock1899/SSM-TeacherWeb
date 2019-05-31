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
    String cname = (String) request.getSession().getAttribute("cname");
%>
<div class="table-main col-md-12">
    <div class="col-md-4" >
        <ol class="breadcrumb">
            <li><a>主页</a></li>
            <li><a>审核</a></li>
            <li><a href="<%=request.getContextPath()%>/honor/audit.do?cname=<%=cname%>">荣誉审核</a></li>
            <li class="active">详细信息</li>
        </ol>
    </div>
    <div class="row">
        <div class="col-md-11 col-md-offset-1 ">
            <table border="2" id="table" class="table table-striped table-bordered table-condensed">
                <tr class="info">
                    <td>名称</td>
                    <td class="Hname text-center"  colspan="5"><%=honor.getHname()%></td>
                </tr>
                <tr>
                    <td>编号</td>
                    <td class="Hsn" colspan="2"><%=honor.getHsn()%></td>
                    <td>第一完成人</td>
                    <td class="Hwinner" colspan="2"><%=honor.getTname()%></td>
                </tr>
                <tr>
                    <td>时间</td>
                    <td class="Hdate" colspan="2"><%=honor.getHdate()%></td>
                    <td>颁奖单位</td>
                    <td class="Hcompany" colspan="2"><%=honor.getHcompany()%></td>
                </tr>
                <tr>
                    <td>级别</td>
                    <td class="Hgrad"><%=honor.getHgrad()%></td>
                    <td>第一完成单位</td>
                    <td class="department"><%=honor.getDepartment()%></td>
                    <td>附件</td>
                    <td><a href="<%=request.getContextPath()%>/file/download.do?model=honor&majorkey=<%=honor.getHsn()%>&name=<%=honor.getHname()%>"  class="btn btn-primary Download">下载附件</a></td>
                    <input type="hidden" id="accessoryPath" value="<%=honor.getHaccessory() %>"/>
                </tr>
                <tr>
                    <td>备注</td>
                    <td class="Hremarks" colspan="5"><%=honor.getHremarks()%></td>
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
