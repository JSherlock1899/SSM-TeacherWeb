<%@ page import="com.slxy.edu.model.Paper" %>
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
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxPaperData.js"></script>
</head>
<body>
<%
    Paper paper = (Paper) request.getAttribute("paper");
    String grade = (String) request.getSession().getAttribute("grade");
%>
<div class="table-main col-md-12" >
    <div class="col-md-4" >
        <ol class="breadcrumb" style="margin-left:5em;margin-top:2em">
            <li><a href="#">主页</a></li>
            <li><a href="#">查询</a></li>
            <li><a href="#">论文查询</a></li>
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
                    <td class="Paname text-center" colspan="5"><%=paper.getPaname()%></td>
                </tr>
                <tr>
                    <td>编号</td>
                    <td class="Pasearchnum"><%=paper.getPasearchnum()%></td>
                    <td>第一作者</td>
                    <td class="Tname"><%=paper.getTname()%></td>
                    <td>通讯作者</td>
                    <td class="Pawriter"><%=paper.getPawriter()%></td>
                </tr>
                <tr>
                    <td>发表期刊</td>
                    <td class="Papublish" colspan="2"><%=paper.getPapublish()%></td>
                    <td colspan="1">期/卷/页</td>
                    <td class="Pdisvol" colspan="2"><%=paper.getPdisvol()%></td>
                </tr>
                <tr>
                    <td>发表时间</td>
                    <td class="Padate" colspan="2"><%=paper.getPadate()%></td>
                    <td colspan="1">级别</td>
                    <td colspan="2" class="Pagrad"><%=paper.getPagrad()%></td>
                </tr>
                <tr>
                    <td>附件</td>
                    <td colspan="2"><a href="<%=request.getContextPath()%>/file/download.do?model=paper&majorkey=<%=paper.getPasearchnum()%>&name=<%=paper.getPaname()%>"  class="btn btn-primary Download">下载附件</a></td>
                    <input type="hidden" id="accessoryPath" value="<%=paper.getPaccessory() %>"/>
                    <td colspan="1">审核情况</td>
                    <td colspan="2"><%=paper.getPaudit()%></td>
                </tr>
                <tr>
                    <td>备注</td>
                    <td class="Patremarks" colspan="5"><%=paper.getParemarks()%></td>
                </tr>
                <tr>
                    <td>审核意见</td>
                    <td colspan="5"><%=paper.getMessage()%></td>
                </tr>
            </table>
            <div id="teacher">
                <button class="btn btn-primary form-group" style="width:100%;margin-bottom:10px" id="btn_update">重新编辑</button>
                <!--新建信息的模态框 -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" >
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">重新编辑论文信息</h4>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="Pasearchnum">编号</label>
                                    <input type="text" name="Pasearchnum" value="<%=paper.getPasearchnum() %>"
                                           class="form-control" id="Pasearchnum" placeholder="编号" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="Paname">论文名</label>
                                    <input type="text" name="Paname" value="<%=paper.getPaname() %>"
                                           class="form-control" id="Paname" placeholder="论文名"
                                           onfocus="showTips('Paname','论文名称不能超过50个字符')"
                                           onblur="checkPaname('Paname','请按要求输入论文名称')">
                                    <div id="Panamediv" style="display:none">
                                        <span id="Panamespan" ></span><br>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="tname">第一作者</label> <input type="text"  value="<%=paper.getTname()%>"
                                                                           name="tname" class="form-control" id="tname"
                                                                           placeholder="第一作者" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="Pawriter">通讯作者</label> <input type="text"  value="<%=paper.getTname()%>"
                                                                           name="Pawriter" class="form-control" id="Pawriter"
                                                                           placeholder="通讯作者" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="Papublish">发表期刊</label> <input type="text"  value="<%=paper.getPapublish() %>"
                                                                               name="Papublish" class="form-control" id="Papublish"
                                                                               placeholder="发表期刊">
                                </div>
                                <div class="form-group">
                                    <label for="Pdisvol">期/卷/页</label> <input type="text" name="Pdisvol" value="<%=paper.getPdisvol() %>"
                                                                              class="form-control" id="Pdisvol" placeholder="期/卷/页">
                                </div>
                                <div class="form-group">
                                    <label for="Padate">发表时间</label> <input type="date" name="Padate"  value="<%=paper.getPadate() %>"
                                                                            class="form-control" id="Padate" placeholder="发表时间">
                                </div>
                                <div class="form-group">
                                    <label for="Pagrad">级别</label><select name="Pagrad"  value="<%=paper.getPagrad() %>"
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
                                    <label for="Paremarks">备注</label> <input type="text" value="<%=paper.getParemarks() %>"
                                                                             name="Paremarks" class="form-control" id="Paremarks"
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