<%@ page import="com.slxy.edu.model.Project" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>项目审核</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/bootstrap.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxProjectData.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/commonUse.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/bootstrap-table.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxSelect.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/style.css">
</head>
<body>
<%
    Project project = (Project) request.getAttribute("project");
    String cname = (String) request.getSession().getAttribute("cname");
%>
<div class="table-main col-md-12">
    <div class="col-md-4" >
        <ol class="breadcrumb">
            <li><a>主页</a></li>
            <li><a>审核</a></li>
            <li><a href="<%=request.getContextPath()%>/project/audit.do?cname=<%=cname%>">项目审核</a></li>
            <li class="active">详细信息</li>
        </ol>
    </div>
    <div class="row">
        <div class="col-md-11 col-md-offset-1 ">
            <div class="col-md-10 button-div form-inline">
                <table border="1" id="table" class="table table-striped table-bordered table-hover table-condensed">
                    <tr class="info">
                        <td>项目名称</td>
                        <td class="Pname text-center" colspan="5"><%=project.getPname()%></td>
                    </tr>
                    <tr>
                        <td>项目编号</td>
                        <td class="Psn" colspan="2"><%=project.getPsn()%></td>
                        <td>负责人</td>
                        <td class="Pleader" colspan="2"><%=project.getTname()%></td>
                    </tr>
                    <tr>
                        <td>成员</td>
                        <td class="Pmember" colspan="2"><%=project.getPmember()%></td>
                        <td>级别</td>
                        <td class="Pgrad" colspan="2"><%=project.getPgrad()%></td>
                    </tr>
                    <tr>
                        <td>类型</td>
                        <td class="Pmoney" colspan="2"><%=project.getPkind()%></td>
                        <td>经费</td>
                        <td class="Pmoney" colspan="2"><%=project.getPmoney()%></td>
                    </tr>
                    <tr>
                        <td>立项时间</td>
                        <td class="Pstatime" colspan="2"><%=project.getPstatime()%></td>
                        <td>结题时间</td>
                        <td class="Pendtime" colspan="2"><%=project.getPendtime()%></td>
                    </tr>
                    <tr>
                        <td>科研状态</td>
                        <td class="Pcondition" colspan="2"><%=project.getPcondition()%></td>
                        <td>附件</td>
                        <td class="Paccessory"  colspan="2" ><a href="<%=request.getContextPath()%>/file/download.do?model=project&majorkey=<%=project.getPsn()%>&name=<%=project.getPname()%>" class=" btn btn-primary Download">查看附件</a></td>
                        <input type="hidden" id="accessoryPath" value="<%=project.getPaccessory() %>"/>
                    </tr>
                    <tr>
                        <td>备注</td>
                        <td class="Patremarks" colspan="5"><%=project.getPremarks()%></td>
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