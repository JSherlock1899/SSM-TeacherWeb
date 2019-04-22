package com.slxy.edu.controller;

import com.slxy.edu.model.Admin;
import com.slxy.edu.service.ICollegeService;
import com.slxy.edu.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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

    @RequestMapping("login")
    public ModelAndView login(@RequestParam("username") String username, @RequestParam("password") String password){
        ModelAndView mv = new ModelAndView();
        List<String> collegeList = collegeService.selectAllCollegeName();
        mv.addObject("collegeList",collegeList);
        int result = userService.adminLoginCheck(username,password);
        //若result为1则该用户为管理员，若为0则用户不存在，继续判断该用户是否为教师
        if(result == 1) {
            Admin admin = userService.getAdminGrade(username);
            String Cname = collegeService.getCname(admin.getCsn());
            mv.addObject("admin",admin);
            mv.addObject("username", username);
            mv.addObject("Cname",Cname);
            mv.addObject("collegeList",collegeList);
            mv.setViewName("admin/SchoolAdmin");
            return mv;
        }else {
            result = userService.teacherLoginCheck(username,password);
            //若result为1则该用户为教师，反之则用户名或密码错误，跳转到 login.jsp页面重新登录
            System.out.println("result的11值是：" + result + ".当前方法:UserController.login()");
            if(result == 1) {
                mv.addObject("username", username);
                mv.setViewName("teacher/Teacher");
                return mv;
            }else {
                return new ModelAndView("redirect:login.jsp");
            }
        }
    }

}

