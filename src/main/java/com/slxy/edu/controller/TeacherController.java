package com.slxy.edu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.slxy.edu.model.*;
import com.slxy.edu.model.excel.*;
import com.slxy.edu.service.*;
import com.slxy.edu.util.CommonUtils;
import com.slxy.edu.util.ExportExcel;
import com.slxy.edu.util.Operation;
import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
 * @description: 教师相关操作控制类
 * @author: Mr.Jiang
 * @create: 2019-04-28 18:00
 **/
@Operation(name = "教师操作")
@Controller
@RequestMapping("teacher")
public class TeacherController{

    @Autowired
    ITeacherService teacherService;
    @Autowired
    IProjectService projectService;
    @Autowired
    IPaperService paperService;
    @Autowired
    IHonorService honorService;
    @Autowired
    IPatentService patentService;
    @Autowired
    IOtherService otherService;
    @Autowired
    public ICollegeService collegeService;

    /**
     * 查询教师个人的项目信息
     */
    @Operation(name = "查询教师个人的项目信息")
    @RequestMapping("findProject")
    public ModelAndView findProject(@RequestParam(required = false,defaultValue = "1",value = "pn")Integer pn,Map<String,Object> map, String tsn){
        PageHelper.startPage(pn,5);
        //当前条件下的查询结果
        List<Project> projects = teacherService.selectProject(tsn);
        //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以
        PageInfo pageInfo = new PageInfo<>(projects,5);
        //pageINfo封装了分页的详细信息，也可以指定连续显示的页数
        map.put("pageInfo",pageInfo);
        ModelAndView mv = new ModelAndView();
        mv.addAllObjects(map);
        mv.addObject("projects",projects);
        mv.setViewName("teacher/project/projectList");
        return mv;
    }

    /**
     * 查询教师个人的论文信息
     */
    @Operation(name = "查询教师个人的论文信息")
    @RequestMapping("findPaper")
    public ModelAndView findPaper(@RequestParam(required = false,defaultValue = "1",value = "pn")Integer pn,Map<String,Object> map, String tsn){
        PageHelper.startPage(pn,5);
        //当前条件下的查询结果
        List<Paper> papers = teacherService.selectPaper(tsn);
        //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以
        PageInfo pageInfo = new PageInfo<>(papers,5);
        //pageINfo封装了分页的详细信息，也可以指定连续显示的页数
        map.put("pageInfo",pageInfo);
        ModelAndView mv = new ModelAndView();
        mv.addAllObjects(map);
        mv.addObject("papers",papers);
        mv.setViewName("teacher/paper/paperList");
        return mv;
    }

    /**
     * 查询教师个人的荣誉信息
     */
    @Operation(name = "查询教师个人的荣誉信息")
    @RequestMapping("findHonor")
    public ModelAndView findHonor(@RequestParam(required = false,defaultValue = "1",value = "pn")Integer pn,Map<String,Object> map, String tsn){
        PageHelper.startPage(pn,5);
        //当前条件下的查询结果
        List<Honor> honors = teacherService.selectHonor(tsn);
        //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以
        PageInfo pageInfo = new PageInfo<>(honors,5);
        //pageINfo封装了分页的详细信息，也可以指定连续显示的页数
        map.put("pageInfo",pageInfo);
        ModelAndView mv = new ModelAndView();
        mv.addAllObjects(map);
        mv.addObject("honors",honors);
        mv.setViewName("teacher/honor/honorList");
        return mv;
    }

    /**
     * 查询教师个人的专利信息
     */
    @Operation(name = "查询教师个人的专利信息")
    @RequestMapping("findPatent")
    public ModelAndView findPatent(@RequestParam(required = false,defaultValue = "1",value = "pn")Integer pn,Map<String,Object> map, String tsn){
        PageHelper.startPage(pn,5);
        //当前条件下的查询结果
        List<Patent> patents = teacherService.selectPatent(tsn);
        //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以
        PageInfo pageInfo = new PageInfo<>(patents,5);
        //pageINfo封装了分页的详细信息，也可以指定连续显示的页数
        map.put("pageInfo",pageInfo);
        ModelAndView mv = new ModelAndView();
        mv.addAllObjects(map);
        mv.addObject("patents",patents);
        mv.setViewName("teacher/patent/patentList");
        return mv;
    }

