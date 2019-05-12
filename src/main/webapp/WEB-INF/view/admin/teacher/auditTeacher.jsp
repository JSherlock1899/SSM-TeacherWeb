<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ page import="com.github.pagehelper.PageInfo" %>
<%@ page import="com.slxy.edu.model.Condition" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>教师信息审核</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/bootstrap.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxTeacherData.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/commonUse.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/bootstrap-table.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxSelect.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/style.css">
</head>
<body>
<%
    PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
    Condition condition = (Condition) request.getAttribute("condition");
%>
<div class="table-main col-md-12">
    <div class="col-md-4" >
        <ol class="breadcrumb">
            <li><a href="#">主页</a></li>
            <li><a href="#">审核</a></li>
            <li class="active">教师信息审核</li>
        </ol>
    </div>
    <div class="row">
        <div class="col-md-11 col-md-offset-1 ">
            <table border="1" id="table" class="table table-striped table-bordered table-hover table-condensed">
                <tr class="info">
                    <th>工号</th>
                    <th>教师名</th>
                    <th>性别</th>
                    <th>学位</th>
                    <th>学历</th>
                    <th>研究方向</th>
                    <th>职称</th>
                    <th>出生年月</th>
                    <th>所属学院</th>
                    <th>所属系</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${teachers}" var="teachers">
                    <tr>
                        <td class="Tsn">${teachers.tsn}</td>
                        <td class="Tname">${teachers.tname}</td>
                        <td class="Tsex">${teachers.tsex}</td>
                        <td class="Tdegree">${teachers.tdegree}</td>
                        <td class="Tedubackground">${teachers.tedubackground}</td>
                        <td class="Tresdirection">${teachers.tresdirection}</td>
                        <td class="JobTitle">${teachers.jobTitle}</td>
                        <td class="Tdateofbirth">${teachers.tdateofbirth}</td>
                        <td class="Cname">${teachers.cname}</td>
                        <td class="Dname">${teachers.dname}</td>
                        <td><input type="button" value="审核" class="audit btn btn-primary"></td>
                    </tr>
                </c:forEach>
            </table>
            <!--显示分页信息-->
            <div class="row">
                <!--点击分页-->
                <div>
                    <ul class="pagination">
                        <li><a href="${pageContext.request.contextPath}/teacher/audit.do?pn=1&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>">首页</a></li>
                        <!--上一页-->
                        <li>
                            <c:if test="${pageInfo.hasPreviousPage}">
                                <a href="${pageContext.request.contextPath}/teacher/audit.do?pn=${pageInfo.pageNum-1}&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>" aria-label="Previous">
                                    <span aria-hidden="true">«</span>
                                </a>
                            </c:if>
                        </li>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                            <c:if test="${page_num == pageInfo.pageNum}">
                                <li class="active"><a href="${pageContext.request.contextPath}/teacher/audit.do?pn=1&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>">${page_num}</a></li>
                            </c:if>
                            <c:if test="${page_num != pageInfo.pageNum}">
                                <li><a href="${pageContext.request.contextPath}/teacher/audit.do?pn=${page_num}&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>">${page_num}</a></li>
                            </c:if>
                        </c:forEach>
                        <!--下一页-->
                        <li>
                            <c:if test="${pageInfo.hasNextPage}">
                                <a href="${pageContext.request.contextPath}/teacher/audit.do?pn=${pageInfo.pageNum+1}&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>"
                                   aria-label="Next">
                                    <span aria-hidden="true">»</span>
                                </a>
                            </c:if>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/teacher/audit.do?pn=${pageInfo.pages}&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>">尾页</a></li>
                    </ul>
                    <!--文字信息-->
                    <div class="form-group pull-right">
                        <span>当前第 ${pageInfo.pageNum} 页.总共 ${pageInfo.pages} 页</span>
                        <input type="text" class="pageVal" style="width:100px;margin-top: 25px;">
                        <button type="submit" class="btn btn-default" style="margin-right: 20px" id="skipPage">GO</button>
                    </div>
                </div>
            </div>
            <!--新建信息的模态框 -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" >
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">审核教师信息</h4>
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true"></span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="message">审核意见</label>
                                <input type="text" name="message" value="" class="form-control" id="message" placeholder="审核意见">
                            </div>
                            <div class="form-group">
                                <td class=""><a id="pass" class="btn btn-success">通过</a>&nbsp<a id="nopass" class="btn btn-danger">不通过</a></td>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">
                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
                            </button>
                            <button type="submit" id="btn_submit"
                                    class="btn btn-primary save">
                                <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    //跳转到指定页码
    $(document).on("click","#skipPage",function () {
        //页码输入框输入的数
        var pageVal = $('.pageVal').val();
        //总页数
        var totalPage = $('#totalPage').val();
        if(pageVal > totalPage){
            alert('请输入正确的页码！');
            return
        }
        if(pageVal == ""){
            alert('页码不能为空！');
            return
        }
        if(!isNaN(pageVal)){
            window.location.href = "${pageContext.request.contextPath}/teacher/audit.do?pn=" + pageVal + "&cname=<%=condition.getCname()%>\n" +
                "&dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>";
        }else {
            alert('请输入数字！')
        }
    })
</script>
</body>
</html>
