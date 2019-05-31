package com.slxy.edu.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.slxy.edu.controller.base.BaseController;
import com.slxy.edu.model.Condition;
import com.slxy.edu.model.Patent;
import com.slxy.edu.model.excel.ExcelPatent;
import com.slxy.edu.service.IPatentService;
import com.slxy.edu.util.CommonUtils;
import com.slxy.edu.util.ExportExcel;
import com.slxy.edu.util.Operation;
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
 * @description:专利模块
 * @author: Mr.Jiang
 * @create: 2019-04-19 22:14
 **/

@Operation(name = "专利操作")
@Controller
@RequestMapping("patent")
public class PatentController extends BaseController<Patent> {

    @Autowired
    IPatentService patentService;


    /**
     * 查询当前条件下的专利信息
     */
    @Operation(name="查询所有专利")
    @RequestMapping(PATENT)
    public ModelAndView findPatent(@RequestParam(required = false, defaultValue = "1", value = "pn") Integer pn,
                                   Map<String, Object> map, String cname, String dname, String starttime, String endtime, String tname) {
        //引入分页查询，使用PageHelper分页功能
        //在查询之前传入当前页，然后多少记录
        PageHelper.startPage(pn, 5);
        //当前条件下的查询结果
        List<Patent> patents = patentService.selectAll(cname.trim(), dname, starttime, endtime, tname);
        //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以
        PageInfo pageInfo = new PageInfo<>(patents, 5);
        //pageINfo封装了分页的详细信息，也可以指定连续显示的页数
        map.put("pageInfo", pageInfo);
        ModelAndView mv = new ModelAndView();
        mv.addAllObjects(map);
        mv.addObject("patents", patents);
        Condition condition = new Condition(cname, dname, starttime, endtime, tname);
        mv.addObject("condition", condition);
        mv.setViewName(PATENT_PAGE);
        return mv;
    }


    /**
     * 导出当前条件下的专利信息
     */
    @Operation(name="导出当前条件下的专利信息")
    @RequestMapping("export.do")
    public void exportPatent(HttpServletResponse response, String cname, String dname, String starttime, String endtime, String tname) {
        ExportExcel<ExcelPatent> ex = new ExportExcel<ExcelPatent>();
        CommonUtils util = new CommonUtils();
        List<ExcelPatent> datalist = patentService.selectExcel(cname.trim(), dname, starttime, endtime, tname);
        String[] headers = {"名称", "授权号", "申请时间", "授权时间", "类型", "发明人","教师工号", "专利权人", "所属学院", "所属专业", "学历", "职称", "备注"};
        exportExcelUtil(response, ex, util, datalist, headers, "专利");
    }


    /**
     * 查询未审核的专利信息
     */
    @Operation(name="查询未审核的专利信息")
    @RequestMapping("audit.do")
    public ModelAndView findAudit(@RequestParam(required = false, defaultValue = "1", value = "pn") Integer pn,
                                  Map<String, Object> map, String cname, String dname, String starttime, String endtime, String tname) {
        //引入分页查询，使用PageHelper分页功能
        //在查询之前传入当前页，然后多少记录
        PageHelper.startPage(pn, 5);
        //当前条件下的查询结果
        List<Patent> patents = patentService.selectAllUnaudit(cname.trim(), dname, starttime, endtime, tname);
        //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以
        PageInfo pageInfo = new PageInfo<>(patents, 5);
        //pageINfo封装了分页的详细信息，也可以指定连续显示的页数
        map.put("pageInfo", pageInfo);
        ModelAndView mv = new ModelAndView();
        mv.addAllObjects(map);
        mv.addObject("patents", patents);
        Condition condition = new Condition(cname, dname, starttime, endtime, tname);
        mv.addObject("condition", condition);
        mv.setViewName("admin/patent/auditPatent");
        return mv;
    }

