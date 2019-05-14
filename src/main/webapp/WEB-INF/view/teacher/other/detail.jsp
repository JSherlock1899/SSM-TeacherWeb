<%@ page import="com.slxy.edu.model.Other" %>
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
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxOtherData.js"></script>
</head>
<body>
<%
    Other others = (Other) request.getAttribute("others");
    String grade = (String) request.getSession().getAttribute("grade");
%>
<div class="table-main col-md-12" >
    <div class="col-md-4" >
        <ol class="breadcrumb" style="margin-left:5em;margin-top:2em">
            <li><a href="#">主页</a></li>
            <li><a href="#">查询</a></li>
            <li><a href="#">其他成果查询</a></li>
            <li class="active">详细信息</li>
        </ol>
    </div>
    <input type="hidden" value="<%=grade%>" id="grade">
    <div class="row">
        <div class="col-md-11 col-md-offset-1 ">
            <div class="col-md-10 button-div form-inline">
                <input type="hidden" name="count" value="4">
                <input type="file" id="file"style="display: none">
            </div>
            <table border="2" id="table" class="table table-striped table-bordered table-condensed">
                <tr class="info">
                    <td>名称</td>
                    <td class="other_name text-center" colspan="3"><%=others.getOther_name()%></td>
                </tr>
                <tr>
                    <td>发表人</td>
                    <td class="other_name"><%=others.getTname()%></td>
                    <td colspan="1">类型</td>
                    <td colspan="2" class="other_type"><%=others.getother_type()%></td>
                </tr>
                <tr>
                    <td>日期</td>
                    <td class="other_date"><%=others.getOther_date()%></td>
                    <td colspan="1">发表单位</td>
                    <td class="Publisher" colspan="2"><%=others.getPublisher()%></td>
                </tr>
                <tr>
                    <td>成果描述</td>
                    <td class="describe" colspan="3"><%=others.getother_describe()%></td>
                </tr>
                <tr>
                    <td>附件</td>
                    <td colspan="1"><a href="<%=request.getContextPath()%>/file/download.do?model=other&majorkey=<%=others.getOther_name()%>&name=<%=others.getOther_name()%>"  class="btn btn-primary Download">下载附件</a></td>
                    <input type="hidden" id="accessoryPath" value="<%=others.getAccessory() %>"/>
                    <td colspan="1">审核情况</td>
                    <td colspan="2"><%=others.getAudit()%></td>
                </tr>
                <tr>
                    <td>审核意见</td>
                    <td colspan="3"><%=others.getMessage()%></td>
                </tr>
            </table>
           <div id="teacher">
               <button class="btn btn-primary form-group" style="width:100%;margin-bottom:10px" id="btn_update">重新编辑</button>
               <!--新建信息的模态框 -->
               <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" >
                   <div class="modal-dialog" role="document">
                       <div class="modal-content">
                           <div class="modal-header">
                               <h4 class="modal-title" id="myModalLabel">新建其他成果信息</h4>
                               <button type="button" class="close" data-dismiss="modal"
                                       aria-label="Close">
                                   <span aria-hidden="true">×</span>
                               </button>
                           </div>
                           <div class="modal-body">
                               <div class="form-group">
                                   <label for="other_name">名称</label>
                                   <input type="text" name="other_name" value="<%=others.getOther_name() %>"
                                          class="form-control" id="other_name" placeholder="检索号"
                                          onfocus="showTips('other_name','查询编号为1-15位的字符')"
                                          onblur="checkother_name('other_name','请按要求输入查询的名称')">
                                   <div id="other_namediv" style="display:none">
                                       <span id="other_namespan" ></span><br>
                                   </div>
                               </div>
                               <div class="form-group">
                                   <label for="tname">发表人</label>
                                   <input type="text" name="tname" value="<%=others.getTname() %>"
                                          class="form-control" id="tname" placeholder="发表人" readonly>
                               </div>

                               <div class="form-group">
                                   <label for="other_date">发表时间</label> <input type="date" name="other_date"  value="<%=others.getOther_date() %>"
                                                                               class="form-control" id="other_date" placeholder="发表时间">
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
                                   <label for="other_describe">成果描述</label> <input type="text" value="<%=others.getother_describe() %>"
                                                                                   name="other_describe" class="form-control" id="other_describe"
                                                                                   placeholder="成果描述">
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