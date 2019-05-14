package com.slxy.edu.service.impl;

import com.slxy.edu.mapper.ProjectMapper;
import com.slxy.edu.model.Project;
import com.slxy.edu.model.excel.ExcelProject;
import com.slxy.edu.service.IProjectService;
import com.slxy.edu.service.base.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

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
    public List<Project> selectAll(String cname, String dname, String starttime, String endtime, String tname) {
        return projectMapper.selectAll(cname,dname,starttime,endtime,tname);

    }

    @Override
    public List<Project> selectAllUnaudit(String cname, String dname, String starttime, String endtime, String tname) {
        return projectMapper.selectAllUnaudit(cname,dname,starttime,endtime,tname);
    }

    @Override
    public Project selectByMajorKey(String majorkey) {
        return projectMapper.selectByMajorKey(majorkey);
    }

    @Override
    public int updateOne(Project project) {
        return projectMapper.updateOne(project);
    }

    @Override
    public int insertOne(Project project) {
        return projectMapper.insertOne(project);
    }

    @Override
    public void pass(String majorkey, String messsage) {
        projectMapper.pass(majorkey,messsage);
    }

    @Override
    public void nopass(String majorkey, String messsage) {
        projectMapper.nopass(majorkey,messsage);
    }

    @Override
    public void savePath(String majorkey, String path) {
        projectMapper.savePath(majorkey,path);
    }

    @Override
    public String getPath(String majorkey) {
        return projectMapper.getPath(majorkey);
    }

    @Override
    public List<Map<String, Integer>> getCollegeCount(String starttime,String endtime) {
        return projectMapper.getCollegeCount(starttime, endtime);
    }

    @Override
    public List<Map<String, Integer>> getSdeptCount(String starttime, String endtime,String Cname) {
        return projectMapper.getSdeptCount(starttime,endtime,Cname);
    }

    @Override
    public List<Map<String, Integer>> getRecentYearsCount(String starttime, String endtime) {
        return projectMapper.getRecentYearsCount(starttime,endtime);
    }

    @Override
    public List<Map<String, Integer>> getRecentYearsSdeptCount(String starttime, String endtime, String cname) {
        return projectMapper.getRecentYearsSdeptCount(starttime,endtime,cname);
    }

    @Override
    public int deleteByMajorkey(String majorkey) {
        return projectMapper.deleteByMajorkey(majorkey);
    }

    @Override
    public void alterByMajorkey(Project project) {
        projectMapper.alterByMajorkey(project);
    }


    @Override
    public List<ExcelProject> selectExcel(String cname, String dname, String starttime, String endtime, String tname) {
        return projectMapper.selectExcel(cname,dname,starttime,endtime,tname);
    }

    @Override
    public int importExcel(List<ExcelProject> list) {
        return projectMapper.importExcel(list);
    }

    @Override
    public List<Map<String, Integer>> getProjectMoney(String starttime, String endtime) {
        return projectMapper.getProjectMoney(starttime,endtime);
    }

    @Override
    public List<Map<String, Integer>> getSdeptProjectMoney(String starttime, String endtime, String Cname) {
        return projectMapper.getSdeptProjectMoney(starttime,endtime,Cname);
    }

}
