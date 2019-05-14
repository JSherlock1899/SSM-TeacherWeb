<%@ page import="java.util.List" %>
<%@ page import="com.slxy.edu.model.Teacher" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<html>
<head>
    <title>myInformation</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/bootstrap.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxTeacherData.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/commonUse.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/bootstrap-table.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxSelect.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/AdminJS.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/style.css">
</head>
<body>
    <%
        Teacher teacher = (Teacher) request.getAttribute("teacher");
    %>
    <div class="modal-body">
        <div class="form-group">
            <label for="Tsn">教师号</label> <input type="text" name="Tsn"
                                                class="form-control" id="Tsn" placeholder="教师号"
                                                onfocus="showTips('Tsn','教师工号为1-6位的数字')"
                                                onblur="checkTsn('Tsn','请按要求输入教师工号')" readonly value="<%=teacher.getTsn()%>">
            <div id="Tsndiv" style="display:none">
                <span id="Tsnspan" ></span><br>
            </div>
        </div>
        <div class="form-group">
            <label for="Tname">教师名</label> <input type="text" name="Tname"
                                                  class="form-control" id="Tname" placeholder="教师名"
                                                  onfocus="showTips('Tname','教师姓名不能超过10个字符')"
                                                  onblur="checkTname('Tname','请按要求输入教师姓名')" value="<%=teacher.getTname()%>">
            <div id="Tnamediv" style="display:none">
                <span id="Tnamespan" ></span><br>
            </div>
        </div>
        <div class="form-group">
            <label for="Tsex">性别</label>
            <select name="Tsex"
                    class="form-control" id="Tsex" value="<%=teacher.getTsex()%>">
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
        </div>
        <div class="form-group">
            <label for="Tdegree">学位</label>
            <select name="Tdegree" class="form-control" id="Tdegree" value="<%=teacher.getTdegree()%>">
                <option value="学士">学士</option>
                <option value="硕士">硕士</option>
                <option value="博士">博士</option>
            </select>
        </div>
        <div class="form-group">
            <label for="Tedubackground">学历</label>
            <input type="text"  name="Tedubackground" value="<%=teacher.getTedubackground()%>" class="form-control" id="Tedubackground" placeholder="学历">
        </div>
        <div class="form-group">
            <label for="Tresdirection">研究方向</label>
            <input type="text"  name="Tresdirection" class="form-control" value="<%=teacher.getTresdirection()%>" id="Tresdirection" placeholder="研究方向">
        </div>
        <div class="form-group">
            <label for="JobTitle">职称</label>
            <select name="JobTitle" class="form-control" id="JobTitle" value="<%=teacher.getJobTitle()%>">
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
            <input type="date" name="Tdateofbirth" value="<%=teacher.getTdateofbirth()%>" class="form-control" id="Tdateofbirth" placeholder="出生年月">
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
    <button class="btn btn-primary form-group save" style="width:100%;margin-bottom:10px">提交</button>
</body>
</html>
