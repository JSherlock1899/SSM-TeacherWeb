package com.slxy.edu.service.impl;

import com.slxy.edu.mapper.PaperMapper;
import com.slxy.edu.model.Paper;
import com.slxy.edu.model.excel.ExcelPaper;
import com.slxy.edu.service.IPaperService;
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
 * @create: 2019-04-21 16:41
 **/

@Service("PaperService")
@Transactional
public class PaperServiceImpl extends BaseServiceImpl<Paper> implements IPaperService {

    @Autowired
    PaperMapper paperMapper;

    @Override
    public List<Paper> selectAll(String cname, String dname, String starttime, String endtime, String tname) {
        return paperMapper.selectAll(cname,dname,starttime,endtime,tname);
    }

    @Override
    public List<Paper> selectAllUnaudit(String cname, String dname, String starttime, String endtime, String tname) {
        return paperMapper.selectAllUnaudit(cname,dname,starttime,endtime,tname);
    }

    @Override
    public Paper selectByMajorKey(String majorkey) {
        return paperMapper.selectByMajorKey(majorkey);
    }

    @Override
    public int updateOne(Paper paper) {
        return  paperMapper.updateOne(paper);
    }

    @Override
    public int insertOne(Paper paper) {
        return paperMapper.insertOne(paper);
    }

    @Override
    public List<ExcelPaper> selectExcel(String cname, String dname, String starttime, String endtime, String tname) {
        return paperMapper.selectExcel(cname,dname,starttime,endtime,tname);
    }

    @Override
    public int importExcel(List<ExcelPaper> list) {
        return paperMapper.importExcel(list);
    }

    @Override
    public void pass(String majorkey, String messsage) {
        paperMapper.pass(majorkey,messsage);
    }

    @Override
    public void nopass(String majorkey, String messsage) {
        paperMapper.nopass(majorkey,messsage);
    }

    @Override
    public void savePath(String majorkey, String path) {
        paperMapper.savePath(majorkey,path);
    }

    @Override
    public String getPath(String majorkey) {
        return paperMapper.getPath(majorkey);
    }

    @Override
    public List<Map<String, Integer>> getCollegeCount(String starttime,String endtime) {
        return paperMapper.getCollegeCount(starttime, endtime);
    }

    @Override
    public List<Map<String, Integer>> getSdeptCount(String starttime, String endtime,String Cname) {
        return paperMapper.getSdeptCount(starttime,endtime,Cname);
    }

    @Override
    public List<Map<String, Integer>> getRecentYearsCount(String starttime, String endtime) {
        return paperMapper.getRecentYearsCount(starttime,endtime);
    }

    @Override
    public List<Map<String, Integer>> getRecentYearsSdeptCount(String starttime, String endtime, String cname) {
        return paperMapper.getRecentYearsSdeptCount(starttime,endtime,cname);
    }

    @Override
    public int deleteByMajorkey(String majorkey) {
        return paperMapper.deleteByMajorkey(majorkey);
    }

    @Override
    public void alterByMajorkey(Paper paper) {
        paperMapper.alterByMajorkey(paper);
    }


}
