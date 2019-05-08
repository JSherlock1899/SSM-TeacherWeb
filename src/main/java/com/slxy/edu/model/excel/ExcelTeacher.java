package com.slxy.edu.model.excel;

/**
 * @program: TeacherWeb
 * @description:导出excel时的实体类
 * @author: Mr.Jiang
 * @create: 2019-05-08 23:28
 **/

public class ExcelTeacher {

    private String tsn;
    private String tname;
    private String tsex;
    private String csn;
    private String dsn;
    private String tdegree;
    private String tedubackground;
    private String tresdirection;
    private String tdateofbirth;
    private String jobTitle;

    public ExcelTeacher(String tsn, String tname, String tsex, String tdegree, String tedubackground, String tresdirection, String tdateofbirth, String jobTitle, String csn, String dsn) {
        this.tsn = tsn;
        this.tname = tname;
        this.tsex = tsex;
        this.csn = csn;
        this.dsn = dsn;
        this.tdegree = tdegree;
        this.tedubackground = tedubackground;
        this.tresdirection = tresdirection;
        this.tdateofbirth = tdateofbirth;
        this.jobTitle = jobTitle;
    }


    public String getTsn() {
        return tsn;
    }

    public void setTsn(String tsn) {
        this.tsn = tsn;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getTsex() {
        return tsex;
    }

    public void setTsex(String tsex) {
        this.tsex = tsex;
    }

    public String getCsn() {
        return csn;
    }

    public void setCsn(String csn) {
        this.csn = csn;
    }

    public String getDsn() {
        return dsn;
    }

    public void setDsn(String dsn) {
        this.dsn = dsn;
    }

    public String getTdegree() {
        return tdegree;
    }

    public void setTdegree(String tdegree) {
        this.tdegree = tdegree;
    }

    public String getTedubackground() {
        return tedubackground;
    }

    public void setTedubackground(String tedubackground) {
        this.tedubackground = tedubackground;
    }

    public String getTresdirection() {
        return tresdirection;
    }

    public void setTresdirection(String tresdirection) {
        this.tresdirection = tresdirection;
    }

    public String getTdateofbirth() {
        return tdateofbirth;
    }

    public void setTdateofbirth(String tdateofbirth) {
        this.tdateofbirth = tdateofbirth;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }
}
