package com.slxy.edu.mapper;

import com.slxy.edu.model.Project;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProjectMapper {

    //查询所有数据
    List<Project> selectAll(@Param("cname")String cname, @Param("dname")String dname, @Param("starttime")String starttime, @Param("endtime")String endtime, @Param("tname")String tname);
}
