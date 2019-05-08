package com.slxy.edu.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.slxy.edu.controller.base.BaseController;
import com.slxy.edu.model.Condition;
import com.slxy.edu.model.Honor;
import com.slxy.edu.model.excel.ExcelHonor;
import com.slxy.edu.service.IHonorService;
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

import static com.slxy.edu.util.CommonUtils.formatDate;
import static com.slxy.edu.util.CommonUtils.judgeDate;
import static com.slxy.edu.util.ExcelUtils.excels;
import static com.slxy.edu.util.ExcelUtils.exportExcelUtil;

/**
 * @program: TeacherWeb
 * @description: 荣誉模块
 * @author: Mr.Jiang
 * @create: 2019-04-21 16:26
 **/

@Controller
@RequestMapping("honor")
public class HonorController extends BaseController<Honor> {

    @Autowired
    IHonorService honorService;


    /**
     * 查询当前条件下的荣誉信息
     */
    @RequestMapping(HONOR)
    public ModelAndView findhonor(@RequestParam(required = false,defaultValue = "1",value = "pn")Integer pn,
                                   Map<String,Object> map, String cname, String dname, String starttime, String endtime, String tname){
        //引入分页查询，使用PageHelper分页功能
        //在查询之前传入当前页，然后多少记录
        PageHelper.startPage(pn,5);
        //当前条件下的查询结果
        List<Honor> honors = honorService.selectAll(cname.trim(),dname,starttime,endtime,tname);
        //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以
        PageInfo pageInfo = new PageInfo<>(honors,5);
        //pageINfo封装了分页的详细信息，也可以指定连续显示的页数
        map.put("pageInfo",pageInfo);
        ModelAndView mv = new ModelAndView();
        mv.addAllObjects(map);
        mv.addObject("honors",honors);
        Condition condition = new Condition(cname,dname,starttime,endtime,tname);
        mv.addObject("condition",condition);
        mv.setViewName(HONOR_PAGE);
        return mv;
    }

    /**
     * 查询未审核的荣誉信息
     */
    @RequestMapping("audit.do")
    public ModelAndView findAudit(@RequestParam(required = false,defaultValue = "1",value = "pn")Integer pn,
                                  Map<String,Object> map,String cname, String dname, String starttime, String endtime, String tname){
        //引入分页查询，使用PageHelper分页功能
        //在查询之前传入当前页，然后多少记录
        PageHelper.startPage(pn,5);
        //当前条件下的查询结果
        List<Honor> honors = honorService.selectAllUnaudit(cname.trim(),dname,starttime,endtime,tname);
        //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以
        PageInfo pageInfo = new PageInfo<>(honors,5);
        //pageINfo封装了分页的详细信息，也可以指定连续显示的页数
        map.put("pageInfo",pageInfo);
        ModelAndView mv = new ModelAndView();
        mv.addAllObjects(map);
        mv.addObject("honors",honors);
        Condition condition = new Condition(cname,dname,starttime,endtime,tname);
        mv.addObject("condition",condition);
        mv.setViewName("admin/honor/auditHonor");
        return mv;
    }

    /**
     * 跳转到详细信息审核页面
     */
    @RequestMapping("goDetail")
    public ModelAndView goHonorDetail(String hsn){
        Honor honor = honorService.selectByMajorKey(hsn);
        ModelAndView mv = new ModelAndView();
        mv.addObject("honor",honor);
        mv.setViewName("admin/honor/detailList");
        return mv;
    }

    /**
     * 修改信息，重新提交待审核的荣誉信息
     */
    @RequestMapping("updateOne.do")
    @ResponseBody
    public void updateOne(HttpServletRequest request, String Hsn, String Hname, String Hwinner, String Hdate, String Hcompany, String department, String Hgrad,  String Hremarks){
        String Haudit = "0";
        String Tsn = (String) request.getSession().getAttribute("username");
        Honor honor = new Honor(Hsn,Hname,Hwinner,Hdate,Hcompany,Hgrad,Hremarks,Tsn,Haudit,null,department);
        int result = honorService.updateOne(honor);
    }

    /**
     * 新建一条荣誉信息
     */
    @RequestMapping(value = "insertOne", method = RequestMethod.POST)
    @ResponseBody
    public void insertOne(HttpServletRequest request, String Hsn, String Hname, String Hwinner, String Hdate, String Hcompany, String department, String Hgrad,  String Hremarks){
        String Haudit = "0";
        String Tsn = (String) request.getSession().getAttribute("username");
        Honor honor = new Honor(Hsn,Hname,Hwinner,Hdate,Hcompany,Hgrad,Hremarks,Tsn,Haudit,null,department);
        int result = honorService.insertOne(honor);
    }


