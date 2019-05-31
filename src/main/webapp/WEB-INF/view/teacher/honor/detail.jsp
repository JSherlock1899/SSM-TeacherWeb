<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="com.slxy.edu.model.Honor" %>
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
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxHonorData.js"></script>
</head>
<body>

<%
    Honor honor = (Honor) request.getAttribute("honor");
    String grade = (String) request.getSession().getAttribute("grade");
%>
<div class="table-main col-md-12" >
    <div class="col-md-4" >
        <ol class="breadcrumb" style="margin-left:5em;margin-top:2em">
            <li><a href="#">主页</a></li>
            <li><a href="#">查询</a></li>
            <li><a href="#">荣誉查询</a></li>
            <li class="active">详细信息</li>
        </ol>
    </div>
        <input type="hidden" value="<%=grade%>" id="grade">
    <div class="row">
        <div class="col-md-11 col-md-offset-1 ">
            <table border="2" id="table" class="table table-striped table-bordered table-condensed">
                <tr class="info">
                    <td>名称</td>
                    <td class="Hname text-center"  colspan="5"><%=honor.getHname()%></td>
                </tr>
                <tr>
                    <td>编号</td>
                    <td class="Hsn" colspan="2"><%=honor.getHsn()%></td>
                    <td>第一完成人</td>
                    <td class="Hwinner" colspan="2"><%=honor.getTname()%></td>
                </tr>
                <tr>
                    <td>时间</td>
                    <td class="Hdate" colspan="2"><%=honor.getHdate()%></td>
                    <td>颁奖单位</td>
                    <td class="Hcompany" colspan="2"><%=honor.getHcompany()%></td>
                </tr>
                <tr>
                    <td>级别</td>
                    <td class="Hgrad"><%=honor.getHgrad()%></td>
                    <td>第一完成单位</td>
                    <td class="department"><%=honor.getDepartment()%></td>
                    <td>附件</td>
                    <td><a href="<%=request.getContextPath()%>/file/download.do?model=honor&majorkey=<%=honor.getHsn()%>&name=<%=honor.getHname()%>"  class="btn btn-primary Download">下载附件</a></td>
                    <input type="hidden" id="accessoryPath" value="<%=honor.getHaccessory() %>"/>
                </tr>
                <tr>
                    <td>备注</td>
                    <td class="Hremarks" colspan="5"><%=honor.getHremarks()%></td>
                </tr>
                <tr>
                    <td>审核情况</td>
                    <td><%=honor.getHaudit()%></td>
                    <td>审核意见</td>
                    <td colspan="3"><%=honor.getMessage()%></td>
                </tr>
            </table>
           <div id="teacher">
               <button class="btn btn-primary form-group" style="width:100%;margin-bottom:10px" id="btn_update">重新编辑</button>
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
                                   <label for="Hsn">荣誉编号</label>
                                   <input type="text" name="Hsn" value="<%=honor.getHsn()%>"
                                          class="form-control" id="Hsn" placeholder="荣誉编号"
                                          onfocus="showTips('Hsn','荣誉编号为1-20位的数字')"
                                          onblur="checkHsn('Hsn','请按要求输入荣誉编号')">
                                   <div id="Hsndiv" style="display:none">
                                       <span id="Hsnspan" ></span><br>
                                   </div>
                               </div>
                               <div class="form-group">
                                   <label for="Hname">荣誉名称</label>
                                   <input type="text" name="Hname" value="<%=honor.getHname()%>"
                                          class="form-control" id="Hname" placeholder="荣誉名称"
                                          onfocus="showTips('Hname','荣誉名称不能超过50个字符')"
                                          onblur="checkHname('Hname','请按要求输入荣誉名称')">
                                   <div id="Hnamediv" style="display:none">
                                       <span id="Hnamespan" ></span><br>
                                   </div>
                               </div>
                               <div class="form-group">
                                   <label for="Hwinner">第一完成人</label>
                                   <input type="text" value="<%=honor.getTname()%>" readonly
                                          name="Hwinner" class="form-control" id="Hwinner"
                                          placeholder="第一完成人" onfocus="showTips('Hwinner','第一完成人不能超过50个字符')"
                                          onblur="checkHwinner('Hwinner','请按要求输入第一完成人')">
                                   <div id="Hwinnerdiv" style="display:none">
                                       <span id="Hwinnerspan" ></span><br>
                                   </div>
                               </div>
                               <div class="form-group">
                                   <label for="department">第一完成单位</label>
                                   <input type="text" value="<%=honor.getDepartment()%>"
                                          name="department" class="form-control" id="department"
                                          placeholder="第一完成单位" >
                               </div>
                               <div class="form-group">
                                   <label for="Hdate">获奖时间</label> <input type="date"  value="<%=honor.getHdate()%>"
                                                                          name="Hdate" class="form-control" id="Hdate"
                                                                          placeholder="获奖时间">
                               </div>
                               <div class="form-group">
                                   <label for="Hcompany">颁奖单位</label>
                                   <input type="text" name="Hcompany" value="<%=honor.getHcompany()%>"
                                          class="form-control" id="Hcompany" placeholder="颁奖单位"
                                          onfocus="showTips('Hcompany','颁发单位不能超过16个字符')"
                                          onblur="checkHcompany('Hcompany','请按要求输入颁发单位')">
                                   <div id="Hcompanydiv" style="display:none">
                                       <span id="Hcompanyspan" ></span><br>
                                   </div>
                               </div>
                               <div class="form-group">
                                   <label for="Hgrad">级别</label>
                                   <select name="Hgrad"  value="<%=honor.getHgrad()%>"
                                           class="form-control" id="Hgrad">
                                       <option value="校级">校级</option>
                                       <option value="市级">市级</option>
                                       <option value="省级">省级</option>
                                       <option value="国家级">国家级</option>
                                   </select>
                               </div>
                               <div class="form-group">
                                   <label for="Hremarks">备注</label> <input type="text"  value="<%=honor.getHremarks()%>"
                                                                           name="Hremarks" class="form-control" id="Hremarks"
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