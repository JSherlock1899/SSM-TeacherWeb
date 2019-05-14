package com.slxy.edu.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.slxy.edu.controller.base.BaseController;
import com.slxy.edu.model.Condition;
import com.slxy.edu.model.Project;
import com.slxy.edu.model.excel.ExcelProject;
import com.slxy.edu.service.IProjectService;
import com.slxy.edu.util.CommonUtils;
import com.slxy.edu.util.ExportExcel;
import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static com.slxy.edu.util.CommonUtils.*;
import static com.slxy.edu.util.ExcelUtils.excels;
import static com.slxy.edu.util.ExcelUtils.exportExcelUtil;

/**
 * @program: TeacherWeb
 * @description:项目模块
 * @author: Mr.Jiang
 * @create: 2019-04-21 16:22
 **/

@Controller
@RequestMapping("project")
public class ProjectController extends BaseController<Project> {

    @Autowired
    IProjectService projectService;


    /**
     * 查询当前条件下的项目信息
     */
    @RequestMapping(PROJECT)
    public ModelAndView findproject(@RequestParam(required = false,defaultValue = "1",value = "pn")Integer pn,
                                  Map<String,Object> map, String cname, String dname, String starttime, String endtime, String tname){
        //引入分页查询，使用PageHelper分页功能
        //在查询之前传入当前页，然后多少记录
        PageHelper.startPage(pn,5);
        //当前条件下的查询结果
        List<Project> projects = projectService.selectAll(cname.trim(),dname,starttime,endtime,tname);
        //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以
        PageInfo pageInfo = new PageInfo<>(projects,5);
        //pageINfo封装了分页的详细信息，也可以指定连续显示的页数
        map.put("pageInfo",pageInfo);
        ModelAndView mv = new ModelAndView();
        Condition condition = new Condition(cname,dname,starttime,endtime,tname);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("projects",projects);
        mv.addObject("condition",condition);
        mv.setViewName(PROJECT_PAGE);
        return mv;
    }


    /**
     * 导出当前条件下的项目信息
     */
    @RequestMapping("export.do")
    public void exportProject(HttpServletResponse response,String cname, String dname, String starttime, String endtime, String tname){
        ExportExcel<ExcelProject> ex = new ExportExcel<ExcelProject>();
        CommonUtils util = new CommonUtils();
        List<ExcelProject> datalist = projectService.selectExcel(cname.trim(),dname,starttime,endtime,tname);
        String[] headers = { "项目编号", "项目名称", "教师工号","负责人","项目成员","科研状态","级别", "类型","经费", "立项时间", "结题时间","合同类型","所属学院","所属专业","学历","职称","备注" };
        OutputStream out = null;
        exportExcelUtil(response, ex, util, datalist, headers,"项目");
    }

    /**
     * 查询未审核的项目信息
     */
    @RequestMapping("audit.do")
    public ModelAndView findAudit(@RequestParam(required = false,defaultValue = "1",value = "pn")Integer pn,
                                  Map<String,Object> map,String cname, String dname, String starttime, String endtime, String tname){
        //引入分页查询，使用PageHelper分页功能
        //在查询之前传入当前页，然后多少记录
        PageHelper.startPage(pn,5);
        //当前条件下的查询结果
        List<Project> projects = projectService.selectAllUnaudit(cname.trim(),dname,starttime,endtime,tname);
        //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以
        PageInfo pageInfo = new PageInfo<>(projects,5);
        //pageINfo封装了分页的详细信息，也可以指定连续显示的页数
        map.put("pageInfo",pageInfo);
        ModelAndView mv = new ModelAndView();
        mv.addAllObjects(map);
        mv.addObject("projects",projects);
        Condition condition = new Condition(cname,dname,starttime,endtime,tname);
        mv.addObject("condition",condition);
        mv.setViewName("admin/project/auditProject");
        return mv;
    }

    /**
     * 跳转到详细信息审核页面
     */
    @RequestMapping("goDetail")
    public ModelAndView goDetail(String psn){
        Project project = projectService.selectByMajorKey(psn);
        ModelAndView mv = new ModelAndView();
        mv.addObject("project",project);
        mv.setViewName("admin/project/detailList");
        return mv;
    }

