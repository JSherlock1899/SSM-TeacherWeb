package com.slxy.edu.service;

import com.slxy.edu.model.Honor;
import com.slxy.edu.model.excel.ExcelHonor;
import com.slxy.edu.service.base.IBaseService;

import java.util.List;

public interface IHonorService  extends IBaseService<Honor> {

    //查询要导出excel的数据
    List<ExcelHonor> selectExcel(String cname, String dname, String starttime, String endtime, String tname);

    //导入excel
    int importExcel(List<ExcelHonor> list);
}
