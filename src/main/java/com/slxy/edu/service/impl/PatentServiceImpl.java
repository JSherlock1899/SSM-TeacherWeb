package com.slxy.edu.service.impl;

import com.slxy.edu.mapper.PatentMapper;
import com.slxy.edu.model.Patent;
import com.slxy.edu.service.IPatentService;
import com.slxy.edu.service.base.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @program: TeacherWeb
 * @description:
 * @author: Mr.Jiang
 * @create: 2019-04-19 22:12
 **/

@Service("PatentService")
@Transactional
public class PatentServiceImpl extends BaseServiceImpl<Patent> implements IPatentService{

    @Autowired
    PatentMapper patentMapper;

    @Override
    public Patent findById(Integer id) {
        return null;
    }

    @Override
    public Patent deletById(Integer id) {
        return null;
    }

    @Override
    public void update(Patent scope) {

    }

    @Override
    public void insert(Patent scope) {

    }

    @Override
    public List<Patent> selectAll(String cname,String dname,String starttime,String endtime,String tname) {
        List<Patent> patentList = patentMapper.selectAll(cname,dname,starttime,endtime,tname);
        return patentList;
    }
}
