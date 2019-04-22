package com.slxy.edu.service.impl;

import com.slxy.edu.mapper.CollegeMapper;
import com.slxy.edu.service.ICollegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @program: TeacherWeb
 * @description:
 * @author: Mr.Jiang
 * @create: 2019-04-18 15:48
 **/

@Service("CollegeService")
@Transactional
public class CollegeServiceImpl implements ICollegeService {

    @Autowired
    private CollegeMapper collegeMapper;

    @Override
    public List<String> selectAllCollegeName() {
        List<String> collegeList = collegeMapper.selectAllCollegeName();
        return collegeList;
    }

    @Override
    public String getCname(String Csn) {
        String Cname = collegeMapper.getCname(Csn);
        return Cname;
    }


}