    /**
     * 修改信息，重新提交待审核的项目信息
     */
    @RequestMapping("updateOne.do")
    @ResponseBody
    public void updateOne(String Psn, String Pname, String Pmember, String Pgrad, String Pkind, String contractType, String Pmoney, String Pstatime, String Pcondition, String Pendtime, String Premarks) {
        String Paudit = "0";
        Integer pmoney = Integer.parseInt(Pmoney);
        Project project = new Project(Psn,Pname,Pmember,Pgrad,Pkind,pmoney,Pstatime,Pcondition,Pendtime,Premarks,contractType,Paudit);
        projectService.updateOne(project);
    }

    /**
     * 新建一条项目信息
     */
    @RequestMapping(value = "insertOne", method = RequestMethod.POST)
    @ResponseBody
    public void insertOne(HttpServletRequest request, String Psn, String Pleader, String Pname, String Pmember, String Pgrad, String Pkind, String contractType, String Pmoney, String Pstatime, String Pcondition, String Pendtime, String Premarks){
        String Paudit = "0";
        Integer pmoney = Integer.parseInt(Pmoney);
        String Tsn = (String) request.getSession().getAttribute("username");
        Project project = new Project(Psn,Pleader,Pname,Pmember,Pgrad,Pkind,contractType,pmoney,Pstatime,Pcondition,Pendtime,Premarks,Tsn,Paudit);
        projectService.insertOne(project);

    }

    /**
     * 审核通过
     */

    @RequestMapping("pass.do")
    @ResponseBody
    public void pass(String majorkey,String message){
        projectService.pass(majorkey,message);
    }

    /**
     * 审核不通过
     */

    @RequestMapping("nopass.do")
    @ResponseBody
    public void nopass(String majorkey,String message){
        projectService.nopass(majorkey,message);
    }


    /**
     * 统计图
     * @param request
     * @param starttime 开始时间
     * @param endtime 结束时间
     * @param cname 学院名
     * @return
     */
    @RequestMapping("Statistics.do")
    public ModelAndView PatentStatistics(HttpServletRequest request,@RequestParam(required = false,defaultValue = "null")String starttime, @RequestParam(required = false,defaultValue = "null")String endtime,@RequestParam(required = false,defaultValue = "null")String cname){
        //柱状图和饼图数据源
        List<Map<String, Integer>> map = new ArrayList<Map<String, Integer>>();
        List<Map<String, Integer>> moneyMap = new ArrayList<Map<String, Integer>>();
        //折线图数据源
        List<Map<String, Integer>> mapList = new ArrayList<Map<String, Integer>>();
        List<List<Map<String, Integer>>> lists = new ArrayList<List<Map<String, Integer>>>();
        String grade = (String) request.getSession().getAttribute("grade");
        if(grade.equals("1")){
            if (cname == null || cname.equals("null")){
                map = projectService.getCollegeCount(starttime,endtime);
                moneyMap = projectService.getProjectMoney(starttime,endtime);
                //折线图数据
                for (int i=0;i<yearsArr.length-1;i++){
                    starttime = yearsArr[i];
                    endtime = yearsArr[i+1];
                    mapList = projectService.getRecentYearsCount(starttime,endtime);
                    lists.add(mapList);
                }
            }else {
//                校管理员查询二级学院下各专业的数据
                map = projectService.getSdeptCount(starttime,endtime,cname);
                moneyMap = projectService.getSdeptProjectMoney(starttime,endtime,cname);
                getCount(cname, lists);
            }

        }else if (grade.equals("2")){
            cname = (String) request.getSession().getAttribute("cname");
            map = projectService.getSdeptCount(starttime,endtime,cname);
            moneyMap = projectService.getSdeptProjectMoney(starttime,endtime,cname);
            System.out.println(moneyMap.size());
            System.out.println(moneyMap.get(0));
            getCount(cname, lists);
        }
        //将map转化为json，以传给前端
        JSONArray json = JSONArray.parseArray(JSON.toJSONString(map));
        JSONArray jsonList = JSONArray.parseArray(JSON.toJSONString(lists));
        JSONArray jsonMoney = JSONArray.parseArray(JSON.toJSONString(moneyMap));
        ModelAndView mv = new ModelAndView();
        mv.addObject("json",json);
        mv.addObject("jsonList",jsonList);
        mv.addObject("jsonMoney",jsonMoney);
        mv.addObject("cname",cname);
        mv.setViewName("/admin/project/Statistics");
        return mv;
    }

