package com.slxy.edu.service.impl;

import com.slxy.edu.mapper.PaperMapper;
import com.slxy.edu.model.Paper;
import com.slxy.edu.service.IPaperService;
import com.slxy.edu.service.base.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @program: TeacherWeb
 * @description:
 * @author: Mr.Jiang
 * @create: 2019-04-21 16:41
 **/

@Service("PaperService")
@Transactional
public class PaperServiceImpl extends BaseServiceImpl<Paper> implements IPaperService {

    @Autowired
    PaperMapper paperMapper;

    @Override
    public Paper findById(Integer id) {
        return null;
    }

    @Override
    public Paper deletById(Integer id) {
        return null;
    }

    @Override
    public void update(Paper scope) {

    }

    @Override
    public void insert(Paper scope) {

    }

    @Override
    public List<Paper> selectAll(String cname, String dname, String starttime, String endtime, String tname) {
        List<Paper> paperList = paperMapper.selectAll(cname,dname,starttime,endtime,tname);
        return paperList;
    }
}
