package com.slxy.edu.service.impl;

import com.slxy.edu.mapper.PatentMapper;
import com.slxy.edu.model.Patent;
import com.slxy.edu.service.IPatentService;
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
public class PatentServiceImpl implements IPatentService {

    @Autowired
    PatentMapper patentMapper;

    @Override
    public List<Patent> selectAll() {
        List<Patent> patentList = patentMapper.selectAll();
        return patentList;
    }
}
