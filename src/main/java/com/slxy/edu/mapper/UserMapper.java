package com.slxy.edu.mapper;

import com.slxy.edu.model.Admin;
import org.apache.ibatis.annotations.Param;


public interface UserMapper {

    //管理员登录验证
    int adminLoginCheck(@Param("username") String username, @Param("password")String password);

    //教师登录验证
    int teacherLoginCheck(@Param("username") String username, @Param("password")String password);

    //获取管理员信息
    Admin getAdminGrade(String Aname);

    //获取教师信息
    String getTeacherName(String Tsn);

    //判断管理员原密码是否正确
    String verifyAdminPassword(@Param("Aname")String Aname,@Param("oldPassword")String oldPassword);

    //判断教师原密码是否正确
    String verifyTeacherPassword(@Param("Tsn")String Tsn,@Param("oldPassword")String oldPassword);

    //修改管理员密码
    int alterAdminPassword(@Param("Aname")String Aname,@Param("newPassword")String newPassword);

    //修改教师密码
    int alterTeacherPassword(@Param("Tsn")String Tsn,@Param("newPassword")String newPassword);
}
