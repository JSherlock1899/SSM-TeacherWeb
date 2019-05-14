package com.slxy.edu.service.impl;

import com.slxy.edu.mapper.HonorMapper;
import com.slxy.edu.model.Honor;
import com.slxy.edu.model.excel.ExcelHonor;
import com.slxy.edu.service.IHonorService;
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
 * @create: 2019-04-21 16:40
 **/

@Service("HonorService")
@Transactional
public class HonorServiceImpl extends BaseServiceImpl<Honor> implements IHonorService {

    @Autowired
    HonorMapper honorMapper;

    @Override
    public List<Honor> selectAll(String cname, String dname, String starttime, String endtime, String tname) {
        return honorMapper.selectAll(cname,dname,starttime,endtime,tname);

    }

    @Override
    public List<Honor> selectAllUnaudit(String cname, String dname, String starttime, String endtime, String tname) {
        return honorMapper.selectAllUnaudit(cname,dname,starttime,endtime,tname);
    }

    @Override
    public Honor selectByMajorKey(String majorkey) {
        return honorMapper.selectByMajorKey(majorkey);
    }

    @Override
    public int updateOne(Honor honor) {
        return honorMapper.updateOne(honor);
    }

    @Override
    public int insertOne(Honor honor) {
        return honorMapper.insertOne(honor);
    }


    @Override
    public List<ExcelHonor> selectExcel(String cname, String dname, String starttime, String endtime, String tname) {
        return honorMapper.selectExcel(cname,dname,starttime,endtime,tname);
    }

    @Override
    public int importExcel(List<ExcelHonor> list) {
        return honorMapper.importExcel(list);
    }

    @Override
    public void pass(String majorkey, String messsage) {
        honorMapper.pass(majorkey,messsage);
    }

    @Override
    public void nopass(String majorkey, String messsage) {
        honorMapper.nopass(majorkey,messsage);
    }

    @Override
    public void savePath(String majorkey, String path) {
        honorMapper.savePath(majorkey,path);
    }

    @Override
    public String getPath(String majorkey) {
        return honorMapper.getPath(majorkey);
    }

    @Override
    public List<Map<String, Integer>> getCollegeCount(String starttime,String endtime) {
        return honorMapper.getCollegeCount(starttime, endtime);
    }

    @Override
    public List<Map<String, Integer>> getSdeptCount(String starttime, String endtime,String Cname) {
        return honorMapper.getSdeptCount(starttime,endtime,Cname);
    }

    @Override
    public List<Map<String, Integer>> getRecentYearsCount(String starttime, String endtime) {
        return honorMapper.getRecentYearsCount(starttime,endtime);
    }

    @Override
    public List<Map<String, Integer>> getRecentYearsSdeptCount(String starttime, String endtime, String cname) {
        return honorMapper.getRecentYearsSdeptCount(starttime,endtime,cname);
    }

    @Override
    public int deleteByMajorkey(String majorkey) {
        return honorMapper.deleteByMajorkey(majorkey);
    }

    @Override
    public void alterByMajorkey(Honor honor) {
        honorMapper.alterByMajorkey(honor);
    }


}
