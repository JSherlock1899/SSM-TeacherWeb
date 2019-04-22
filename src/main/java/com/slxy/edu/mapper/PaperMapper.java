package com.slxy.edu.mapper;

import com.slxy.edu.model.Paper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PaperMapper {

    //查询所有数据
    List<Paper> selectAll(@Param("cname")String cname, @Param("dname")String dname, @Param("starttime")String starttime, @Param("endtime")String endtime, @Param("tname")String tname);
}
