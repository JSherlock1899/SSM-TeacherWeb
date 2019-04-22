package com.slxy.edu.mapper;

import com.slxy.edu.model.Honor;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HonorMapper {

    //查询所有数据
    List<Honor> selectAll(@Param("cname")String cname, @Param("dname")String dname, @Param("starttime")String starttime, @Param("endtime")String endtime, @Param("tname")String tname);
}
