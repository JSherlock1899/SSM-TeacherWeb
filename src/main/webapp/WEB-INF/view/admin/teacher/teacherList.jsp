<%@ page import="com.github.pagehelper.PageInfo" %>
<%@ page import="com.slxy.edu.model.Condition" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>教师管理</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/bootstrap.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/commonUse.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/bootstrap-table.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxSelect.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxTeacherData.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/AdminJS.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/style.css">
</head>
<body>
<%
    PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
    Condition condition = (Condition) request.getAttribute("condition");
    String Cname = (String) request.getSession().getAttribute("cname");
%>
<div class="table-main col-md-12">
    <div class="col-md-4" >
        <ol class="breadcrumb">
            <li><a href="#">主页</a></li>
            <li><a href="#">其他</a></li>
            <li class="active">教师管理</li>
        </ol>
    </div>
    <div class="row">
        <div class="col-md-11 col-md-offset-1 ">
            <div class="col-md-10 button-div form-inline">
            <a href="<%=request.getContextPath()%>/poi/getTemplate.do?name=teacher" class="btn btn-success">下载模板</a>
            <form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/teacher/importExcel.do" class="form-group importform">
                <input type="file" id="file" name="file" class="btn btn-info" style="display: none" onchange="$('.importform').submit()">
                <input type="button" name="" value="导入"  class="btn btn-info" id="importFileButton">
            </form>
        </div>
            <table border="1" id="table" class="table table-striped table-bordered table-hover table-condensed">
                <tr class="info">
                    <th>工号</th>
                    <th>教师名</th>
                    <th>性别</th>
                    <th>学位</th>
                    <th>学历</th>
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
                        <td class="JobTitle">${teachers.jobTitle}</td>
                        <td class="Tdateofbirth">${teachers.tdateofbirth}</td>
                        <td class="Cname">${teachers.cname}</td>
                        <td class="Dname">${teachers.dname}</td>
                        <td>
                            <a class="btn btn-danger delete">删除</a>
                            <input type="button" value="编辑" class="update btn btn-primary">
                        </td>
                </tr>
                </c:forEach>
            </table>
            <div class="row">
                <!--点击分页-->
                <div>
                    <ul class="pagination">
                        <li><a href="${pageContext.request.contextPath}/teacher/findTeacher.do?pn=1&cname=<%=Cname%>
                            &dname=<%=condition.getDname()%>&tname=<%=condition.gettname()%>">首页</a></li>
                        <!--上一页-->
                        <li>
                            <c:if test="${pageInfo.hasPreviousPage}">
                                <a href="${pageContext.request.contextPath}/teacher/findTeacher.do?pn=${pageInfo.pageNum-1}&cname=<%=Cname%>
                            &dname=<%=condition.getDname()%>&tname=<%=condition.gettname()%>" aria-label="Previous">
                                    <span aria-hidden="true">«</span>
                                </a>
                            </c:if>
                        </li>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                            <c:if test="${page_num == pageInfo.pageNum}">
                                <li class="active"><a href="${pageContext.request.contextPath}/teacher/findTeacher.do?pn=1&cname=<%=Cname%>
                            &dname=<%=condition.getDname()%>&tname=<%=condition.gettname()%>">${page_num}</a></li>
                            </c:if>
                            <c:if test="${page_num != pageInfo.pageNum}">
                                <li><a href="${pageContext.request.contextPath}/teacher/findTeacher.do?pn=${page_num}&cname=<%=Cname%>
                            &dname=<%=condition.getDname()%>&tname=<%=condition.gettname()%>">${page_num}</a></li>
                            </c:if>
                        </c:forEach>
                        <!--下一页-->
                        <li>
                            <c:if test="${pageInfo.hasNextPage}">
                                <a href="${pageContext.request.contextPath}/teacher/findTeacher.do?pn=${pageInfo.pageNum+1}&cname=<%=Cname%>
                            &dname=<%=condition.getDname()%>&tname=<%=condition.gettname()%>"
                                   aria-label="Next">
                                    <span aria-hidden="true">»</span>
                                </a>
                            </c:if>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/teacher/findTeacher.do?pn=${pageInfo.pages}&cname=<%=Cname%>
                            &dname=<%=condition.getDname()%>&tname=<%=condition.gettname()%>">尾页</a></li>
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
                            <h4 class="modal-title" id="myModalLabel">修改教师信息</h4>
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true"></span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="Tsn">教师号</label> <input type="text" name="Tsn"
                                                                    class="form-control" id="Tsn" placeholder="教师号"
                                                                    onfocus="showTips('Tsn','教师工号为1-6位的数字')"
                                                                    onblur="checkTsn('Tsn','请按要求输入教师工号')" readonly>
                                <div id="Tsndiv" style="display:none">
                                    <span id="Tsnspan" ></span><br>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Tname">教师名</label> <input type="text" name="Tname"
                                                                      class="form-control" id="Tname" placeholder="教师名"
                                                                      onfocus="showTips('Tname','教师姓名不能超过10个字符')"
                                                                      onblur="checkTname('Tname','请按要求输入教师姓名')">
                                <div id="Tnamediv" style="display:none">
                                    <span id="Tnamespan" ></span><br>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Tsex">性别</label>
                                <select name="Tsex"
                                        class="form-control" id="Tsex">
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="Tdegree">学位</label>
                                <select name="Tdegree" class="form-control" id="Tdegree">
                                    <option value="学士">学士</option>
                                    <option value="硕士">硕士</option>
                                    <option value="博士">博士</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="Tedubackground">学历</label>
                                <input type="text"  name="Tedubackground" class="form-control" id="Tedubackground" placeholder="学历">
                            </div>
                            <div class="form-group">
                                <label for="Tresdirection">研究方向</label>
                                <input type="text"  name="Tresdirection" class="form-control" id="Tresdirection" placeholder="研究方向">
                            </div>
                            <div class="form-group">
                                <label for="JobTitle">职称</label>
                                <select name="JobTitle" class="form-control" id="JobTitle">
                                    <option value="教授">教授</option>
                                    <option value="副教授">副教授</option>
                                    <option value="讲师">讲师</option>
                                    <option value="助教">助教</option>
                                    <option value="高级工程师">高级工程师</option>
                                    <option value="工程师">工程师</option>
                                    <option value="高级农艺师">高级农艺师</option>
                                    <option value="农艺师">农艺师</option>
                                    <option value="研究员">研究员</option>
                                    <option value="副研究员">副研究员</option>
                                    <option value="助理研究员">助理研究员</option>
                                    <option value="高级实验师">高级实验师</option>
                                    <option value="实验师">实验师</option>
                                    <option value="高级会计师">高级会计师</option>
                                    <option value="会计师">会计师</option>
                                    <option value="编审">编审</option>
                                    <option value="副编审">副编审</option>
                                    <option value="编辑">编辑</option>
                                    <option value="研究馆员">研究馆员</option>
                                    <option value="副研究馆员">副研究馆员</option>
                                    <option value="馆员">馆员</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="Tdateofbirth">出生年月</label>
                                <input type="date" name="Tdateofbirth" class="form-control" id="Tdateofbirth" placeholder="出生年月">
                            </div>
                            <div class="form-group">
                                <label for="college">所属学院</label>
                                <select id="college" class="form-control" name="college" style="width: 100%"
                                        onchange="move()">>
                                    <option value="">请选择所在学院</option>
                                    <c:forEach items="${collegeList}" var="collegeName">
                                        <option value="${collegeName}">${collegeName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="sdept">所属系</label>
                                <select id="sdept" class="form-control" style="width:100%;margin-left:0">
                                    <option value="请选择所在专业">请选择所在专业</option>
                                </select>
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
            window.location.href = "${pageContext.request.contextPath}/teacher/findTeacher.do?pn=" + pageVal + "&cname=<%=Cname%>\n" +
                "&dname=<%=condition.getDname()%>&tname=<%=condition.gettname()%>";
        }else {
            alert('请输入数字！')
        }
    })
</script>
</body>
</html>