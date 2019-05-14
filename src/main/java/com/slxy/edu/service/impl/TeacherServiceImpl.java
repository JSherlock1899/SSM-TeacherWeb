package com.slxy.edu.service.impl;

import com.slxy.edu.mapper.TeacherMapper;
import com.slxy.edu.model.*;
import com.slxy.edu.model.excel.*;
import com.slxy.edu.service.ITeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: TeacherWeb
 * @description:
 * @author: Mr.Jiang
 * @create: 2019-04-28 18:07
 **/

@Service
public class TeacherServiceImpl implements ITeacherService {

    @Autowired
    TeacherMapper teacherMapper;


    @Override
    public List<Project> selectProject(String tsn) {
        return teacherMapper.selectProject(tsn);
    }

    @Override
    public List<Paper> selectPaper(String tsn) {
        return teacherMapper.selectPaper(tsn);
    }

    @Override
    public List<Honor> selectHonor(String tsn) {
        return teacherMapper.selectHonor(tsn);
    }

    @Override
    public List<Patent> selectPatent(String tsn) {
        return teacherMapper.selectPatent(tsn);
    }

    @Override
    public List<Other> selectOther(String tsn) {
        return teacherMapper.selectOther(tsn);
    }

    /**
     * 根据教师号导出个人的excel
     * @param tsn
     * @return
     */

    @Override
    public List<ExcelProject> exportProject(String tsn) {
        return teacherMapper.exportProject(tsn);
    }

    @Override
    public List<ExcelPaper> exportPaper(String tsn) {
        return teacherMapper.exportPaper(tsn);
    }

    @Override
    public List<ExcelHonor> exportHonor(String tsn) {
        return teacherMapper.exportHonor(tsn);
    }

    @Override
    public List<ExcelPatent> exportPatent(String tsn) {
        return teacherMapper.exportPatent(tsn);
    }

    @Override
    public List<ExcelOther> exportOther(String tsn) {
        return teacherMapper.exportOther(tsn);
    }

    @Override
    public String selectCollegeByTsn(String tsn) {
        return teacherMapper.selectCollegeByTsn(tsn);
    }

    @Override
    public List<Teacher> selectAll(String cname, String dname, String tname) {
        return teacherMapper.selectAll(cname,dname,tname);
    }

    @Override
    public int update(Teacher teacher) {
        return teacherMapper.update(teacher);
    }

    @Override
    public String getCsn(String Dname) {
        return teacherMapper.getCsn(Dname);
    }

    @Override
    public String getDsn(String Dname) {
        return teacherMapper.getDsn(Dname);
    }

    @Override
    public int importExcel(List<ExcelTeacher> list) {
        return teacherMapper.importExcel(list);
    }

    @Override
    public List<Teacher> selectAllUnaudit(String cname, String dname, String tname) {
        return teacherMapper.selectAllUnaudit(cname,dname,tname);
    }

    @Override
    public void pass(String majorkey, String messsage) {
        teacherMapper.pass(majorkey,messsage);
    }

    @Override
    public void nopass(String majorkey, String messsage) {
        teacherMapper.nopass(majorkey,messsage);
    }

    @Override
    public Teacher selectByTsn(String Tsn) {
        return teacherMapper.selectByTsn(Tsn);
    }

    @Override
    public int deleteByMajorkey(String majorkey) {
        return teacherMapper.deleteByMajorkey(majorkey);
    }


}
