package com.slxy.edu.mapper;

import com.slxy.edu.model.Patent;
import com.slxy.edu.model.excel.ExcelPatent;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PatentMapper extends BaseMapper<Patent>{

    //查询要导出excel的数据
    List<ExcelPatent> selectExcel(@Param("cname")String cname, @Param("dname")String dname, @Param("starttime")String starttime, @Param("endtime")String endtime, @Param("tname")String tname);

    //导入excel
    int importExcel(List<ExcelPatent> list);
}
