package com.slxy.edu.service.impl;

import com.slxy.edu.mapper.PatentMapper;
import com.slxy.edu.model.Patent;
import com.slxy.edu.model.excel.ExcelPatent;
import com.slxy.edu.service.IPatentService;
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
 * @create: 2019-04-19 22:12
 **/

@Service("PatentService")
@Transactional
public class PatentServiceImpl extends BaseServiceImpl<Patent> implements IPatentService{

    @Autowired
    PatentMapper patentMapper;

    @Override
    public List<Patent> selectAll(String cname,String dname,String starttime,String endtime,String tname) {
        return patentMapper.selectAll(cname,dname,starttime,endtime,tname);
    }

    @Override
    public List<Patent> selectAllUnaudit(String cname, String dname, String starttime, String endtime, String tname) {
        return patentMapper.selectAllUnaudit(cname,dname,starttime,endtime,tname);
    }

    @Override
    public Patent selectByMajorKey(String majorkey) {
        return patentMapper.selectByMajorKey(majorkey);
    }

    @Override
    public int updateOne(Patent patent) {
        return patentMapper.updateOne(patent);
    }

    @Override
    public int insertOne(Patent patent) {
        return patentMapper.insertOne(patent);
    }

    @Override
    public void pass(String majorkey, String messsage) {
        patentMapper.pass(majorkey,messsage);
    }

    @Override
    public void nopass(String majorkey, String messsage) {
        patentMapper.nopass(majorkey,messsage);
    }

    @Override
    public void savePath(String majorkey, String path) {
        patentMapper.savePath(majorkey,path);
    }

    @Override
    public String getPath(String majorkey) {
        return patentMapper.getPath(majorkey);
    }

    @Override
    public List<Map<String, Integer>> getCollegeCount(String starttime,String endtime) {
        return patentMapper.getCollegeCount(starttime, endtime);
    }

    @Override
    public List<ExcelPatent> selectExcel(String cname, String dname, String starttime, String endtime, String tname) {
        return patentMapper.selectExcel(cname,dname,starttime,endtime,tname);
    }

    @Override
    public int importExcel(List<ExcelPatent> list) {
        return patentMapper.importExcel(list);
    }

    @Override
    public List<Map<String, Integer>> getSdeptCount(String starttime, String endtime,String Cname) {
        return patentMapper.getSdeptCount(starttime,endtime,Cname);
    }

    @Override
    public List<Map<String, Integer>> getRecentYearsCount(String starttime, String endtime) {
        return patentMapper.getRecentYearsCount(starttime,endtime);
    }

    @Override
    public List<Map<String, Integer>> getRecentYearsSdeptCount(String starttime, String endtime, String cname) {
        return patentMapper.getRecentYearsSdeptCount(starttime,endtime,cname);
    }

    @Override
    public int deleteByMajorkey(String majorkey) {
        return patentMapper.deleteByMajorkey(majorkey);
    }

    @Override
    public void alterByMajorkey(Patent patent) {
        patentMapper.alterByMajorkey(patent);
    }


}
