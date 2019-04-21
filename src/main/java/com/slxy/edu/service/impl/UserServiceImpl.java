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
        int result = userMapper.adminLoginCheck(username,password);
        return result;
    }

    @Override
    public int teacherLoginCheck(String username,String password) {
        int result = userMapper.teacherLoginCheck(username,password);
        return result;
    }

    @Override
    public Admin getAdminGrade(String Aname) {
        Admin admin = userMapper.getAdminGrade(Aname);
        return admin;
    }
}
