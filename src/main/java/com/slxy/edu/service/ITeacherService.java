package com.slxy.edu.service;

import com.slxy.edu.model.*;
import com.slxy.edu.model.excel.*;

import java.util.List;

public interface ITeacherService {

    List<Project> selectProject(String tsn);

    List<Paper> selectPaper(String tsn);

    List<Honor> selectHonor(String tsn);

    List<Patent> selectPatent(String tsn);

    List<Other> selectOther(String tsn);

    List<ExcelProject> exportProject(String tsn);

    List<ExcelPaper> exportPaper(String tsn);

    List<ExcelHonor> exportHonor(String tsn);

    List<ExcelPatent> exportPatent(String tsn);

    List<ExcelOther> exportOther(String tsn);

    String selectCollegeByTsn(String tsn);

    //查询当前条件下的所有数据
    List<Teacher> selectAll(String cname,String dname,String tname);

    int update(Teacher teacher);

    //获取当前教师的学院号
    String getCsn(String Dname);

    //获取当前教师的专业号
    String getDsn(String Dname);

    //导入excel
    int importExcel(List<ExcelTeacher> list);

    //查询未审核的数据
    List<Teacher> selectAllUnaudit(String cname, String dname, String tname);

    //审核通过
    void pass(String majorkey,String messsage);

    //审核不通过
    void nopass(String majorkey,String messsage);
}
