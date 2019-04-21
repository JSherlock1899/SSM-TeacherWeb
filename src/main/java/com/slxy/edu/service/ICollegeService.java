package com.slxy.edu.service;

import java.util.List;

public interface ICollegeService {

    //查询所有的学院信息
    List<String> selectAllCollegeName();

    //将学院号转化为学院名
    String getCname(String Csn);
}
