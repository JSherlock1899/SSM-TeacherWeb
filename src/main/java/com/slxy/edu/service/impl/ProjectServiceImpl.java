package com.slxy.edu.service.impl;

import com.slxy.edu.mapper.ProjectMapper;
import com.slxy.edu.model.Project;
import com.slxy.edu.service.IProjectService;
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

@Service("ProjectService")
@Transactional
public class ProjectServiceImpl extends BaseServiceImpl<Project> implements IProjectService {

    @Autowired
    ProjectMapper projectMapper;

    @Override
    public Project findById(Integer id) {
        return null;
    }

    @Override
    public Project deletById(Integer id) {
        return null;
    }

    @Override
    public void update(Project scope) {

    }

    @Override
    public void insert(Project scope) {

    }

    @Override
    public List<Project> selectAll(String cname, String dname, String starttime, String endtime, String tname) {
        List<Project> patentList = projectMapper.selectAll(cname,dname,starttime,endtime,tname);
        return patentList;
    }
}
