package com.slxy.edu.service;

import com.slxy.edu.model.Paper;
import com.slxy.edu.model.excel.ExcelPaper;
import com.slxy.edu.service.base.IBaseService;

import java.util.List;

public interface IPaperService extends IBaseService<Paper> {

    //查询要导出excel的数据
    List<ExcelPaper> selectExcel(String cname, String dname, String starttime, String endtime, String tname);

    //导入excel
    int importExcel(List<ExcelPaper> list);
}
