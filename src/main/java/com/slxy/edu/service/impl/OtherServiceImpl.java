package com.slxy.edu.service.impl;

import com.slxy.edu.mapper.OtherMapper;
import com.slxy.edu.model.Other;
import com.slxy.edu.model.excel.ExcelOther;
import com.slxy.edu.service.IOtherService;
import com.slxy.edu.service.base.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * @program: TeacherWeb
 * @description:
 * @author: Mr.Jiang
 * @create: 2019-04-21 16:52
 **/

@Service("OtherService")
@Transactional
public class OtherServiceImpl extends BaseServiceImpl<Other>  implements IOtherService {

    @Autowired
    OtherMapper otherMapper;


    @Override
    public List<Other> selectAll(String cname, String dname, String starttime, String endtime, String tname) {
        return otherMapper.selectAll(cname,dname,starttime,endtime,tname);
    }

    @Override
    public List<Other> selectAllUnaudit(String cname, String dname, String starttime, String endtime, String tname) {
        return otherMapper.selectAllUnaudit(cname,dname,starttime,endtime,tname);
    }

    @Override
    public Other selectByMajorKey(String majorkey) {
        return otherMapper.selectByMajorKey(majorkey);
    }

    @Override
    public int updateOne(Other other) {
        return otherMapper.updateOne(other);
    }

    @Override
    public int insertOne(Other other) {
        return otherMapper.insertOne(other);
    }

    @Override
    public List<ExcelOther> selectExcel(String cname, String dname, String starttime, String endtime, String tname) {
        return otherMapper.selectExcel(cname,dname,starttime,endtime,tname);
    }

    @Override
    public int importExcel(List<ExcelOther> list) {
        return otherMapper.importExcel(list);
    }

    @Override
    public void pass(String majorkey, String messsage) {
        otherMapper.pass(majorkey,messsage);
    }

    @Override
    public void nopass(String majorkey, String messsage) {
        otherMapper.nopass(majorkey,messsage);
    }

    @Override
    public void savePath(String majorkey, String path) {
        otherMapper.savePath(majorkey,path);
    }

    @Override
    public String getPath(String majorkey) {
        return otherMapper.getPath(majorkey);
    }

    @Override
    public List<Map<String, Integer>> getCollegeCount(String starttime,String endtime) {
        return otherMapper.getCollegeCount(starttime,endtime);
    }

    @Override
    public List<Map<String, Integer>> getSdeptCount(String starttime, String endtime,String Cname) {
        return otherMapper.getSdeptCount(starttime,endtime,Cname);
    }

    @Override
    public List<Map<String, Integer>> getRecentYearsCount(String starttime, String endtime) {
        return otherMapper.getRecentYearsCount(starttime,endtime);
    }

    @Override
    public List<Map<String, Integer>> getRecentYearsSdeptCount(String starttime, String endtime, String cname) {
        return otherMapper.getRecentYearsSdeptCount(starttime,endtime,cname);
    }



}
