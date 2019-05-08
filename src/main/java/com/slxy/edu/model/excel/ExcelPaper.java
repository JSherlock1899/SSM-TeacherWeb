package com.slxy.edu.model.excel;

/**
 * @program: TeacherWeb
 * @description: 导出excel时的实体类
 * @author: Mr.Jiang
 * @create: 2019-05-03 18:30
 **/

public class ExcelPaper {

    private String pasearchnum;
    private String paname;
    private String tsn;
    private String tname;
    private String pawriter;
    private String papublish;
    private String padate;
    private String pagrad;
    private String pdisvol; //期卷页
    private String dependence;  //依赖项目
    private String cname;
    private String dnane;
    private String Tedubackground;//学历
    private String JobTitle;//职称
    private String paremarks;

    public ExcelPaper(String pasearchnum, String paname, String tsn, String tname, String pawriter, String papublish, String padate, String pagrad, String pdisvol, String dependence, String cname, String dnane, String tedubackground, String jobTitle, String paremarks) {
        this.pasearchnum = pasearchnum;
        this.paname = paname;
        this.tsn = tsn;
        this.tname = tname;
        this.pawriter = pawriter;
        this.papublish = papublish;
        this.padate = padate;
        this.pagrad = pagrad;
        this.pdisvol = pdisvol;
        this.dependence = dependence;
        this.cname = cname;
        this.dnane = dnane;
        Tedubackground = tedubackground;
        JobTitle = jobTitle;
        this.paremarks = paremarks;
    }

    //    导入


    public ExcelPaper(String pasearchnum, String paname, String tsn, String pawriter, String papublish, String padate, String pagrad, String pdisvol, String dependence, String paremarks) {
        this.pasearchnum = pasearchnum;
        this.paname = paname;
        this.tsn = tsn;
        this.pawriter = pawriter;
        this.papublish = papublish;
        this.padate = padate;
        this.pagrad = pagrad;
        this.pdisvol = pdisvol;
        this.dependence = dependence;
        this.paremarks = paremarks;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getTsn() {
        return tsn;
    }

    public void setTsn(String tsn) {
        this.tsn = tsn;
    }

    public String getPasearchnum() {
        return pasearchnum;
    }

    public void setPasearchnum(String pasearchnum) {
        this.pasearchnum = pasearchnum;
    }

    public String getPaname() {
        return paname;
    }

    public void setPaname(String paname) {
        this.paname = paname;
    }

    public String getPawriter() {
        return pawriter;
    }

    public void setPawriter(String pawriter) {
        this.pawriter = pawriter;
    }

    public String getPapublish() {
        return papublish;
    }

    public void setPapublish(String papublish) {
        this.papublish = papublish;
    }

    public String getPadate() {
        return padate;
    }

    public void setPadate(String padate) {
        this.padate = padate;
    }

    public String getPagrad() {
        return pagrad;
    }

    public void setPagrad(String pagrad) {
        this.pagrad = pagrad;
    }

    public String getPdisvol() {
        return pdisvol;
    }

    public void setPdisvol(String pdisvol) {
        this.pdisvol = pdisvol;
    }

    public String getDependence() {
        return dependence;
    }

    public void setDependence(String dependence) {
        this.dependence = dependence;
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

    public String getParemarks() {
        return paremarks;
    }

    public void setParemarks(String paremarks) {
        this.paremarks = paremarks;
    }
}
