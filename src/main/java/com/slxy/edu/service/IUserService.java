package com.slxy.edu.service;

import com.slxy.edu.model.Admin;

/**
 * @program: TeacherWeb
 * @description:
 * @author: Mr.Jiang
 * @create: 2019-04-16 19:56
 **/


public interface IUserService {

    //管理员登录验证
    int adminLoginCheck(String username,String password);

    //教师登录验证
    int teacherLoginCheck(String username,String password);

    //获取管理员信息
    Admin getAdminGrade(String Aname);
}
