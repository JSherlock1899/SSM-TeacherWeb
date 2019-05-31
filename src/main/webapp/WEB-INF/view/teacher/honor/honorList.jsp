<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ page import="com.github.pagehelper.PageInfo" %>
<%@ page import="java.util.List" %>
<%@ page import="com.slxy.edu.model.Honor" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>荣誉查询</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/bootstrap.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxHonorData.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/commonUse.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/bootstrap-table.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxSelect.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/style.css">
</head>
<body>
<%
    PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
    List<Honor> honors = pageInfo.getList();
    String tsn = (String) request.getSession().getAttribute("username");
    String Tname = (String) request.getSession().getAttribute("Tname");
%>
<div class="table-main col-md-12">
    <div class="col-md-4" >
        <ol class="breadcrumb">
            <li><a href="#">主页</a></li>
            <li><a href="#">查询</a></li>
            <li class="active">荣誉查询</li>
        </ol>
    </div>
    <div class="row">
        <div class="col-md-11 col-md-offset-1 ">
            <div class="col-md-10 button-div form-inline">
                <input type="button" value="新建记录" id="btn_add" class="btn btn-success">
                <%--<a href="<%=request.getContextPath()%>/poi/getTemplate.do?name=honor" class="btn btn-success">下载模板</a>--%>
                <form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/honor/importExcel.do" class="form-group importform">
                    <input type="file" id="file" name="file" class="btn btn-info" style="display: none" onchange="$('.importform').submit()">
                    <%--<input type="button" name="" value="导入" class="btn btn-info" id="importFileButton">--%>
                </form>
                <form action="<%=request.getContextPath()%>/teacher/exportHonor.do?&tsn=<%=tsn%>" method="post" id="ProjectForm" class="form-group">
                    <input type="submit" value="导出" id="submitChecked" class="btn btn-info">
                </form>
            </div>
            <table border="1" id="table" class="table table-striped table-bordered table-hover table-condensed">
                <tr class="info">
                    <th>编号</th>
                    <th>名称</th>
                    <th>第一完成人</th>
                    <th>时间</th>
                    <th>等级</th>
                    <th>附件</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${honors}" var="honors">
                    <tr>
                        <td class="Hsn"><a href="${pageContext.request.contextPath}/teacher/goHonorDetail.do?hsn=${honors.hsn}">${honors.hsn}</a></td>
                        <td>${honors.hname}</td>
                        <td>${honors.tname}</td>
                        <td>${honors.hdate}</td>
                        <td>${honors.hgrad}</td>
                        <td>
                            <a href="<%=request.getContextPath()%>/file/download.do?model=honor&majorkey=${honors.hsn}&name=${honors.hname}" class="Download">查看附件</a>
                            <input type="hidden" class="accessoryPath" value="${honors.haccessory}"/>
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
                        <li><a href="${pageContext.request.contextPath}/teacher/findHonor.do?pn=1&tsn=<%=tsn%>">首页</a></li>
                        <!--上一页-->
                        <li>
                            <c:if test="${pageInfo.hasPreviousPage}">
                                <a href="${pageContext.request.contextPath}/teacher/findHonor.do?pn=${pageInfo.pageNum-1}&tsn=<%=tsn%>" aria-label="Previous">
                                    <span aria-hidden="true">«</span>
                                </a>
                            </c:if>
                        </li>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                            <c:if test="${page_num == pageInfo.pageNum}">
                                <li class="active"><a href="${pageContext.request.contextPath}/teacher/findHonor.do?pn=1&tsn=<%=tsn%>">${page_num}</a></li>
                            </c:if>
                            <c:if test="${page_num != pageInfo.pageNum}">
                                <li><a href="${pageContext.request.contextPath}/teacher/findHonor.do?pn=${page_num}&tsn=<%=tsn%>">${page_num}</a></li>
                            </c:if>
                        </c:forEach>
                        <!--下一页-->
                        <li>
                            <c:if test="${pageInfo.hasNextPage}">
                                <a href="${pageContext.request.contextPath}/teacher/findHonor.do?pn=${pageInfo.pageNum+1}&tsn=<%=tsn%>"
                                   aria-label="Next">
                                    <span aria-hidden="true">»</span>
                                </a>
                            </c:if>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/teacher/findHonor.do?pn=${pageInfo.pages}&tsn=<%=tsn%>">尾页</a></li>
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
                            <h4 class="modal-title" id="myModalLabel">修改荣誉信息</h4>
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="Hname">荣誉名称</label>
                                <input type="text" name="Hname"
                                       class="form-control" id="Hname" placeholder="荣誉名称"
                                       onfocus="showTips('Hname','荣誉名称不能超过50个字符')"
                                       onblur="checkHname('Hname','请按要求输入荣誉名称')">
                                <div id="Hnamediv" style="display:none">
                                    <span id="Hnamespan" ></span><br>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Hwinner">第一完成人</label>
                                <input type="text"
                                       name="Hwinner" class="form-control" id="Hwinner" value="<%=Tname%>"
                                       placeholder="第一完成人"  readonly>
                                <div id="Hwinnerdiv" style="display:none">
                                    <span id="Hwinnerspan" ></span><br>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="department">第一完成单位</label>
                                <input type="text"
                                       name="department" class="form-control" id="department"
                                       placeholder="第一完成单位" >
                            </div>
                            <div class="form-group">
                                <label for="Hdate">获奖时间</label> <input type="date"
                                name="Hdate" class="form-control" id="Hdate" placeholder="获奖时间">
                            </div>
                            <div class="form-group">
                                <label for="Hcompany">颁奖单位</label>
                                <input type="text" name="Hcompany"
                                       class="form-control" id="Hcompany" placeholder="颁奖单位"
                                       onfocus="showTips('Hcompany','颁发单位不能超过16个字符')"
                                       onblur="checkHcompany('Hcompany','请按要求输入颁发单位')">
                                <div id="Hcompanydiv" style="display:none">
                                    <span id="Hcompanyspan" ></span><br>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Hgrad">级别</label>
                                <select name="Hgrad"
                                        class="form-control" id="Hgrad">
                                    <option value="校级">校级</option>
                                    <option value="市级">市级</option>
                                    <option value="省级">省级</option>
                                    <option value="国家级">国家级</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="Hremarks">备注</label>
                                <input type="text" name="Hremarks" class="form-control" id="Hremarks" placeholder="备注">
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
            window.location.href = "${pageContext.request.contextPath}/teacher/findHonor.do?pn" + pageVal + "&tsn=<%=tsn%>";
        }else {
            alert('请输入数字！')
        }
    })
</script>
</body>
</html>
