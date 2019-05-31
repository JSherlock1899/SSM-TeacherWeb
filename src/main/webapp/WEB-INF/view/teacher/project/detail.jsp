<%@ page import="com.slxy.edu.model.Project" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>详细信息</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/fileinput.min.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/commonUse.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/bootstrap-table.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/fileinput.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/zh.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/style.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxProjectData.js"></script>
</head>
<body>
<%
    Project project = (Project) request.getAttribute("project");
    String grade = (String) request.getSession().getAttribute("grade");
%>
<div class="table-main col-md-12">
    <div class="col-md-4">
        <ol class="breadcrumb" style="margin-left:5em;margin-top:2em">
            <li><a href="#">主页</a></li>
            <li><a href="#">查询</a></li>
            <li><a href="#">项目查询</a></li>
            <li class="active">详细信息</li>
        </ol>
    </div>
    <input type="hidden" value="<%=grade%>" id="grade">
    <div class="row">
        <div class="col-md-11 col-md-offset-1 ">
            <div class="col-md-10 button-div form-inline">
                <input type="file" id="file" style="display: none">
            </div>
            <table border="2" id="table" class="table table-striped table-bordered table-condensed">
                <tr class="info">
                    <td>项目名称</td>
                    <td class="Pname text-center" colspan="3"><%=project.getPname()%></td>
                </tr>
                <tr>
                    <td>项目编号</td>
                    <td class="Psn" ><%=project.getPsn()%></td>
                    <td>负责人</td>
                    <td class="Pleader"><%=project.getTname()%></td>
                </tr>
                <tr>
                    <td>级别</td>
                    <td class="Pgrad"><%=project.getPgrad()%></td>
                    <td>类型</td>
                    <td class="Pkind"><%=project.getPkind()%></td>
                </tr>
                <tr>
                    <td>科研状态</td>
                    <td class="Pcondition"><%=project.getPcondition()%></td>
                    <td>成员</td>
                    <td class="Pmember"><%=project.getPmember()%></td>
                </tr>
                <tr>
                    <td>经费（元）</td>
                    <td class="Pmoney"><%=project.getPmoney()%></td>
                    <td>立项时间</td>
                    <td class="Pstatime"><%=project.getPstatime()%></td>
                </tr>
                <tr>
                    <td>结题时间</td>
                    <td class="Pendtime"><%=project.getPendtime()%></td>
                    <td>附件</td>
                    <td colspan="3"><a href="<%=request.getContextPath()%>/file/download.do?model=project&majorkey=<%=project.getPsn()%>&name=<%=project.getPname()%>"  class="btn btn-primary Download" value="上传">下载附件</a></td>
                    <input type="hidden" id="accessoryPath" value="<%=project.getPaccessory() %>"/>
                </tr>
                <tr>
                    <td>备注</td>
                    <td class="Patremarks" colspan="3"><%=project.getPremarks()%></td>
                </tr>
                <tr>
                    <td>审核情况</td>
                    <td><%=project.getPaudit()%></td>
                    <td>审核意见</td>
                    <td><%=project.getMessage()%></td>
                </tr>
            </table>
            <div id="teacher">
                <button class="btn btn-primary form-group" style="width:100%;margin-bottom:10px" id="btn_update">重新编辑</button>
                <!--新建信息的模态框 -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                                <h4 class="modal-title" id="myModalLabel">新建项目</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="Psn">项目编号</label>
                                    <input type="text" name="Psn" id="Psn" onfocus="showTips('Psn','项目编号不能超过50个字符')" value="<%=project.getPsn() %>"
                                           onblur="checkPsn('Psn','请按要求输入项目编号')" class="form-control" id="Psn" placeholder="项目编号">
                                    <div id="Psndiv" style="display:none">
                                        <span id="Psnspan" ></span><br>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Pname">项目名称</label> <input type="text" name="Pname"  value="<%=project.getPname()%>"
                                                                           onfocus="showTips('Pname','项目名称不能超过50个字符')"
                                                                           onblur="checkPname('Pname','请按要求输入项目名称')"
                                                                           class="form-control" id="Pname" placeholder="项目名称">
                                    <div id="Pnamediv" style="display:none">
                                        <span id="Pnamespan" ></span><br>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Pleader">负责人</label> <input type="text"    value="<%=project.getTname() %>"
                                                                            name="Pleader" class="form-control" id="Pleader"
                                                                            placeholder="负责人" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="Pgrad">级别</label>
                                    <select name="Pgrad"  value="<%=project.getPgrad() %>"
                                            class="form-control" id="Pgrad">
                                        <option value="校级">校级</option>
                                        <option value="市级">市级</option>
                                        <option value="省级">省级</option>
                                        <option value="部级">部级</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="Pkind">类型</label>
                                    <select name="Pkind"  value="<%=project.getPkind() %>"
                                            class="form-control" id="Pkind">
                                        <option value="横向">横向</option>
                                        <option value="纵向">纵向</option>
                                    </select>
                                </div>
                                <div class="form-group contractTypediv">
                                    <label for="contractType">合同类型</label>
                                    <select name="contractType"  value="<%=project.getContractType() %>"
                                            class="form-control" id="contractType">
                                        <option value="技术开发(委托)">技术开发(委托)</option>
                                        <option value="技术服务">技术服务</option>
                                        <option value="技术咨询">技术咨询</option>
                                        <option value="技术转让">技术转让</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="Pcondition">科研状态</label>
                                    <select name="Pcondition"  value="<%=project.getPcondition() %>"
                                            class="form-control" id="Pcondition">
                                        <option value="未结题">未结题</option>
                                        <option value="已结题">已结题</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="Pmoney">经费（万元）</label>
                                    <input type="text" name="Pmoney"   value="<%=project.getPmoney() %>"
                                           class="form-control" id="Pmoney" placeholder="经费"
                                           onfocus="showTips('Pmoney','项目经费为数字')"
                                           onblur="checkPmoney('Pmoney','请按要求输入项目经费')">
                                    <div id="Pmoneydiv" style="display:none">
                                        <span id="Pmoneyspan" ></span><br>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Pstatime">立项时间 </label> <input type="date"  value="<%=project.getPstatime()%>"
                                                                               name="Pstatime" class="form-control" id="Pstatime"
                                                                               placeholder="立项时间	">
                                </div>
                                <div class="form-group">
                                    <label for="Pendtime">结题时间</label> <input type="date"  value="<%=project.getPendtime()%>"
                                                                              name="Pendtime" class="form-control" id="Pendtime"
                                                                              placeholder="结题时间">
                                </div>
                                <div class="form-group">
                                    <label for="Premarks">备注</label> <input type="text"  value="<%=project.getPremarks()%>"
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
                                        class="btn btn-primary save">
                                    <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>提交
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container-fluid">
                    <div class="row form-group">
                        <div class="panel panel-primary">
                            <div class="panel-heading" align="center">
                                <label style="text-align: center;font-size: 18px;">文 件 上 传</label>
                            </div>
                            <div class="panel-body">
                                <div class="col-sm-12">
                                    <input id="uploadfile" name="file" multiple type="file" data-show-caption="true">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>