    /**
     * 跳转到详细信息审核页面
     */
    @Operation(name="跳转到详细信息审核页面")
    @RequestMapping("goDetail")
    public ModelAndView goDetail(String patsn) {
        Patent patent = patentService.selectByMajorKey(patsn);
        //获取审核情况
        String audit = patent.getPaudit();
        //处理审核字段
        String auditString = disposeAuditValue(audit);
        String message = patent.getMessage();
        String messageString = disposeMessageValue(message);
        //覆盖原审核情况和审核意见
        patent.setMessage(messageString);
        patent.setPaudit(auditString);
        ModelAndView mv = new ModelAndView();
        mv.addObject("patent", patent);
        mv.setViewName("admin/patent/detailList");
        return mv;
    }

    /**
     * 修改信息，重新提交待审核的专利信息
     */
    @Operation(name="修改信息，重新提交待审核的专利信息")
    @RequestMapping("updateOne.do")
    @ResponseBody
    public void updateOne(HttpServletRequest request, String Patname, String inventor, String Patsn, String Patapdate, String Patendate, String Patgrad, String Patremarks) {
        String Paudit = "0";
        String Tsn = (String) request.getSession().getAttribute("username");
        Patent patent = new Patent(Patname, Patsn, Patapdate, Patendate, Patgrad, Patremarks, inventor, Tsn, Paudit);
        int result = patentService.updateOne(patent);
    }

    /**
     * 新建一条的专利信息
     */
    @Operation(name="新建一条的专利信息")
    @RequestMapping(value = "insertOne", method = RequestMethod.POST,produces="application/json")
    @ResponseBody
    public void insertOne(HttpServletRequest request,String Patname, String inventor, String Patsn, String Patapdate, String Patendate, String Patgrad, String Patremarks) {
        String Paudit = "0";
        String Tsn = (String) request.getSession().getAttribute("username");
        Patent patent = new Patent(Patname, Patsn, Patapdate, Patendate, Patgrad, Patremarks, inventor, Tsn, Paudit);
        int result = patentService.insertOne(patent);
//        if(result == 1){
//            return JsonMsg.success();
//        }else {
//            return JsonMsg.fail().addInfo("update_error","新建数据出错，请检查授权号是否输入正确！");
//        }
    }

    /**
     * 审核通过
     */
    @Operation(name="审核通过了一条信息")
    @RequestMapping("pass.do")
    @ResponseBody
    public void pass(String majorkey, String message) {
        patentService.pass(majorkey, message);
    }

    /**
     * 审核不通过
     */
    @Operation(name="审核不通过了一条信息")
    @RequestMapping("nopass.do")
    @ResponseBody
    public void nopass(String majorkey, String message) {
        patentService.nopass(majorkey, message);
    }

    /**
     * 统计图
     *
     * @param request
     * @param starttime 开始时间
     * @param endtime   结束时间
     * @param cname     学院名
     * @return
     */
    @Operation(name="查看统计图")
    @RequestMapping("Statistics.do")
    public ModelAndView PatentStatistics(HttpServletRequest request, @RequestParam(required = false, defaultValue = "null") String starttime, @RequestParam(required = false, defaultValue = "null") String endtime, @RequestParam(required = false, defaultValue = "null") String cname) {
        //柱状图和饼图数据源
        List<Map<String, Integer>> map = new ArrayList<Map<String, Integer>>();
        //折线图数据源
        List<Map<String, Integer>> mapList = new ArrayList<Map<String, Integer>>();
        List<List<Map<String, Integer>>> lists = new ArrayList<List<Map<String, Integer>>>();
        String grade = (String) request.getSession().getAttribute("grade");
        if (grade.equals("1")) {
            if (cname == null || cname.equals("null")) {
                map = patentService.getCollegeCount(starttime, endtime);
                for (int i = 0; i < yearsArr.length - 1; i++) {
                    starttime = yearsArr[i];
                    endtime = yearsArr[i + 1];
                    mapList = patentService.getRecentYearsCount(starttime, endtime);
                    lists.add(mapList);
                }
            } else {
                map = patentService.getSdeptCount(starttime, endtime, cname);
                getCount(cname, lists);
            }

        } else if (grade.equals("2")) {
            cname = (String) request.getSession().getAttribute("cname");
            map = patentService.getSdeptCount(starttime, endtime, cname);
            getCount(cname, lists);
        }
        //将map转化为json，以传给前端
        JSONArray json = JSONArray.parseArray(JSON.toJSONString(map));
        JSONArray jsonList = JSONArray.parseArray(JSON.toJSONString(lists));
        ModelAndView mv = new ModelAndView();
        mv.addObject("json", json);
        mv.addObject("jsonList", jsonList);
        mv.addObject("cname", cname);
        mv.setViewName("admin/patent/Statistics");
        return mv;
    }

