package com.slxy.edu.service;

import com.slxy.edu.model.Patent;
import com.slxy.edu.model.excel.ExcelPatent;
import com.slxy.edu.service.base.IBaseService;

import java.util.List;

public interface IPatentService extends IBaseService<Patent> {

    //查询要导出excel的数据
    List<ExcelPatent> selectExcel(String cname, String dname, String starttime, String endtime, String tname);

    //导入excel
    int importExcel(List<ExcelPatent> list);
}
