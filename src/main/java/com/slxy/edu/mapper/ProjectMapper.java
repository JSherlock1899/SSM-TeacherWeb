package com.slxy.edu.mapper;

import com.slxy.edu.model.Project;
import com.slxy.edu.model.excel.ExcelProject;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProjectMapper extends BaseMapper<Project>{

    //查询要导出excel的数据
    List<ExcelProject> selectExcel(@Param("cname")String cname, @Param("dname")String dname, @Param("starttime")String starttime, @Param("endtime")String endtime, @Param("tname")String tname);

    //导入excel
    int importExcel(List<ExcelProject> list);
}
