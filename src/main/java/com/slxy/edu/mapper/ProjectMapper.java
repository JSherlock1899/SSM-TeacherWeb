package com.slxy.edu.mapper;

import com.slxy.edu.model.Project;
import com.slxy.edu.model.excel.ExcelProject;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ProjectMapper extends BaseMapper<Project>{

    //查询要导出excel的数据
    List<ExcelProject> selectExcel(@Param("cname")String cname, @Param("dname")String dname, @Param("starttime")String starttime, @Param("endtime")String endtime, @Param("tname")String tname);

    //导入excel
    int importExcel(List<ExcelProject> list);

    //获取各学院项目经费
    List<Map<String, Integer>> getProjectMoney(@Param("starttime")String starttime, @Param("endtime")String endtime);

    //获取各专业项目经费
    List<Map<String, Integer>> getSdeptProjectMoney(@Param("starttime")String starttime,@Param("endtime")String endtime ,@Param("cname")String Cname);
}
