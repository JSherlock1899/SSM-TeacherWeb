package com.slxy.edu.service.base;

import java.util.List;

public interface IBaseService<T> {

    public T findById(Integer id);

    public T deletById(Integer id);

    public void update(T scope);

    public void insert(T scope);

    //查询所有数据
    List<T> selectAll(String cname, String dname, String starttime, String endtime, String tname);
}
