<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ page import="java.util.List" %>
<%@ page import="com.slxy.edu.model.Patent" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>专利查询</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/bootstrap.css">
</head>
<body>
<!--通过bootstrap的栅格系统布局-->

<!--通过bootstrap的栅格系统布局-->

<div class="container">

    <%
        List<Patent> patents = (List<Patent>) request.getAttribute("patentList");
        System.out.println(patents == null);
    %>
    <!--标题-->

    <div class="row">

        <div class="col-md-12">

            <h1>SSM-CRUD</h1>

        </div>


    </div>


    <!--按钮-->

    <div class="row">

        <div class="col-md-4 col-md-offset-8">

            <button class="btn btn-primary">新增</button>

            <button class="btn btn-danger">删除</button>

        </div>

    </div>


    <!--显示表格数据-->

    <div class="row">

        <div class="col-md-12">

            <table class="table table-hover">

                <tr>

                    <th>#</th>

                    <th>empName</th>

                    <th>gender</th>

                    <th>email</th>

                    <th>deptName</th>

                    <th>操作</th>

                </tr>


                <c:forEach items="${patents}" var="patents">
                    <tr>

                        <td>${patents.patname}</td>

                        <td>${patents.patsn}</td>

                        <td>${patents.patapdate}</td>

                        <td>${patents.patendate}</td>

                        <td>${patents.patgrad}</td>

                    <tr>

                            <button class="btn btn-primary">

                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>

                                编辑

                            </button>


                            <button class="btn btn-danger">

                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>

                                删除

                            </button>


                        </tr>

                    </tr>

                </c:forEach>


            </table>

        </div>


    </div>


    <!--显示分页信息-->

    <div class="row">
        <!--文字信息-->

        <div class="col-md-6">

            当前第 ${pageInfo.pageNum} 页.总共 ${pageInfo.pages} 页.一共 ${pageInfo.total} 条记录

        </div>


        <!--点击分页-->

        <div class="col-md-6">

            <nav aria-label="Page navigation">

                <ul class="pagination">


                    <li><a href="${pageContext.request.contextPath}/emps?pn=1">首页</a></li>


                    <!--上一页-->

                    <li>

                        <c:if test="${pageInfo.hasPreviousPage}">

                            <a href="${pageContext.request.contextPath}/emps?pn=${pageInfo.pageNum-1}"
                               aria-label="Previous">

                                <span aria-hidden="true">«</span>

                            </a>

                        </c:if>

                    </li>


                    <!--循环遍历连续显示的页面，若是当前页就高亮显示，并且没有链接-->

                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">

                        <c:if test="${page_num == pageInfo.pageNum}">

                            <li class="active"><a href="#">${page_num}</a></li>

                        </c:if>

                        <c:if test="${page_num != pageInfo.pageNum}">

                            <li><a href="${pageContext.request.contextPath}/emps?pn=${page_num}">${page_num}</a></li>

                        </c:if>

                    </c:forEach>


                    <!--下一页-->

                    <li>

                        <c:if test="${pageInfo.hasNextPage}">

                            <a href="${pageContext.request.contextPath}/emps?pn=${pageInfo.pageNum+1}"

                               aria-label="Next">

                                <span aria-hidden="true">»</span>

                            </a>

                        </c:if>

                    </li>


                    <li><a href="${pageContext.request.contextPath}/emps?pn=${pageInfo.pages}">尾页</a></li>

                </ul>

            </nav>

        </div>


    </div>


</div>


</body>
</html>
