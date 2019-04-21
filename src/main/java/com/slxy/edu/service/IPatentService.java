package com.slxy.edu.service;

import com.slxy.edu.model.Patent;

import java.util.List;

public interface IPatentService {

    //查询所有数据
    List<Patent> selectAll();
}
