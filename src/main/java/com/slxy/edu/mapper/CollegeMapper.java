package com.slxy.edu.mapper;

import java.util.List;


public interface CollegeMapper {

    //查询所有的学院信息
    List<String > selectAllCollegeName();

    //将学院号转化为学院名
    String getCname(String Csn);
}
