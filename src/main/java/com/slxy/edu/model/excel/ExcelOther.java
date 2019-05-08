package com.slxy.edu.model.excel;

/**
 * @program: TeacherWeb
 * @description:导出excel时的实体类
 * @author: Mr.Jiang
 * @create: 2019-05-03 18:37
 **/

public class ExcelOther {

    private String other_name;
    private String tsn;
    private String tname;
    private String other_type;
    private String other_date;
    private String publisher;
    private String cname;
    private String dnane;
    private String Tedubackground;//学历
    private String JobTitle;//职称
    private String other_describe;

//    导入excel

    public ExcelOther(String other_name, String tsn, String other_type, String other_date, String publisher, String other_describe) {
        this.other_name = other_name;
        this.tsn = tsn;
        this.other_type = other_type;
        this.other_date = other_date;
        this.publisher = publisher;
        this.other_describe = other_describe;
    }

    public ExcelOther(String other_name, String tsn, String tname, String other_type, String other_date, String publisher, String cname, String dnane, String tedubackground, String jobTitle, String other_describe) {
        this.other_name = other_name;
        this.tsn = tsn;
        this.tname = tname;
        this.other_type = other_type;
        this.other_date = other_date;
        this.publisher = publisher;
        this.cname = cname;
        this.dnane = dnane;
        Tedubackground = tedubackground;
        JobTitle = jobTitle;
        this.other_describe = other_describe;
    }

    public String getTsn() {
        return tsn;
    }

    public void setTsn(String tsn) {
        this.tsn = tsn;
    }

    public String getOther_name() {
        return other_name;
    }

    public void setOther_name(String other_name) {
        this.other_name = other_name;
    }

    public String getOther_date() {
        return other_date;
    }

    public void setOther_date(String other_date) {
        this.other_date = other_date;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getOther_type() {
        return other_type;
    }

    public void setOther_type(String other_type) {
        this.other_type = other_type;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getDnane() {
        return dnane;
    }

    public void setDnane(String dnane) {
        this.dnane = dnane;
    }

    public String getTedubackground() {
        return Tedubackground;
    }

    public void setTedubackground(String tedubackground) {
        Tedubackground = tedubackground;
    }

    public String getJobTitle() {
        return JobTitle;
    }

    public void setJobTitle(String jobTitle) {
        JobTitle = jobTitle;
    }

    public String getOther_describe() {
        return other_describe;
    }

    public void setOther_describe(String other_describe) {
        this.other_describe = other_describe;
    }
}