    private void getCount(@RequestParam(required = false, defaultValue = "null") String cname, List<List<Map<String, Integer>>> lists) {
        String starttime;
        String endtime;
        List<Map<String, Integer>> mapList;
        for (int i = 0; i<yearsArr.length-1; i++){
            starttime = yearsArr[i];
            endtime = yearsArr[i+1];
            mapList = projectService.getRecentYearsSdeptCount(starttime,endtime,cname);
            lists.add(mapList);
        }
    }

    @RequestMapping("importExcel")
    public void importExcel(HttpServletRequest request,HttpServletResponse response) throws IOException, FileUploadException, ParseException {
        List list = excels(response,request);
        PrintWriter out = response.getWriter();
        //记录当前行数
        int count = 0;
        List<ExcelProject> excels = new ArrayList<ExcelProject>();
        //12为每条记录的字段数
        for (int i=0;i<list.size();i=i+12) {
            count++;
            System.out.println(list.get(i+8));
            System.out.println(list.get(i+9));
            System.out.println(list.get(i+7));
            boolean vaild1 = judgeDate(list.get(i+8).toString());
            boolean vaild2 = judgeDate(list.get(i+9).toString());
            boolean isNumeric = isNumeric(list.get(i+7).toString());
            if (vaild1 == false || vaild2 == false || isNumeric == false) {
                count = count + 2;
                out.print("<script>alert('第" + count + "行可能存在错误，请检查后重新导入！')</script>");
                return;
            }else {
                //分别为立项时间和结题时间
                String date1;
                String date2;
                int money;
                if (!list.get(i+8).toString().equals("")){
                    date1 = formatDate(list.get(i+8).toString());
                }else {
                    date1 = list.get(i+8).toString();
                }
                if (!list.get(i+9).toString().equals("")){
                    date2 = formatDate(list.get(i+9).toString());
                }else {
                    date2 = list.get(i+9).toString();
                }
                if (!list.get(i+7).toString().equals("")){
                    money = Integer.parseInt(list.get(i+7).toString());
                }else {
                    money = 0;
                }
                try {
                    ExcelProject excel = new ExcelProject(list.get(i).toString(),list.get(i+1).toString(),list.get(i+2).toString(),list.get(i+3).toString(),list.get(i+4).toString(),list.get(i+5).toString(),list.get(i+6).toString(),money,date1,date2,list.get(i+10).toString(),list.get(i+11).toString());
                    excel.toString();
                    //逐个添加各条数据
                    excels.add(excel);
                }catch (Exception e){
                    out.print("<script>alert('请检查导入数据是否正确！')</script>");
                }
            }
        }
        try {
            int result = projectService.importExcel(excels);
            if (result == count){
                out.print("<script>alert('导入成功！')</script>");
            }
        }catch (DuplicateKeyException e){
            out.print("<script>alert('导入失败，请检查检索号是否输入正确！')</script>");
        }
    }

    /**
     * 按主键删除对应数据
     */
    @RequestMapping("delete.do")
    @ResponseBody
    public void delete(String majorkey){
        projectService.deleteByMajorkey(majorkey);
    }

    /**
     * 按主键修改对应数据
     */
    @RequestMapping("alter.do")
    @ResponseBody
    public void alter(String Psn, String Pname, String Pmember, String Pgrad, String Pkind, String contractType, String Pmoney, String Pstatime, String Pcondition, String Pendtime, String Premarks) {
        String Paudit = "1";
        Integer pmoney = Integer.parseInt(Pmoney);
        Project project = new Project(Psn,Pname,Pmember,Pgrad,Pkind,pmoney,Pstatime,Pcondition,Pendtime,Premarks,contractType,Paudit);
        projectService.updateOne(project);
    }
}
