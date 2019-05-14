<%@ page import="com.slxy.edu.model.Patent" %>
<%@ page buffer="10kb" %>
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
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxPatentData.js"></script>
</head>
<body>
<%
    Patent patent = (Patent) request.getAttribute("patent");
    String grade = (String) request.getSession().getAttribute("grade");
%>
<div class="table-main col-md-12">
    <div class="col-md-4">
        <ol class="breadcrumb" style="margin-left:5em;margin-top:2em">
            <li><a href="#">主页</a></li>
            <li><a href="#">查询</a></li>
            <li><a href="#">专利查询</a></li>
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
                    <td class="Patname text-center" colspan="6"><%=patent.getPatname()%></td>
                </tr>
                <tr>
                    <td>发明人</td>
                    <td class="inventor"><%=patent.getInventor()%></td>
                    <td>专利权人</td>
                    <td class="tname"><%=patent.getTname()%></td>
                    <td>授权号</td>
                    <td class="Patsn"><%=patent.getPatsn()%></td>
                </tr>
                <tr>
                    <td>申请时间</td>
                    <td class="Patapdate" colspan="2"><%=patent.getPatapdate()%></td>
                    <td>授权时间</td>
                    <td class="Patendate" colspan="2"><%=patent.getPatendate()%></td>
                </tr>
                <tr>
                    <td>类别</td>
                    <td class="Patgrad"><%=patent.getPatgrad()%></td>
                    <td>附件</td>
                    <td colspan="3"><a href="<%=request.getContextPath()%>/file/download.do?model=patent&majorkey=<%=patent.getPatsn()%>&name=<%=patent.getPatname()%>" class="btn btn-primary Download">下载附件</a></td>
                    <input type="hidden" id="accessoryPath" value="<%=patent.getPaccessory() %>"/>
                </tr>
                <tr>
                    <td>备注</td>
                    <td class="Patremarks" colspan="5"><%=patent.getPatremarks()%></td>
                </tr>
                <tr>
                    <td>审核情况</td>
                    <td><%=patent.getPaudit()%></td>
                    <td>审核意见</td>
                    <td colspan="3"><%=patent.getMessage()%></td>
                </tr>
            </table>
           <div id="teacher">
               <button class="btn btn-primary form-group" style="width:100%;margin-bottom:10px" id="btn_update">重新编辑</button>
               <!--新建信息的模态框 -->
               <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                    data-backdrop="static">
                   <div class="modal-dialog" role="document">
                       <div class="modal-content">
                           <div class="modal-header">
                               <h4 class="modal-title" id="myModalLabel">重新编辑专利信息</h4>
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
                                          onblur="checkPatname('Patname','请按要求输入专利名称')" value="<%=patent.getPatname()%>">
                                   <div id="Patnamediv" style="display:none">
                                       <span id="Patnamespan"></span><br>
                                   </div>
                               </div>
                               <div class="form-group">
                                   <label for="Patsn">授权号</label>
                                   <input type="text" name="Patsn" class="form-control" id="Patsn" placeholder="授权号"
                                          onfocus="showTips('Patsn','专利授权号为1-20位的数字')"
                                          onblur="checkPatsn('Patsn','请按要求输入专利授权号')" value="<%=patent.getPatsn()%>">
                                   <div id="Patsndiv" style="display:none">
                                       <span id="Patsnspan"></span><br>
                                   </div>
                               </div>
                               <div class="form-group">
                                   <label for="inventor">发明人</label>
                                   <input type="text" name="inventor" value="" class="form-control" id="inventor"
                                          placeholder="发明人" value="<%=patent.getInventor()%>">
                               </div>
                               <div class="form-group">
                                   <label for="tname">专利权人</label>
                                   <input type="text" name="tname" value="<%=patent.getTname()%>" class="form-control" id="tname"
                                          placeholder="专利权人" readonly>
                               </div>
                               <div class="form-group">
                                   <label for="Patapdate">申请时间</label>
                                   <input type="date" name="Patapdate" class="form-control" id="Patapdate"
                                          placeholder="申请时间" value="<%=patent.getPatapdate()%>">
                               </div>
                               <div class="form-group">
                                   <label for="Patendate">授权时间</label>
                                   <input type="date" name="Patendate" class="form-control" id="Patendate"
                                          placeholder="授权时间" value="<%=patent.getPatendate()%>">
                               </div>
                               <div class="form-group">
                                   <label for="Patgrad">类型</label>
                                   <select name="Patgrad" class="form-control" id="Patgrad" value="<%=patent.getPatgrad()%>">
                                       <option value="发明专利">发明专利</option>
                                       <option value="实用新型专利">实用新型专利</option>
                                       <option value="外观设计专利">外观设计专利</option>
                                       <option value="软件著作权">软件著作权</option>
                                       <option value="植物新品种">植物新品种</option>
                                   </select>
                               </div>
                               <div class="form-group">
                                   <label for="Patremarks">备注</label>
                                   <input type="text" name="Patremarks" class="form-control" id="Patremarks"
                                          placeholder="备注" value="<%=patent.getPatremarks()%>">
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