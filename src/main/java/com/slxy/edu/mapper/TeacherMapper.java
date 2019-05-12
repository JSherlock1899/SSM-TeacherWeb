package com.slxy.edu.mapper;

import com.slxy.edu.model.*;
import com.slxy.edu.model.excel.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TeacherMapper {

    List<Project> selectProject(@Param("tsn")String tsn);

    List<Paper> selectPaper(@Param("tsn")String tsn);

    List<Honor> selectHonor(@Param("tsn")String tsn);

    List<Patent> selectPatent(@Param("tsn")String tsn);

    List<Other> selectOther(@Param("tsn")String tsn);

    List<ExcelProject> exportProject(@Param("tsn")String tsn);

    List<ExcelPaper> exportPaper(@Param("tsn")String tsn);
    
    List<ExcelHonor> exportHonor(@Param("tsn")String tsn);

    List<ExcelPatent> exportPatent(@Param("tsn")String tsn);

    List<ExcelOther> exportOther(@Param("tsn")String tsn);

    String selectCollegeByTsn(@Param("tsn")String tsn);

    //查询当前条件下的所有数据
    List<Teacher> selectAll(@Param("cname")String cname, @Param("dname")String dname, @Param("tname")String tname);

    int update(@Param("entity")Teacher teacher);

    //获取当前教师的学院号
    String getCsn(@Param("Dname")String Dname);

    //获取当前教师的专业号
    String getDsn(@Param("Dname")String Dname);

    //导入excel
    int importExcel(List<ExcelTeacher> list);

    //查询未审核的数据
    List<Teacher> selectAllUnaudit(@Param("cname")String cname, @Param("dname")String dname,  @Param("tname")String tname);

    //审核通过
    void pass(@Param("majorkey")String majorkey,@Param("message")String messsage);

    //审核不通过
    void nopass(@Param("majorkey")String majorkey,@Param("message")String messsage);
}