    /**
     * 查询教师个人的其他成果信息
     */
    @Operation(name = "查询教师个人的其他成果信息")
    @RequestMapping("findOther")
    public ModelAndView findOther(@RequestParam(required = false,defaultValue = "1",value = "pn")Integer pn,Map<String,Object> map, String tsn){
        PageHelper.startPage(pn,5);
        //当前条件下的查询结果
        List<Other> others = teacherService.selectOther(tsn);
        //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以
        PageInfo pageInfo = new PageInfo<>(others,5);
        //pageINfo封装了分页的详细信息，也可以指定连续显示的页数
        map.put("pageInfo",pageInfo);
        ModelAndView mv = new ModelAndView();
        mv.addAllObjects(map);
        mv.addObject("others",others);
        mv.setViewName("teacher/other/otherList");
        return mv;
    }

    /**
     * 查询单个项目的详细信息
     */
    @Operation(name = "查询单个项目的详细信息")
    @RequestMapping("goProjectDetail")
    public ModelAndView goProjectDetail(String psn){
        Project project = projectService.selectByMajorKey(psn);
        String audit = project.getPaudit();
        //处理审核字段
        String auditString = disposeAuditValue(audit);
        String message = project.getMessage();
        String messageString = disposeMessageValue(message);
        //覆盖原审核情况和审核意见
        project.setMessage(messageString);
        project.setPaudit(auditString);
        ModelAndView mv = new ModelAndView();
        mv.addObject("project",project);
        mv.setViewName("teacher/project/detail");
        return mv;
    }


    /**
     * 查询单个论文的详细信息
     */
    @Operation(name = "查询单个论文的详细信息")
    @RequestMapping("goPaperDetail")
    public ModelAndView goPaperDetail(String pasearchnum){
        Paper paper = paperService.selectByMajorKey(pasearchnum);
        String audit = paper.getPaudit();
        //处理审核字段
        String auditString = disposeAuditValue(audit);
        String message = paper.getMessage();
        String messageString = disposeMessageValue(message);
        //覆盖原审核情况和审核意见
        paper.setMessage(messageString);
        paper.setPaudit(auditString);
        ModelAndView mv = new ModelAndView();
        mv.addObject("paper",paper);
        mv.setViewName("teacher/paper/detail");
        return mv;
    }

    /**
     * 查询单个荣誉的详细信息
     */
    @Operation(name = "查询单个荣誉的详细信息")
    @RequestMapping("goHonorDetail")
    public ModelAndView goHonorDetail(String hsn){
        Honor honor = honorService.selectByMajorKey(hsn);
        String audit = honor.getHaudit();
        //处理审核字段
        String auditString = disposeAuditValue(audit);
        String message = honor.getMessage();
        String messageString = disposeMessageValue(message);
        //覆盖原审核情况和审核意见
        honor.setMessage(messageString);
        honor.setHaudit(auditString);
        ModelAndView mv = new ModelAndView();
        mv.addObject("honor",honor);
        mv.setViewName("teacher/honor/detail");
        return mv;
    }

    /**
     * 查询单个专利的详细信息
     */
    @Operation(name = "查询单个专利的详细信息")
    @RequestMapping("goPatentDetail")
    public ModelAndView goPatentDetail(String patsn){
        System.out.println("patsn的值是：" + patsn + ".当前方法:TeacherController.goPatentDetail()");
        Patent patent = patentService.selectByMajorKey(patsn);
        String audit = patent.getPaudit();
        //处理审核字段
        String auditString = disposeAuditValue(audit);
        String message = patent.getMessage();
        String messageString = disposeMessageValue(message);
        //覆盖原审核情况和审核意见
        patent.setMessage(messageString);
        patent.setPaudit(auditString);
        ModelAndView mv = new ModelAndView();
        mv.addObject("patent",patent);
        mv.setViewName("teacher/patent/detail");
        return mv;
    }

    /**
     * 查询单个其他成果的详细信息
     */
    @Operation(name = "查询单个其他成果的详细信息")
    @RequestMapping("goOtherDetail")
    public ModelAndView goOtherDetail(String other_name){
        Other others = otherService.selectByMajorKey(other_name);
        String audit = others.getAudit();
        //处理审核字段
        String auditString = disposeAuditValue(audit);
        String message = others.getMessage();
        String messageString = disposeMessageValue(message);
        //覆盖原审核情况和审核意见
        others.setMessage(messageString);
        others.setAudit(auditString);
        ModelAndView mv = new ModelAndView();
        mv.addObject("others",others);
        mv.setViewName("teacher/other/detail");
        return mv;
    }


