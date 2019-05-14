<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ page import="com.github.pagehelper.PageInfo" %>
<%@ page import="com.slxy.edu.model.Condition" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>其他成果查询</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/bootstrap.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/commonUse.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxOtherData.js"></script>
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
            <li class="active">其他成果查询</li>
        </ol>
    </div>
    <div class="row">
        <div class="col-md-11 col-md-offset-1 ">
            <div class="col-md-10 button-div form-inline">
                <a href="<%=request.getContextPath()%>/poi/getTemplate.do?name=other" class="btn btn-success">下载模板</a>
                <form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/other/importExcel.do" class="form-group importform">
                    <input type="file" id="file" name="file" class="btn btn-info" style="display: none" onchange="$('.importform').submit()">
                    <input type="button" name="" value="导入"  class="btn btn-info" id="importFileButton">
                </form>
                <form action="<%=request.getContextPath()%>/other/export.do?&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>"  method="post" id="ProjectForm" class="form-group">
                    <input type="submit" value="导出" id="submitChecked" class="btn btn-info">
                </form>
            </div>
            <table border="1" id="table" class="table table-striped table-bordered table-hover table-condensed">
                <tr class="info">
                    <th>名称</th>
                    <th>发表人</th>
                    <th>类型</th>
                    <th>日期</th>
                    <th>发表单位</th>
                    <th>附件</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${others}" var="others">
                    <tr>
                        <td class="other_name"><a href="${pageContext.request.contextPath}/teacher/goOtherDetail.do?other_name=${others.other_name}">${others.other_name}</a></td>
                        <td class="tname">${others.tname}</td>
                        <td class="other_type">${others.other_type}</td>
                        <td class="other_date">${others.other_date}</td>
                        <td class="publisher">${others.publisher}</td>
                        <td>
                            <a href="<%=request.getContextPath()%>/file/download.do?model=other&majorkey=${others.other_name}&name=${others.other_name}" class="Download">查看附件</a>
                            <input type="hidden" class="accessoryPath" value="${others.accessory}"/>
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
                        <li><a href="${pageContext.request.contextPath}/other/findOther.do?pn=1&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>">首页</a></li>
                        <!--上一页-->
                        <li>
                            <c:if test="${pageInfo.hasPreviousPage}">
                                <a href="${pageContext.request.contextPath}/other/findOther.do?pn=${pageInfo.pageNum-1}&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>" aria-label="Previous">
                                    <span aria-hidden="true">«</span>
                                </a>
                            </c:if>
                        </li>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                            <c:if test="${page_num == pageInfo.pageNum}">
                                <li class="active"><a href="${pageContext.request.contextPath}/other/findOther.do?pn=1&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>">${page_num}</a></li>
                            </c:if>
                            <c:if test="${page_num != pageInfo.pageNum}">
                                <li><a href="${pageContext.request.contextPath}/other/findOther.do?pn=${page_num}&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>">${page_num}</a></li>
                            </c:if>
                        </c:forEach>
                        <!--下一页-->
                        <li>
                            <c:if test="${pageInfo.hasNextPage}">
                                <a href="${pageContext.request.contextPath}/other/findOther.do?pn=${pageInfo.pageNum+1}&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>"
                                   aria-label="Next">
                                    <span aria-hidden="true">»</span>
                                </a>
                            </c:if>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/other/findOther.do?pn=${pageInfo.pages}&cname=<%=condition.getCname()%>
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
                            <h4 class="modal-title" id="myModalLabel">修改其他成果信息</h4>
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="other_name">名称</label>
                                <input type="text" name="other_name"
                                       class="form-control" id="other_name" placeholder="名称"
                                       onfocus="showTips('other_name','查询编号为1-15位的字符')"
                                       onblur="checkother_name('other_name','请按要求输入查询的名称')">
                                <div id="other_namediv" style="display:none">
                                    <span id="other_namespan" ></span><br>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="tname">发表人</label>
                                <input type="text" name="tname"
                                       class="form-control" id="tname" placeholder="发表人" readonly>
                            </div>

                            <div class="form-group">
                                <label for="other_date">发表时间</label>
                                <input type="date" name="other_date" class="form-control" id="other_date" placeholder="发表时间">
                            </div>
                            <div class="form-group">
                                <label for="other_type">类型</label>
                                <select name="other_type" class="form-control" id="other_type">
                                    <option value="画">画</option>
                                    <option value="音乐歌曲">音乐歌曲</option>
                                    <option value="报纸">报纸</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="publisher">发表单位</label>
                                <input type="text" name="publisher" class="form-control" id="publisher" placeholder="发表单位">
                            </div>
                            <div class="form-group">
                                <label for="other_describe">成果描述</label>
                                <input type="text" name="other_describe" class="form-control" id="other_describe" placeholder="成果描述">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">
                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
                            </button>
                            <button type="submit" id="btn_submit" class="btn btn-primary alterSave">
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
            window.location.href = "${pageContext.request.contextPath}/other/findOther.do?pn=" + pageVal + "&cname=<%=condition.getCname()%>\n" +
                "&dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>";
        }else {
            alert('请输入数字！')
        }
    })
</script>
</body>
</html>
