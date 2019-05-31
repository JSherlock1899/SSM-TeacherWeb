<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ page import="com.github.pagehelper.PageInfo" %>
<%@ page import="java.util.List" %>
<%@ page import="com.slxy.edu.model.Paper" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>论文查询</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/bootstrap.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxPaperData.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/commonUse.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/bootstrap-table.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxSelect.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/style.css">
</head>
<body>
<%
    PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
    List<Paper> papers = pageInfo.getList();
    String tsn = (String) request.getSession().getAttribute("username");
    String Tname = (String) request.getSession().getAttribute("Tname");
%>
<div class="table-main col-md-12">
    <div class="col-md-4" >
        <ol class="breadcrumb">
            <li><a href="#">主页</a></li>
            <li><a href="#">查询</a></li>
            <li class="active">论文查询</li>
        </ol>
    </div>
    <div class="row">
        <div class="col-md-11 col-md-offset-1 ">
            <div class="col-md-10 button-div form-inline">
                <input type="button" value="新建记录" id="btn_add" class="btn btn-success">
                <%--<a href="<%=request.getContextPath()%>/poi/getTemplate.do?name=paper" class="btn btn-success">下载模板</a>--%>
                <form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/paper/importExcel.do" class="form-group importform">
                    <input type="file" id="file" name="file" class="btn btn-info" style="display: none"
                           onchange="$('.importform').submit()">
                    <%--<input type="button" name="" value="导入" class="btn btn-info" id="importFileButton">--%>
                </form>
                <form action="<%=request.getContextPath()%>/teacher/exportPaper.do?&tsn=<%=tsn%>" method="post" id="ProjectForm" class="form-group">
                    <input type="submit" value="导出" id="submitChecked" class="btn btn-info">
                </form>
            </div>
            <table border="1" id="table" class="table table-striped table-bordered table-hover table-condensed">
                <tr class="info">
                    <th>编号</th>
                    <th>名称</th>
                    <th>第一作者</th>
                    <th>发表期刊</th>
                    <th>期/卷/页</th>
                    <th>发表时间</th>
                    <th>附件</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${papers}" var="papers">
                    <tr>
                        <td class="Pasearchnum"><a href="${pageContext.request.contextPath}/teacher/goPaperDetail.do?pasearchnum=${papers.pasearchnum}">${papers.pasearchnum}</a></td>
                        <td>${papers.paname}</td>
                        <td>${papers.tname}</td>
                        <td>${papers.papublish}</td>
                        <td>${papers.pdisvol}</td>
                        <td>${papers.padate}</td>
                        <td>
                            <a href="<%=request.getContextPath()%>/file/download.do?model=paper&majorkey=${papers.pasearchnum}&name=${papers.paname}" class="Download">查看附件</a>
                            <input type="hidden" class="accessoryPath" value="${papers.paccessory}"/>
                        </td>
                        <td>
                            <a class="btn btn-danger delete">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <!--显示分页信息-->
            <div class="row">
                <!--点击分页-->
                <div>
                    <ul class="pagination">
                        <li>
                            <a href="${pageContext.request.contextPath}/teacher/findPaper.do?pn=1&tsn=<%=tsn%>">首页</a>
                        </li>
                        <!--上一页-->
                        <li>
                            <c:if test="${pageInfo.hasPreviousPage}">
                                <a href="${pageContext.request.contextPath}/teacher/findPaper.do?pn=${pageInfo.pageNum-1}&tsn=<%=tsn%>"
                                   aria-label="Previous">
                                    <span aria-hidden="true">«</span>
                                </a>
                            </c:if>
                        </li>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                            <c:if test="${page_num == pageInfo.pageNum}">
                                <li class="active"><a
                                        href="${pageContext.request.contextPath}/teacher/findPaper.do?pn=1&tsn=<%=tsn%>">${page_num}</a>
                                </li>
                            </c:if>
                            <c:if test="${page_num != pageInfo.pageNum}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/teacher/findPaper.do?pn=${page_num}&tsn=<%=tsn%>">${page_num}</a>
                                </li>
                            </c:if>
                        </c:forEach>
                        <!--下一页-->
                        <li>
                            <c:if test="${pageInfo.hasNextPage}">
                                <a href="${pageContext.request.contextPath}/teacher/findPaper.do?pn=${pageInfo.pageNum+1}&tsn=<%=tsn%>"
                                   aria-label="Next">
                                    <span aria-hidden="true">»</span>
                                </a>
                            </c:if>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/teacher/findPaper.do?pn=${pageInfo.pages}&tsn=<%=tsn%>">尾页</a>
                        </li>
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
                            <h4 class="modal-title" id="myModalLabel">新建论文信息</h4>
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="Paname">论文名</label>
                                <input type="text" name="Paname"
                                       class="form-control" id="Paname" placeholder="论文名"
                                       onfocus="showTips('Paname','论文名称不能超过50个字符')"
                                       onblur="checkPaname('Paname','请按要求输入论文名称')">
                                <div id="Panamediv" style="display:none">
                                    <span id="Panamespan" ></span><br>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="tname">第一作者</label> <input type="text" value="<%=Tname%>"
                                                                          name="tname" class="form-control" id="tname"
                                                                          placeholder="第一作者" readonly>
                            </div>
                            <div class="form-group">
                                <label for="Papublish">发表期刊</label> <input type="text"
                                                                           name="Papublish" class="form-control" id="Papublish"
                                                                           placeholder="发表期刊">
                            </div>
                            <div class="form-group">
                                <label for="Pdisvol">期/卷/页</label> <input type="text" name="Pdisvol"
                                                                          class="form-control" id="Pdisvol" placeholder="期/卷/页">
                            </div>
                            <div class="form-group">
                                <label for="Padate">发表时间</label> <input type="date" name="Padate"
                                                                        class="form-control" id="Padate" placeholder="发表时间">
                            </div>
                            <div class="form-group">
                                <label for="Pagrad">级别</label><select name="Pagrad"
                                                                      class="form-control" id="Pagrad">
                                <option value="SCI">SCI</option>
                                <option value="SSCI">SSCI</option>
                                <option value=CSSCI>CSSCI</option>
                                <option value="CSCD">CSCD</option>
                                <option value="北大核心">北大核心</option>
                                <option value="科技核心">科技核心</option>
                                <option value="本科院校学报">本科院校学报</option>
                            </select>
                            </div>
                            <div class="form-group">
                                <label for="dependence">依托项目</label>
                                <input type="text" name="dependence" class="form-control" id="dependence" placeholder="依托项目">
                            </div>
                            <div class="form-group">
                                <label for="Paremarks">备注</label>
                                <input type="text" name="Paremarks" class="form-control" id="Paremarks" placeholder="备注">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">
                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
                            </button>
                            <button type="submit" id="btn_submit"
                                    class="btn btn-primary saveNewMsg">
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
        var totalPage = ${pageInfo.pages};
        if(pageVal > totalPage){
            alert('请输入正确的页码！');
            return
        }
        if(pageVal == ""){
            alert('页码不能为空！');
            return
        }
        if(!isNaN(pageVal)){
            window.location.href = "${pageContext.request.contextPath}/teacher/findPaper.do?pn" + pageVal + "&tsn=<%=tsn%>";
        }else {
            alert('请输入数字！')
        }
    })
</script>
</body>
</html>