    /**
     * 导出教师个人的项目信息
     */
    @Operation(name = "导出教师个人的项目信息")
    @RequestMapping("exportProject.do")
    public void exportProject(HttpServletResponse response, String tsn){
        ExportExcel<ExcelProject> ex = new ExportExcel<ExcelProject>();
        CommonUtils util = new CommonUtils();
        List<ExcelProject> datalist =  teacherService.exportProject(tsn);
        String[] headers = { "项目编号", "项目名称", "教师工号","负责人","项目成员","科研状态","级别", "类型","经费", "立项时间", "结题时间","合同类型","所属学院","所属专业","学历","职称","备注" };
        OutputStream out = null;
        exportExcelUtil(response, ex, util, datalist, headers,"项目");
    }

    /**
     * 导出教师个人的成果信息
     */
    @Operation(name = "导出教师个人的成果信息")
    @RequestMapping("exportPaper.do")
    public void exportPaper(HttpServletResponse response, String tsn){
        ExportExcel<ExcelPaper> ex = new ExportExcel<ExcelPaper>();
        CommonUtils util = new CommonUtils();
        List<ExcelPaper> datalist = teacherService.exportPaper(tsn);
        String[] headers =  { "检索号", "论文名", "教师工号","第一作者", "通讯作者","发表期刊", "发表时间", "级别","期卷页","依托项目","所属学院","所属专业","学历","职称", "备注" };
        exportExcelUtil(response, ex, util, datalist, headers,"成果");
    }

    /**
     * 导出教师个人的荣誉信息
     */
    @Operation(name = "导出教师个人的荣誉信息")
    @RequestMapping("exportHonor.do")
    public void exportHonor(HttpServletResponse response, String tsn){
        ExportExcel<ExcelHonor> ex = new ExportExcel<ExcelHonor>();
        CommonUtils util = new CommonUtils();
        List<ExcelHonor> datalist = teacherService.exportHonor(tsn);
        String[] headers =  { "编号", "名称", "教师工号","第一完成人","第一完成单位", "时间", "颁奖单位", "级别", "所属学院","所属专业","学历","职称","备注" };
        exportExcelUtil(response, ex, util, datalist, headers,"荣誉");
    }

    /**
     * 导出教师个人的专利信息
     */
    @Operation(name = "导出教师个人的专利信息")
    @RequestMapping("exportPatent.do")
    public void exportPatent(HttpServletResponse response, String tsn){
        ExportExcel<ExcelPatent> ex = new ExportExcel<ExcelPatent>();
        CommonUtils util = new CommonUtils();
        List<ExcelPatent> datalist = teacherService.exportPatent(tsn);
        String[] headers = {"名称", "授权号", "申请时间", "授权时间", "类型", "发明人","教师工号", "专利权人", "所属学院", "所属专业", "学历", "职称", "备注"};
        exportExcelUtil(response, ex, util, datalist, headers,"专利");
    }

    /**
     * 导出教师个人的其他成果信息
     */
    @Operation(name = "导出教师个人的其他成果信息")
    @RequestMapping("exportOther.do")
    public void exportOther(HttpServletResponse response, String tsn){
        ExportExcel<ExcelOther> ex = new ExportExcel<ExcelOther>();
        CommonUtils util = new CommonUtils();
        List<ExcelOther> datalist = teacherService.exportOther(tsn);
        String[] headers = {"名称","教师工号" ,"发表人", "类型","日期","发表单位","所属学院","所属专业","学历","职称","成果描述"};
        exportExcelUtil(response, ex, util, datalist, headers,"其他成果");
    }


    /**
     * 查询教师个人的教师信息
     */
    @Operation(name = "查询教师个人的教师信息")
    @RequestMapping("findTeacher.do")
    public ModelAndView findTeacher(@RequestParam(required = false,defaultValue = "1",value = "pn")Integer pn,
                                  Map<String,Object> map, @RequestParam(required = false,defaultValue = "null")String cname, @RequestParam(required = false,defaultValue = "null")String dname,@RequestParam(required = false,defaultValue = "null")String tname){
        List<String> collegeList = collegeService.selectAllCollegeName();
        //引入分页查询，使用PageHelper分页功能
        //在查询之前传入当前页，然后多少记录
        PageHelper.startPage(pn,5);
        //当前条件下的查询结果
        List<Teacher> teachers = teacherService.selectAll(cname.trim(),dname,tname);
        //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以
        PageInfo pageInfo = new PageInfo<>(teachers,5);
        //pageINfo封装了分页的详细信息，也可以指定连续显示的页数
        map.put("pageInfo",pageInfo);
        ModelAndView mv = new ModelAndView();
        mv.addAllObjects(map);
        mv.addObject("teachers",teachers);
        Condition condition = new Condition(cname,dname,tname);
        mv.addObject("condition",condition);
        mv.addObject("collegeList",collegeList);
        mv.setViewName("admin/teacher/teacherList");
        return mv;
    }

