package com.slxy.edu.service;

import com.slxy.edu.model.Admin;
import com.slxy.edu.model.Teacher;

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

    //获取教师信息
    Teacher getTeacherInformation(String Tsn);

    //判断原密码是否正确
    boolean verifyAdminPassword(String Aname,String oldPassword);

    //判断教师原密码是否正确
    boolean verifyTeacherPassword(String Tsn,String oldPassword);

    //修改管理员密码
    int alterAdminPassword(String Aname,String newPassword);

    //修改教师密码
    int alterTeacherPassword(String Tsn,String newPassword);
}