    /**
     * 导出当前条件下的荣誉信息
     */
    @RequestMapping("export.do")
    public void export(HttpServletResponse response, String cname, String dname, String starttime, String endtime, String tname){
        ExportExcel<ExcelHonor> ex = new ExportExcel<ExcelHonor>();
        CommonUtils util = new CommonUtils();
        List<ExcelHonor> datalist = honorService.selectExcel(cname.trim(),dname,starttime,endtime,tname);
        String[] headers =  { "编号", "名称", "教师工号","第一完成人","第一完成单位", "时间", "颁奖单位", "级别", "所属学院","所属专业","学历","职称","备注" };
        OutputStream out = null;
        exportExcelUtil(response, ex, util, datalist, headers,"成果");
    }

    /**
     * 审核通过
     */

    @RequestMapping("pass.do")
    @ResponseBody
    public void pass(String majorkey,String message){
        honorService.pass(majorkey,message);
    }

    /**
     * 审核不通过
     */

    @RequestMapping("nopass.do")
    @ResponseBody
    public void nopass(String majorkey,String message){
        honorService.nopass(majorkey,message);
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
        //折线图数据源
        List<Map<String, Integer>> mapList = new ArrayList<Map<String, Integer>>();
        List<List<Map<String, Integer>>> lists = new ArrayList<List<Map<String, Integer>>>();
        String grade = (String) request.getSession().getAttribute("grade");
        if(grade.equals("1")){
            if (cname == null || cname.equals("null")){
                map = honorService.getCollegeCount(starttime,endtime);
                for (int i=0;i<yearsArr.length-1;i++){
                    starttime = yearsArr[i];
                    endtime = yearsArr[i+1];
                    mapList = honorService.getRecentYearsCount(starttime,endtime);
                    lists.add(mapList);
                }
            }else {
                map = honorService.getSdeptCount(starttime,endtime,cname);
                getCount(cname, lists);
            }

        }else if (grade.equals("2")){
            cname = (String) request.getSession().getAttribute("cname");
            map = honorService.getSdeptCount(starttime,endtime,cname);
            getCount(cname, lists);
        }
        //将map转化为json，以传给前端
        JSONArray json = JSONArray.parseArray(JSON.toJSONString(map));
        JSONArray jsonList = JSONArray.parseArray(JSON.toJSONString(lists));
        ModelAndView mv = new ModelAndView();
        mv.addObject("json",json);
        mv.addObject("jsonList",jsonList);
        mv.addObject("cname",cname);
        mv.setViewName("/admin/honor/Statistics");
        return mv;
    }

    private void getCount(@RequestParam(required = false, defaultValue = "null") String cname, List<List<Map<String, Integer>>> lists) {
        String starttime;
        String endtime;
        List<Map<String, Integer>> mapList;
        for (int i = 0; i<yearsArr.length-1; i++){
            starttime = yearsArr[i];
            endtime = yearsArr[i+1];
            mapList = honorService.getRecentYearsSdeptCount(starttime,endtime,cname);
            lists.add(mapList);
        }
    }


    @RequestMapping("importExcel")
    public void importExcel(HttpServletRequest request,HttpServletResponse response) throws IOException, FileUploadException, ParseException {
        List list = excels(response,request);
        PrintWriter out = response.getWriter();
        //记录当前行数
        int count = 0;
        List<ExcelHonor> excels = new ArrayList<ExcelHonor>();
        //8为每条记录的字段数
        for (int i=0;i<list.size();i=i+8) {
            count++;
            boolean vaild = judgeDate(list.get(i+4).toString());
            if (vaild == false) {
                out.print("<script>alert('第" + count + "行可能存在错误，请检查后重新导入！！')</script>");
                return;
            }else {
                String date;
                if (!list.get(i+4).toString().equals("")){
                    date = formatDate(list.get(i+4).toString());
                }else {
                    date = list.get(i+4).toString();
                }
                ExcelHonor excel = new ExcelHonor(list.get(i).toString(),list.get(i+1).toString(),list.get(i+2).toString(),list.get(i+3).toString(),date,list.get(i+5).toString(),list.get(i+6).toString(),list.get(i+7).toString());
                //逐个添加各条数据
                excels.add(excel);
            }
        }
        try {
            int result = honorService.importExcel(excels);
            if (result == count){
                out.print("<script>alert('导入成功！')</script>");
            }
        }catch (DuplicateKeyException e){
            out.print("<script>alert('导入失败，请检查编号是否输入正确！')</script>");
        }
    }
}