    /**
     * 更改教师信息
     * @param Tsn 工号
     * @param Tname 教师名
     * @param Tsex 性别
     * @param Tdegree 学位
     * @param Tedubackground 学历
     * @param Tresdirection 研究方向
     * @param Tdateofbirth 出生年月
     * @param JobTitle 职称
     * @param Cname 所属学院
     * @param Dname 所属专业
     */
     @Operation(name = "更改教师信息")
     @RequestMapping("update")
     @ResponseBody
     public void update(String Tsn,String Tname,String Tsex,String Tdegree,String Tedubackground,String Tresdirection,String Tdateofbirth,String JobTitle,String Cname,String Dname){
        String Csn = teacherService.getCsn(Dname);
        String Dsn = teacherService.getDsn(Dname);
        Teacher teacher = new Teacher(Tsn,Tname,Tsex,Tdegree,Tedubackground,Tresdirection,Tdateofbirth,JobTitle,Csn,Dsn,Dname);
        teacherService.update(teacher);
     }


    @Operation(name = "导入excel")
    @RequestMapping("importExcel")
    public void importExcel(HttpServletRequest request, HttpServletResponse response) throws IOException, FileUploadException, ParseException {
        List list = excels(response,request);
        PrintWriter out = response.getWriter();
        //记录当前行数
        int count = 0;
        List<ExcelTeacher> excels = new ArrayList<ExcelTeacher>();
        //10为每条记录的字段数
        for (int i=0;i<list.size();i=i+10) {
            count++;
            //判断时间格式是否正确
            boolean vaild1 = judgeDate(list.get(i+7).toString());
            if (vaild1 == false) {
                count = count + 2;
                out.print("<script>alert('第" + count + "行可能存在错误，请检查后重新导入！')</script>");
                return;
            }else {
                //为出生年月
                String date1;
                if (!list.get(i+7).toString().equals("")){
                    date1 = formatDate(list.get(i+7).toString());
                }else {
                    date1 = list.get(i+7).toString();
                }
                try {
                    ExcelTeacher excel = new ExcelTeacher(list.get(i).toString(),list.get(i+1).toString(),list.get(i+2).toString(),list.get(i+3).toString(),list.get(i+4).toString(),list.get(i+5).toString(),list.get(i+6).toString(),date1,list.get(i+8).toString(),list.get(i+9).toString());
                    excel.toString();
                    //逐个添加各条数据
                    excels.add(excel);
                }catch (Exception e){
                    out.print("<script>alert('请检查导入数据是否正确！')</script>");
                }
            }
        }
        try {
            int result = teacherService.importExcel(excels);
            if (result == count){
                out.print("<script>alert('导入成功！')</script>");
            }
        }catch (DuplicateKeyException e){
            out.print("<script>alert('导入失败，请检查工号是否输入正确！')</script>");
        }
    }

    /**
     * 查询未审核的教师信息
     */
    @Operation(name = "查询未审核的教师信息")
    @RequestMapping("audit.do")
    public ModelAndView findAudit(@RequestParam(required = false,defaultValue = "1",value = "pn")Integer pn,
                                  Map<String,Object> map,String cname, String dname, String tname){
        //引入分页查询，使用PageHelper分页功能
        //在查询之前传入当前页，然后多少记录
        PageHelper.startPage(pn,5);
        //当前条件下的查询结果
        List<Teacher> teachers = teacherService.selectAllUnaudit(cname.trim(),dname,tname);
        //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以
        PageInfo pageInfo = new PageInfo<>(teachers,5);
        //pageINfo封装了分页的详细信息，也可以指定连续显示的页数
        map.put("pageInfo",pageInfo);
        ModelAndView mv = new ModelAndView();
        mv.addAllObjects(map);
        mv.addObject("teachers",teachers);
        Condition condition = new Condition(cname,dname,tname);
        mv.addObject("condition",condition);
        mv.setViewName("admin/teacher/auditTeacher");
        return mv;
    }

    /**
     * 审核通过
     */
    @Operation(name = "审核通过一条教师信息")
    @RequestMapping("pass.do")
    @ResponseBody
    public void pass(String majorkey,String message) {
        teacherService.pass(majorkey,message);
    }

    /**
     * 审核不通过
     */
    @Operation(name = "审核不通过一条教师信息")
    @RequestMapping("nopass.do")
    @ResponseBody
    public void nopass(String majorkey,String message){
        teacherService.nopass(majorkey,message);
    }


    /**
     * 按主键删除对应数据
     */
    @Operation(name = "删除教师信息")
    @RequestMapping("delete.do")
    @ResponseBody
    public void delete(String majorkey){
        teacherService.deleteByMajorkey(majorkey);
    }
}
