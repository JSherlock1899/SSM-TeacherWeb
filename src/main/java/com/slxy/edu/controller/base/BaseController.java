package com.slxy.edu.controller.base;

import java.lang.reflect.ParameterizedType;

/**
 * @program: TeacherWeb
 * @description: 控制基类
 * @author: Mr.Jiang
 * @create: 2019-04-21 15:45
 **/

public class BaseController<T> {

    public static String PROJECT_PAGE;
    public static String PAPER_PAGE;
    public static String HONOR_PAGE;
    public static String PATENT_PAGE;
    public static String OTHER_PAGE;
    public static String[] yearsArr = {"2015","2016","2017","2018","2019","2020"};

    public static final String PROJECT = "findProject.do";
    public static final String PAPER = "findPaper.do";
    public static final String HONOR = "findHonor.do";
    public static final String PATENT = "findPatent.do";
    public static final String OTHER = "findOther.do";

    public static final String PROJECT_LIST = "projectList";
    public static final String PAPER_LIST = "paperList";
    public static final String HONOR_LIST = "honorList";
    public static final String PATENT_LIST = "patentList";
    public static final String OTHER_LIST = "otherList";
    public BaseController() {
        
        //1.获取泛型的真实类型
        ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
        Class<?> modelClass = (Class<?>) type.getActualTypeArguments()[0];
        //2.获取模块名
        String modelName = modelClass.getSimpleName().toLowerCase();
        //3.给静态页面赋值
        PROJECT_PAGE = "admin/" + "project" + "/" + PROJECT_LIST;
        PAPER_PAGE = "admin/" + "paper" + "/" + PAPER_LIST;
        HONOR_PAGE = "admin/" + "honor" + "/" + HONOR_LIST;
        PATENT_PAGE = "admin/" +"patent" + "/" + PATENT_LIST;
        OTHER_PAGE = "admin/" + "other" + "/" + OTHER_LIST;
    }






}
