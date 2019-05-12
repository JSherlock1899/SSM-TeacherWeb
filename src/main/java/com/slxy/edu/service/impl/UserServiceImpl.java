package com.slxy.edu.service.impl;

import com.slxy.edu.mapper.UserMapper;
import com.slxy.edu.model.Admin;
import com.slxy.edu.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @program: TeacherWeb
 * @description:
 * @author: Mr.Jiang
 * @create: 2019-04-16 20:01
 **/

@Service("UserService")
@Transactional
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserMapper userMapper; //通过@Autowired向spring容器注入UserMapper


    @Override
    public int adminLoginCheck(String username,String password) {
        return userMapper.adminLoginCheck(username,password);
    }

    @Override
    public int teacherLoginCheck(String username,String password) {
        return userMapper.teacherLoginCheck(username,password);
    }

    @Override
    public Admin getAdminGrade(String Aname) {
        return userMapper.getAdminGrade(Aname);
    }

    @Override
    public String getTeacherName(String Tsn) {
        return userMapper.getTeacherName(Tsn);
    }

    @Override
    public boolean verifyAdminPassword(String Aname, String oldPassword) {
        String password = userMapper.verifyAdminPassword(Aname,oldPassword);
        System.out.println("password的值是：" + password + ".当前方法:UserServiceImpl.verifyAdminPassword()");
        if(password == null){
            return false;
        }else {
            return password.trim().equals(oldPassword);
        }
    }

    @Override
    public boolean verifyTeacherPassword(String Tsn, String oldPassword) {
        String password = userMapper.verifyTeacherPassword(Tsn,oldPassword);
        return password.trim().equals(oldPassword);
    }

    @Override
    public int alterAdminPassword(String Aname, String newPassword) {
        return userMapper.alterAdminPassword(Aname,newPassword);
    }

    @Override
    public int alterTeacherPassword(String Tsn, String newPassword) {
        return userMapper.alterTeacherPassword(Tsn,newPassword);
    }
}
