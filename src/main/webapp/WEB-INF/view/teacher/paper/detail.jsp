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
                    <td>检索号</td>
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
                    <td colspan="2"><a href="/file/download.do?model=paper&majorkey=<%=paper.getPasearchnum()%>&name=<%=paper.getPaname()%>"  class="btn btn-primary Download">下载附件</a></td>
                    <input type="hidden" class="accessoryPath" value="<%=paper.getPaccessory() %>"/>
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
            <button class="btn btn-primary form-group" style="width:100%;margin-bottom:10px" id="btn_update">重新编辑</button>
            <!--新建信息的模态框 -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" >
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">新建论文信息</h4>
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="Pasearchnum">检索号</label>
                                <input type="text" name="Pasearchnum" value="<%=paper.getPasearchnum() %>"
                                       class="form-control" id="Pasearchnum" placeholder="检索号"
                                       onfocus="showTips('Pasearchnum','查询编号为1-10位的数字')"
                                       onblur="checkPasearchnum('Pasearchnum','请按要求输入查询编号')">
                                <div id="Pasearchnumdiv" style="display:none">
                                    <span id="Pasearchnumspan" ></span><br>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Paname">论文名</label>
                                <input type="text" name="Paname" value="<%=paper.getPaname() %>"
                                       class="form-control" id="Paname" placeholder="论文名"
                                       onfocus="showTips('Paname','论文名称不能超过15个字符')"
                                       onblur="checkPaname('Paname','请按要求输入论文名称')">
                                <div id="Panamediv" style="display:none">
                                    <span id="Panamespan" ></span><br>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Pawriter">第一作者</label> <input type="text"  value="<%=paper.getPawriter() %>"
                                                                          name="Pawriter" class="form-control" id="Pawriter"
                                                                          placeholder="第一作者">
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
                                <option value="T类">T类</option>
                                <option value="A类">A类</option>
                                <option value=B类>B类</option>
                                <option value="C类">C类</option>
                                <option value="D类">D类</option>
                                <option value="E类">E类</option>
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
                                <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存
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
</body>
</html>