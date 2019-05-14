<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ page import="com.github.pagehelper.PageInfo" %>
<%@ page import="java.util.List" %>
<%@ page import="com.slxy.edu.model.Patent" %>
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
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/bootstrap-table.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxPatentData.js"></script>
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
            <li class="active">专利查询</li>
        </ol>
    </div>
    <div class="row">
        <div class="col-md-11 col-md-offset-1 ">
            <div class="col-md-10 button-div form-inline">
                <a href="<%=request.getContextPath()%>/poi/getTemplate.do?name=patent" class="btn btn-success">下载模板</a>
                <form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/patent/importExcel.do" class="form-group importform">
                    <input type="file" id="file" name="file" class="btn btn-info" style="display: none" onchange="$('.importform').submit()">
                    <input type="button" name="" value="导入"  class="btn btn-info" id="importFileButton">
                </form>
                <form action="<%=request.getContextPath()%>/patent/export.do?&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>"  method="post" id="ProjectForm" class="form-group">
                    <input type="submit" value="导出" id="submitChecked" class="btn btn-info">
                </form>
            </div>
            <table border="1" id="table" class="table table-striped table-bordered table-hover table-condensed">
                <tr class="info">
                    <th>名称</th>
                    <th>发明人</th>
                    <th>专利权人</th>
                    <th>授权号</th>
                    <th>申请时间</th>
                    <th>授权时间</th>
                    <th>类型</th>
                    <th>附件</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${patents}" var="patents">
                    <tr>
                        <td class="Patname"><a href="${pageContext.request.contextPath}/teacher/goPatentDetail.do?patsn=${patents.patsn}">${patents.patname}</a></td>
                        <td class="inventor">${patents.inventor}</td>
                        <td class="tname">${patents.tname}</td>
                        <td class="Patsn">${patents.patsn}</td>
                        <td class="Patapdate">${patents.patapdate}</td>
                        <td class="Patendate">${patents.patendate}</td>
                        <td class="Patgrad">${patents.patgrad}</td>
                        <td>
                            <a href="<%=request.getContextPath()%>/file/download.do?model=patent&majorkey=${patents.patsn}&name=${patents.patname}" class="Download">查看附件</a>
                            <input type="hidden" class="accessoryPath" value="${patents.paccessory}"/>
                        </td>
                        <td>
                            <a class="btn btn-danger delete">删除</a>
                            <a class="btn btn-primary alter">编辑</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            </form>
            <!--显示分页信息-->
            <div class="row">
                <!--点击分页-->
                <div>
                    <ul class="pagination">
                        <li><a href="${pageContext.request.contextPath}/patent/findPatent.do?pn=1&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>">首页</a></li>
                        <!--上一页-->
                        <li>
                            <c:if test="${pageInfo.hasPreviousPage}">
                                <a href="${pageContext.request.contextPath}/patent/findPatent.do?pn=${pageInfo.pageNum-1}&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>" aria-label="Previous">
                                    <span aria-hidden="true">«</span>
                                </a>
                            </c:if>
                        </li>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                            <c:if test="${page_num == pageInfo.pageNum}">
                                <li class="active"><a href="${pageContext.request.contextPath}/patent/findPatent.do?pn=1&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>">${page_num}</a></li>
                            </c:if>
                            <c:if test="${page_num != pageInfo.pageNum}">
                                <li><a href="${pageContext.request.contextPath}/patent/findPatent.do?pn=${page_num}&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>">${page_num}</a></li>
                            </c:if>
                        </c:forEach>
                        <!--下一页-->
                        <li>
                            <c:if test="${pageInfo.hasNextPage}">
                                <a href="${pageContext.request.contextPath}/patent/findPatent.do?pn=${pageInfo.pageNum+1}&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>"
                                   aria-label="Next">
                                    <span aria-hidden="true">»</span>
                                </a>
                            </c:if>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/patent/findPatent.do?pn=${pageInfo.pages}&cname=<%=condition.getCname()%>
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
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 data-backdrop="static">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">修改专利信息</h4>
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="Patname">名称</label>
                                <input type="text" name="Patname" class="form-control" id="Patname" placeholder="名称"
                                       onfocus="showTips('Patname','专利名称不能超过15个字符')"
                                       onblur="checkPatname('Patname','请按要求输入专利名称')">
                                <div id="Patnamediv" style="display:none">
                                    <span id="Patnamespan"></span><br>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Patsn">授权号</label>
                                <input type="text" name="Patsn" class="form-control" id="Patsn" placeholder="授权号"
                                       onfocus="showTips('Patsn','专利授权号为1-20位的数字')"
                                       onblur="checkPatsn('Patsn','请按要求输入专利授权号')" readonly="readonly">
                                <div id="Patsndiv" style="display:none">
                                    <span id="Patsnspan"></span><br>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inventor">发明人</label>
                                <input type="text" name="inventor" value="" class="form-control" id="inventor"
                                       placeholder="发明人">
                            </div>
                            <div class="form-group">
                                <label for="tname">专利权人</label>
                                <input type="text" name="tname"  class="form-control" id="tname"
                                       placeholder="专利权人" readonly>
                            </div>
                            <div class="form-group">
                                <label for="Patapdate">申请时间</label>
                                <input type="date" name="Patapdate" class="form-control" id="Patapdate"
                                       placeholder="申请时间">
                            </div>
                            <div class="form-group">
                                <label for="Patendate">授权时间</label>
                                <input type="date" name="Patendate" class="form-control" id="Patendate"
                                       placeholder="授权时间">
                            </div>
                            <div class="form-group">
                                <label for="Patgrad">类型</label>
                                <select name="Patgrad" class="form-control" id="Patgrad">
                                    <option value="发明专利">发明专利</option>
                                    <option value="实用新型专利">实用新型专利</option>
                                    <option value="外观设计专利">外观设计专利</option>
                                    <option value="软件著作权">软件著作权</option>
                                    <option value="植物新品种">植物新品种</option>
                                </select>
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
            window.location.href = "${pageContext.request.contextPath}/patent/findPatent.do?pn=" + pageVal + "&cname=<%=condition.getCname()%>\n" +
                "&dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>";
        }else {
            alert('请输入数字！')
        }
    })
</script>
</body>
</html>
