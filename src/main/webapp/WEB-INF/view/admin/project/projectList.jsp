
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="java.sql.ResultSet" %>
<%@ page import="com.github.pagehelper.PageInfo" %>
<%@ page import="com.slxy.edu.model.Project" %>
<%@ page import="com.slxy.edu.model.Patent" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>专利查询</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/bootstrap.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajaxPatentData.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/commonUse.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/bootstrap-table.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajaxSelect.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/style.css">
</head>
<body>
    <%
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
        List<Patent> patents = pageInfo.getList();
    %>
    <div class="table-main col-md-12">
    <div class="col-md-4">
        <ol class="breadcrumb">
            <li><a href="#">主页</a></li>
            <li><a href="#">查询</a></li>
            <li class="active">专利查询</li>
        </ol>
    </div>
    <div class="row">
    <div class="col-md-11 col-md-offset-1 ">
    <div class="col-md-10 button-div form-inline">
        <input type="button" value="新建记录" id="addMsg" class="btn btn-success">
        <a href="../servlet/DownloadTemplate?count=4" class="btn btn-success">下载模板</a>
        <form method="post" enctype="multipart/form-data"
              action="../servlet/UploadFileServlet?tally=1&count=4&grade=<%=grade %>" class="form-group importform">
            <input type="file" id="myfile" name="myfile" class="btn btn-info" style="display: none"
                   onchange="$('.importform').submit()">
            <input type="button" name="" value="导入" class="btn btn-info" id="importButton">
        </form>
        <form action="../servlet/SelectExport" method="post" id="PatentForm" class="form-group">
            <input type="hidden" name="count" value="4">
            <input type="submit" value="导出" id="submitChecked" class="btn btn-info">
            <a class="btn btn-warning" href="../servlet/SelectExport?all=all&count=4">导出全部数据</a>
            <input type="file" id="file" name="file" class="btn btn-info" style="display: none" onchange="submitFile()">
            <input type="button" name="" value="上传文件" class="btn btn-warning" id="imporFileButton">
    </div>
    <table border="1" id="table" class="table table-striped table-bordered table-hover table-condensed">
    <tr class="info">
        <th><input type="checkbox" id="checkAll"/></th>
        <th>名称</th>
        <th>发明人</th>
        <th>专利权人</th>
        <th>授权号</th>
        <th>申请时间</th>
        <th>授权时间</th>
        <th>级别</th>
        <th>备注</th>
        <th>附件</th>
        <th>操作</th>
    </tr>
    
    <c:forEach items="${patents}" var="patents">
        <td>
    
        <td>${patents.patname}</td>
    
        <td>${patents.inventor}</td>
    
        <td>${patents.Tname}</td>
    
        <td>${patents.patsn}</td>
    
        <td>${patents.patapdate}</td>
        <td>${patents.patendate}</td>

        <td>${patents.patgrad}</td>

        <td>${patents.patremarks}</td>
        <td>1</td>
        <tr>
    
        </table>
        <nav aria-label="Page navigation">
        <ul class="pagination" style="display:block">
        <li>
    
        </li>
        <li>
        <a href="../servlet/PageServlet?option=Patent&currentPage=1" id="homePage">首页</a>
        </li>
        <li>
        <a aria-label="Previous" id="pre" class="prenextpage" href="../servlet/PageServlet?option=Patent&currentPage=<%=currentPage - 1%>&pageSize=5
        &collegevalue=<%=college%>&sdeptValue=<%=sdept%>&starttime=<%=starttime%>&endtime=<%=endtime%>
        &selectByNameVal=<%=Tname%>">
        <span >&laquo;</span>
        </a>
        </li>
        <li><a class="page" href="../servlet/PageServlet?option=Patent&currentPage=<%=pageArr[0]%>&pageSize=5
        &collegevalue=<%=college%>&sdeptValue=<%=sdept%>&starttime=<%=starttime%>&endtime=<%=endtime%>
        &selectByNameVal=<%=Tname%>"><%=pageArr[0]%></a></li>
        <li><a class="page" href="../servlet/PageServlet?option=Patent&currentPage=<%=pageArr[1]%>&pageSize=5
        &collegevalue=<%=college%>&sdeptValue=<%=sdept%>&starttime=<%=starttime%>&endtime=<%=endtime%>
        &selectByNameVal=<%=Tname%>"><%=pageArr[1]%></a></li>
        <li><a class="page" href="../servlet/PageServlet?option=Patent&currentPage=<%=pageArr[2]%>&pageSize=5
        &collegevalue=<%=college%>&sdeptValue=<%=sdept%>&starttime=<%=starttime%>&endtime=<%=endtime%>
        &selectByNameVal=<%=Tname%>"><%=pageArr[2]%></a></li>
        <li><a class="page" href="../servlet/PageServlet?option=Patent&currentPage=<%=pageArr[3]%>&pageSize=5
        &collegevalue=<%=college%>&sdeptValue=<%=sdept%>&starttime=<%=starttime%>&endtime=<%=endtime%>
        &selectByNameVal=<%=Tname%>"><%=pageArr[3]%></a></li>
        <li><a class="page" href="../servlet/PageServlet?option=Patent&currentPage=<%=pageArr[4]%>&pageSize=5
        &collegevalue=<%=college%>&sdeptValue=<%=sdept%>&starttime=<%=starttime%>&endtime=<%=endtime%>
        &selectByNameVal=<%=Tname%>"><%=pageArr[4]%></a></li>
        <li>
        <a id="next" aria-label="Next" class="prenextpage" href="../servlet/PageServlet?option=Patent&currentPage=<%=currentPage + 1%>&pageSize=5
        &collegevalue=<%=college%>&sdeptValue=<%=sdept%>&starttime=<%=starttime%>&endtime=<%=endtime%>
        &selectByNameVal=<%=Tname%>">
        <span>&raquo;</span>
        </a>
        </li>
        <li><a href="../servlet/PageServlet?option=Patent&currentPage=<%=totalPage %>" id="endPage" >尾页</a></li>
        <li><span>当前第<%=currentPage %>页，共<%=totalRecord %>条记录</span></li>
        </ul>
        </nav>
        </form>
        <div class="form-group pull-right">
        共<%=totalPage %>页
        <input type="text" class="pageVal" style="width:100px;">
        <button type="submit" class="btn btn-default " onclick="skipPage()">GO</button>
        </div>
        </div>
        </div>
        </div>
        <script type="text/javascript">
    
    
        //点击上传文件时打开文件上传选择窗口
        $(function(){
        $('#imporFileButton').on("click",function(){
        $('#file').click();
        })
        })
    
        function submitFile(){
        $('#PatentForm').attr("action","../servlet/UploadFileServlet?&count=4&grade=<%=grade%>");
        $('#PatentForm').attr("enctype","multipart/form-data");
        $('#PatentForm').submit();
        }
    </script>
    </body> 
 </html>
