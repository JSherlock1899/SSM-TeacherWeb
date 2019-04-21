package com.slxy.edu.mapper;

import com.slxy.edu.model.Patent;

import java.util.List;

public interface PatentMapper {

    //查询所有数据
    List<Patent> selectAll();
}
