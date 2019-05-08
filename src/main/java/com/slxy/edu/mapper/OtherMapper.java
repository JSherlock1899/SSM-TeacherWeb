package com.slxy.edu.mapper;

import com.slxy.edu.model.Other;
import com.slxy.edu.model.excel.ExcelOther;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OtherMapper extends BaseMapper<Other>{

    //查询要导出excel的数据
    List<ExcelOther> selectExcel(@Param("cname")String cname, @Param("dname")String dname, @Param("starttime")String starttime, @Param("endtime")String endtime, @Param("tname")String tname);

    //导入excel
    int importExcel(List<ExcelOther> list);
}


