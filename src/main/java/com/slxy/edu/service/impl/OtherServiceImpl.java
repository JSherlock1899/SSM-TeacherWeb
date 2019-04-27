package com.slxy.edu.service.impl;

import com.slxy.edu.mapper.OtherMapper;
import com.slxy.edu.model.Other;
import com.slxy.edu.service.IOtherService;
import com.slxy.edu.service.base.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @program: TeacherWeb
 * @description:
 * @author: Mr.Jiang
 * @create: 2019-04-21 16:52
 **/

@Service("OtherService")
@Transactional
public class OtherServiceImpl extends BaseServiceImpl<Other>  implements IOtherService {

    @Autowired
    OtherMapper otherMapper;

    @Override
    public Other findById(Integer id) {
        return null;
    }

    @Override
    public Other deletById(Integer id) {
        return null;
    }

    @Override
    public void update(Other scope) {

    }

    @Override
    public void insert(Other scope) {

    }

   

    @Override
    public List<Other> selectAll(String cname, String dname, String starttime, String endtime, String tname) {
        List<Other> patentList = otherMapper.selectAll(cname,dname,starttime,endtime,tname);
        return patentList;
    }
}
