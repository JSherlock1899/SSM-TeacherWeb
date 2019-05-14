package com.slxy.edu.controller;

import com.slxy.edu.model.Admin;
import com.slxy.edu.model.Teacher;
import com.slxy.edu.service.ICollegeService;
import com.slxy.edu.service.ITeacherService;
import com.slxy.edu.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * @program: TeacherWeb
 * @description:判断用户是否有登录权限及相关操作
 * @author: Mr.Jiang
 * @create: 2019-04-15 20:58
 **/

@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    public IUserService userService;

    @Autowired
    public ICollegeService collegeService;

    @Autowired
    public ITeacherService teacherService;

    @RequestMapping("login")
    public ModelAndView login(HttpServletRequest request,HttpServletResponse response,@RequestParam("username") String username, @RequestParam("password") String password) throws IOException {
        PrintWriter out = response.getWriter();
        out.flush();
        ModelAndView mv = new ModelAndView();
        List<String> collegeList = collegeService.selectAllCollegeName();
        mv.addObject("collegeList",collegeList);
        int result = userService.adminLoginCheck(username,password);
        //若result为1则该用户为管理员，若为0则用户不存在，继续判断该用户是否为教师
        if(result == 1) {
            Admin admin = userService.getAdminGrade(username);
            String Cname = collegeService.getCname(admin.getCsn());
            String grade = admin.getAgrad();
            request.getSession().setAttribute("grade", grade);
            request.getSession().setAttribute("cname", Cname);
            request.getSession().setAttribute("username", username);
            mv.addObject("admin",admin);
            mv.addObject("username", username);
            mv.addObject("collegeList",collegeList);
            mv.setViewName("admin/SchoolAdmin");
            return mv;
        }else {
            result = userService.teacherLoginCheck(username,password);
            //若result为1则该用户为教师，反之则用户名或密码错误，跳转到 login.jsp页面重新登录
            if(result == 1) {
                //获取教师实体
                String Tname = userService.getTeacherName(username);
                //获取教师名
                request.getSession().setAttribute("username", username);
                request.getSession().setAttribute("Tname", Tname);
                request.getSession().setAttribute("grade", "null");
                mv.setViewName("teacher/Teacher");
                return mv;
            }else {
                out.print("<script>alert('用户名或密码错误！');</script>");
                mv.setViewName("login");
                return mv;
            }
        }
    }


    @RequestMapping("password")
    public String password(){
        return "other/password";
    }

    @RequestMapping("changePassword")
    public void changePassword(HttpServletRequest request, HttpServletResponse response,String oldPassword, String newPassword) throws IOException {
        PrintWriter out = response.getWriter();
        String grade = (String) request.getSession().getAttribute("grade");
        boolean vaild = false;
        //该用户为管理员
        if(grade != "null"){
            String Aname = (String) request.getSession().getAttribute("username");
            //判断原密码是否正确
            vaild = userService.verifyAdminPassword(Aname, oldPassword);
            //若密码验证成功则修改密码
            if (vaild){
                int result = userService.alterAdminPassword(Aname, newPassword);
                if (result == 1){
                    out.print("<script>alert('修改密码成功！');</script>");
                }
            }else {
                out.print("<script>alert('原密码错误！');</script>");
            }
        }else {
            //该用户为教师
            String Tsn = (String) request.getSession().getAttribute("username");
            vaild = userService.verifyTeacherPassword(Tsn, oldPassword);
            //若密码验证成功则修改密码
            if (vaild){
                int result = userService.alterTeacherPassword(Tsn, newPassword);
                if (result == 1){
                    out.print("<script>alert('修改密码成功');</script>");
                }
            }else {
                out.print("<script>alert('原密码错误！');</script>");
            }
        }
    }

    @RequestMapping("exitLogin")
    public String exitLogin(){
        return "login";
    }

    @RequestMapping("myInformation")
    public ModelAndView myInformation(HttpServletRequest request){
        //获取学院列表
        List<String> collegeList = collegeService.selectAllCollegeName();
        //获取当前教师信息
        String Tsn = (String) request.getSession().getAttribute("username");
        Teacher teacher = teacherService.selectByTsn(Tsn);
        ModelAndView mv = new ModelAndView();
        mv.addObject("collegeList",collegeList);
        mv.addObject("teacher",teacher);
        mv.setViewName("other/myInformation");
        return mv;
    }
}

