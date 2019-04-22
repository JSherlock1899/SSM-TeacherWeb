package com.slxy.edu.service.impl;

import com.slxy.edu.mapper.HonorMapper;
import com.slxy.edu.model.Honor;
import com.slxy.edu.service.IHonorService;
import com.slxy.edu.service.base.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @program: TeacherWeb
 * @description:
 * @author: Mr.Jiang
 * @create: 2019-04-21 16:40
 **/

@Service("HonorService")
@Transactional
public class HonorServiceImpl extends BaseServiceImpl<Honor> implements IHonorService {

    @Autowired
    HonorMapper honorMapper;

    @Override
    public Honor findById(Integer id) {
        return null;
    }

    @Override
    public Honor deletById(Integer id) {
        return null;
    }

    @Override
    public void update(Honor scope) {

    }

    @Override
    public void insert(Honor scope) {

    }

    @Override
    public List<Honor> selectAll(String cname, String dname, String starttime, String endtime, String tname) {
        List<Honor> honroList = honorMapper.selectAll(cname,dname,starttime,endtime,tname);
        return honroList;
    }


}
