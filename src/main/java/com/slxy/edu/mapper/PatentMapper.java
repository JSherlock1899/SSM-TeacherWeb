package com.slxy.edu.mapper;

import com.slxy.edu.model.Patent;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PatentMapper {

    //查询所有数据
    List<Patent> selectAll(@Param("cname")String cname, @Param("dname")String dname, @Param("starttime")String starttime, @Param("endtime")String endtime, @Param("tname")String tname);
}
