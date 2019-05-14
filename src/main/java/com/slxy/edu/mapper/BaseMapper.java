package com.slxy.edu.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface BaseMapper<T> {

    //查询当前条件下的所有数据
    List<T> selectAll(@Param("cname")String cname, @Param("dname")String dname, @Param("starttime")String starttime, @Param("endtime")String endtime, @Param("tname")String tname);

    //查询未审核的数据
    List<T> selectAllUnaudit(@Param("cname")String cname, @Param("dname")String dname, @Param("starttime")String starttime, @Param("endtime")String endtime, @Param("tname")String tname);

    //通过主键查询数据
    T selectByMajorKey(String majorkey);

    //更新数据
    int updateOne(@Param("entity")T t);

    //插入数据
    int insertOne(@Param("entity")T t);

    //审核通过
    void pass(@Param("majorkey")String majorkey,@Param("message")String messsage);

    //审核不通过
    void nopass(@Param("majorkey")String majorkey,@Param("message")String messsage);

    //保存附件路径
    void savePath(@Param("majorkey")String majorkey,@Param("path")String path);

    //获取附件路径
    String getPath(@Param("majorkey")String majorkey);

    //获取各学院项目数目
    List<Map<String, Integer>> getCollegeCount(@Param("starttime")String starttime,@Param("endtime")String endtime);

    //获取各专业项目数目
    List<Map<String, Integer>> getSdeptCount(@Param("starttime")String starttime,@Param("endtime")String endtime ,@Param("cname")String Cname);

    //获取近5年各学院项目数量
    List<Map<String, Integer>> getRecentYearsCount(@Param("starttime")String starttime,@Param("endtime")String endtime );

    //获取近5年各专业项目数量
    List<Map<String, Integer>> getRecentYearsSdeptCount(@Param("starttime")String starttime,@Param("endtime")String endtime,@Param("cname")String cname );

    //按主键删除信息
    int deleteByMajorkey(@Param("majorkey")String majorkey);

    //管理员修改信息
    void alterByMajorkey(@Param("entity")T t);

}
