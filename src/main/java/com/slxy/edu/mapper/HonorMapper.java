package com.slxy.edu.mapper;

import com.slxy.edu.model.Honor;
import com.slxy.edu.model.excel.ExcelHonor;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HonorMapper extends BaseMapper<Honor> {

    //查询要导出excel的数据
    List<ExcelHonor> selectExcel(@Param("cname")String cname, @Param("dname")String dname, @Param("starttime")String starttime, @Param("endtime")String endtime, @Param("tname")String tname);

    //导入excel
    int importExcel(List<ExcelHonor> list);
}
