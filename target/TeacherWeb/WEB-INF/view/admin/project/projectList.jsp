<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ page import="com.github.pagehelper.PageInfo" %>
<%@ page import="com.slxy.edu.model.Condition" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>专利查询</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/bootstrap.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/commonUse.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxProjectData.js"></script>
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
            <li><a href="#">查询</a></li>
            <li class="active">项目查询</li>
        </ol>
    </div>
    <div class="row">
        <div class="col-md-11 col-md-offset-1 ">
            <div class="col-md-10 button-div form-inline">
                <a href="<%=request.getContextPath()%>/poi/getTemplate.do?name=project" class="btn btn-success">下载模板</a>
                <form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/project/importExcel.do" class="form-group importform">
                    <input type="file" id="file" name="file" class="btn btn-info" style="display: none" onchange="$('.importform').submit()">
                    <input type="button" name="" value="导入"  class="btn btn-info" id="importFileButton">
                </form>
                <form action="<%=request.getContextPath()%>/project/export.do?&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>"  method="post" id="ProjectForm" class="form-group">
                    <input type="submit" value="导出" id="submitChecked" class="btn btn-info">
                </form>

            </div>
            <table border="1" id="table" class="table table-striped table-bordered table-hover table-condensed">
                <tr class="info">
                    <th>项目编号</th>
                    <th>项目名称</th>
                    <th>负责人</th>
                    <th>级别</th>
                    <th>经费（万元）</th>
                    <th>立项时间</th>
                    <th>附件</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${projects}" var="projects">
                    <tr>
                        <td class="Psn"><a href="${pageContext.request.contextPath}/teacher/goProjectDetail.do?psn=${projects.psn}">${projects.psn}</a></td>
                        <td class="Pname">${projects.pname}</td>
                        <td class="tname">${projects.tname}</td>
                        <td class="Pgrad">${projects.pgrad}</td>
                        <td class="Pmoney">${projects.pmoney}</td>
                        <td class="Pstatime">${projects.pstatime}</td>
                        <td>
                            <a href="<%=request.getContextPath()%>/file/download.do?model=project&majorkey=${projects.psn}&name=${projects.pname}" class="Download">查看附件</a>
                            <input type="hidden" class="accessoryPath" value="${projects.paccessory}"/>
                        </td>
                        <td>
                            <a class="btn btn-danger delete">删除</a>
                            <a class="btn btn-primary alter">编辑</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <!--显示分页信息-->
            <div class="row">
                <!--点击分页-->
                <div>
                    <ul class="pagination">
                        <li><a href="${pageContext.request.contextPath}/project/findProject.do?pn=1&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>">首页</a></li>
                        <!--上一页-->
                        <li>
                            <c:if test="${pageInfo.hasPreviousPage}">
                                <a href="${pageContext.request.contextPath}/project/findProject.do?pn=${pageInfo.pageNum-1}&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>" aria-label="Previous">
                                    <span aria-hidden="true">«</span>
                                </a>
                            </c:if>
                        </li>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                            <c:if test="${page_num == pageInfo.pageNum}">
                                <li class="active"><a href="${pageContext.request.contextPath}/project/findProject.do?pn=1&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>">${page_num}</a></li>
                            </c:if>
                            <c:if test="${page_num != pageInfo.pageNum}">
                                <li><a href="${pageContext.request.contextPath}/project/findProject.do?pn=${page_num}&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>">${page_num}</a></li>
                            </c:if>
                        </c:forEach>
                        <!--下一页-->
                        <li>
                            <c:if test="${pageInfo.hasNextPage}">
                                <a href="${pageContext.request.contextPath}/project/findProject.do?pn=${pageInfo.pageNum+1}&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>"
                                   aria-label="Next">
                                    <span aria-hidden="true">»</span>
                                </a>
                            </c:if>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/project/findProject.do?pn=${pageInfo.pages}&cname=<%=condition.getCname()%>
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
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                            <h4 class="modal-title" id="myModalLabel">修改项目信息</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="Psn">项目编号</label>
                                <input type="text" name="Psn" id="Psn" onfocus="showTips('Psn','项目编号不能超过50个字符')"
                                       onblur="checkPsn('Psn','请按要求输入项目编号')" class="form-control" id="Psn" placeholder="项目编号" readonly>
                                <div id="Psndiv" style="display:none">
                                    <span id="Psnspan" ></span><br>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Pname">项目名称</label> <input type="text" name="Pname"
                                                                       onfocus="showTips('Pname','项目名称不能超过50个字符')"
                                                                       onblur="checkPname('Pname','请按要求输入项目名称')"
                                                                       class="form-control" id="Pname" placeholder="项目名称">
                                <div id="Pnamediv" style="display:none">
                                    <span id="Pnamespan" ></span><br>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="tname">负责人</label> <input type="text"
                                                                        name="tname" class="form-control" id="tname"
                                                                        placeholder="负责人" readonly>
                            </div>
                            <div class="form-group">
                                <label for="Pgrad">级别</label>
                                <select name="Pgrad"
                                        class="form-control" id="Pgrad">
                                    <option value="校级">校级</option>
                                    <option value="市级">市级</option>
                                    <option value="省级">省级</option>
                                    <option value="部级">部级</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="Pkind">类型</label>
                                <select name="Pkind"
                                        class="form-control" id="Pkind">
                                    <option value="横向">横向</option>
                                    <option value="纵向">纵向</option>
                                </select>
                            </div>
                            <div class="form-group contractTypediv">
                                <label for="contractType">合同类型</label>
                                <select name="contractType"
                                        class="form-control" id="contractType">
                                    <option value="技术开发(委托)">技术开发(委托)</option>
                                    <option value="技术服务">技术服务</option>
                                    <option value="技术咨询">技术咨询</option>
                                    <option value="技术转让">技术转让</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="Pcondition">科研状态</label>
                                <select name="Pcondition"
                                        class="form-control" id="Pcondition">
                                    <option value="未结题">未结题</option>
                                    <option value="已结题">已结题</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="Pmoney">经费（万元）</label>
                                <input type="text" name="Pmoney"
                                       class="form-control" id="Pmoney" placeholder="经费"
                                       onfocus="showTips('Pmoney','项目经费为数字')"
                                       onblur="checkPmoney('Pmoney','请按要求输入项目经费')">
                                <div id="Pmoneydiv" style="display:none">
                                    <span id="Pmoneyspan" ></span><br>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Pstatime">立项时间 </label> <input type="date"
                                                                           name="Pstatime" class="form-control" id="Pstatime"
                                                                           placeholder="立项时间	">
                            </div>
                            <div class="form-group">
                                <label for="Pendtime">结题时间</label> <input type="date"
                                                                          name="Pendtime" class="form-control" id="Pendtime"
                                                                          placeholder="结题时间">
                            </div>
                            <div class="form-group">
                                <label for="Premarks">备注</label> <input type="text"
                                                                        name="Premarks" class="form-control" id="Premarks"
                                                                        placeholder="备注">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">
                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
                            </button>
                            <button type="submit" id="btn_submit"
                                    class="btn btn-primary alterSave">
                                <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>提交
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
            window.location.href = "${pageContext.request.contextPath}/project/findProject.do?pn=" + pageVal + "&cname=<%=condition.getCname()%>\n" +
                "&dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>";
        }else {
            alert('请输入数字！')
        }
    })
</script>
</body>
</html>
