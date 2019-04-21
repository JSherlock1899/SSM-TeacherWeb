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


}
