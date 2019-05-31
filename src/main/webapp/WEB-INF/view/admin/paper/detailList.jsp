<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.slxy.edu.model.Paper" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>论文审核</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/bootstrap.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxPaperData.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/commonUse.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/bootstrap-table.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxSelect.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/style.css">
</head>
<body>
<%
    Paper paper = (Paper) request.getAttribute("paper");
    String cname = (String) request.getSession().getAttribute("cname");
%>
<div class="table-main col-md-12">
    <div class="col-md-4" >
        <ol class="breadcrumb">
            <li><a>主页</a></li>
            <li><a>审核</a></li>
            <li><a href="<%=request.getContextPath()%>/paper/audit.do?cname=<%=cname%>">论文审核</a></li>
            <li class="active">详细信息</li>
        </ol>
    </div>
    <div class="row">
        <div class="col-md-11 col-md-offset-1 ">
            <div class="col-md-10 button-div form-inline">
                <table border="1" id="table" class="table table-striped table-bordered table-hover table-condensed">
                    <tr class="info">
                        <td>名称</td>
                        <td class="Paname text-center"  colspan="5"><%=paper.getPaname()%></td>
                    </tr>
                    <tr>
                        <td>编号</td>
                        <td class="Pasearchnum"><%=paper.getPasearchnum()%></td>
                        <td>第一作者</td>
                        <td class="Tname"><%=paper.getTname()%></td>
                        <td>通讯作者</td>
                        <td class="Pawriter"><%=paper.getPawriter()%></td>
                    </tr>
                    <tr>
                        <td>发表期刊</td>
                        <td class="Papublish" colspan="2"><%=paper.getPapublish()%></td>
                        <td>发表时间</td>
                        <td class="Padate" colspan="2"><%=paper.getPadate()%></td>
                    </tr>
                    <tr>
                        <td>级别</td>
                        <td class="Pagrad" colspan="2"><%=paper.getPagrad()%></td>
                        <td>附件</td>
                        <td class="Paccessory" colspan="2"><a href="<%=request.getContextPath()%>/file/download.do?model=paper&majorkey=<%=paper.getPasearchnum()%>&name=<%=paper.getPaname()%>" class=" btn btn-primary Download">查看附件</a></td>
                        <input type="hidden" id="accessoryPath" value="<%=paper.getPaccessory() %>"/>
                    </tr>
                    <tr>
                        <td>期/卷/页</td>
                        <td class="Pdisvol" colspan="2"><%=paper.getPdisvol()%></td>
                        <td>依托项目</td>
                        <td class="dependence" colspan="2"><%=paper.getDependence()%></td>
                    </tr>
                    <tr>
                        <td>备注</td>
                        <td class="Paremarks" colspan="5"><%=paper.getParemarks()%></td>
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
</div>
</body>
</html>