    private void getCount(@RequestParam(required = false, defaultValue = "null") String cname, List<List<Map<String, Integer>>> lists) {
        String starttime;
        String endtime;
        List<Map<String, Integer>> mapList;
        for (int i = 0; i < yearsArr.length - 1; i++) {
            starttime = yearsArr[i];
            endtime = yearsArr[i + 1];
            mapList = patentService.getRecentYearsSdeptCount(starttime, endtime, cname);
            lists.add(mapList);
        }
    }


    /**
     * 导入excel
     * @param request
     * @param response
     * @throws IOException
     * @throws FileUploadException
     * @throws ParseException
     */
    @Operation(name="导入excel")
    @RequestMapping("importExcel.do")
    public void importExcel(HttpServletRequest request,HttpServletResponse response) throws IOException, FileUploadException, ParseException {
        List list = excels(response,request);
        PrintWriter out = response.getWriter();
        //记录当前行数
        int count = 0;
        List<ExcelPatent> excels = new ArrayList<ExcelPatent>();
        //8为每条记录的字段数
        for (int i=0;i<list.size();i=i+8) {
            count++;
            boolean vaild1 = judgeDate(list.get(i+4).toString());
            boolean vaild2 = judgeDate(list.get(i+5).toString());
            if (vaild1 == false || vaild2 == false) {
                count = count + 2;
                out.print("<script>alert('第" + count + "行可能存在错误，请检查后重新导入！')</script>");
                return;
            }else {
                //分别为立项时间和结题时间
                String date1;
                String date2;
                if (!list.get(i+4).toString().equals("")){
                    date1 = formatDate(list.get(i+4).toString());
                }else {
                    date1 = list.get(i+4).toString();
                }
                if (!list.get(i+5).toString().equals("")){
                    date2 = formatDate(list.get(i+5).toString());
                }else {
                    date2 = list.get(i+5).toString();
                }
                try {
                    ExcelPatent excel = new ExcelPatent(list.get(i).toString(),list.get(i+1).toString(),list.get(i+2).toString(),list.get(i+3).toString(),date1,date2,list.get(i+6).toString(),list.get(i+7).toString(),"1");
                    excel.toString();
                    //逐个添加各条数据
                    excels.add(excel);
                }catch (Exception e){
                    out.print("<script>alert('请检查导入数据是否正确！')</script>");
                }
            }
        }
        try {
            int result = patentService.importExcel(excels);
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
    @Operation(name="删除了一条数据")
    @RequestMapping("delete.do")
    @ResponseBody
    public void delete(String majorkey){
        patentService.deleteByMajorkey(majorkey);
    }

    /**
     * 按主键修改对应数据
     */
    @Operation(name="修改了一条数据")
    @RequestMapping("alter.do")
    @ResponseBody
    public void alter(String Patname, String inventor, String Patsn, String Patapdate, String Patendate, String Patgrad) {
        String Paudit = "1";
        Patent patent = new Patent(Patname, Patsn, Patapdate, Patendate, Patgrad, inventor, Paudit);
        patentService.alterByMajorkey(patent);
    }
}


