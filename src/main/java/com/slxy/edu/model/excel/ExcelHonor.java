package com.slxy.edu.model.excel;

/**
 * @program: TeacherWeb
 * @description: 导出excel时的实体类
 * @author: Mr.Jiang
 * @create: 2019-05-03 18:36
 **/

public class ExcelHonor {

    private Integer hsn;
    private String hname;
    private String tsn;
    private String tname;
    private String department; //第一完成单位
    private String hdate;
    private String hcompany;
    private String hgrad;
    private String cname;
    private String dnane;
    private String Tedubackground;//学历
    private String JobTitle;//职称
    private String hremarks;
    private String haudit;


//   导出

    public ExcelHonor(Integer hsn, String hname, String tsn, String tname, String department, String hdate, String hcompany, String hgrad, String cname, String dnane, String tedubackground, String jobTitle, String hremarks) {
        this.hsn = hsn;
        this.hname = hname;
        this.tsn = tsn;
        this.tname = tname;
        this.department = department;
        this.hdate = hdate;
        this.hcompany = hcompany;
        this.hgrad = hgrad;
        this.cname = cname;
        this.dnane = dnane;
        Tedubackground = tedubackground;
        JobTitle = jobTitle;
        this.hremarks = hremarks;
    }


//    导入excel

    public ExcelHonor(String hname, String tsn, String department, String hdate, String hcompany, String hgrad, String hremarks,String haudit) {
        this.hname = hname;
        this.tsn = tsn;
        this.department = department;
        this.hdate = hdate;
        this.hcompany = hcompany;
        this.hgrad = hgrad;
        this.hremarks = hremarks;
        this.haudit = haudit;
    }

    public String getTsn() {
        return tsn;
    }

    public void setTsn(String tsn) {
        this.tsn = tsn;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public Integer getHsn() {
        return hsn;
    }

    public void setHsn(Integer hsn) {
        this.hsn = hsn;
    }

    public String getHname() {
        return hname;
    }

    public void setHname(String hname) {
        this.hname = hname;
    }

    public String getHdate() {
        return hdate;
    }

    public void setHdate(String hdate) {
        this.hdate = hdate;
    }

    public String getHcompany() {
        return hcompany;
    }

    public void setHcompany(String hcompany) {
        this.hcompany = hcompany;
    }

    public String getHgrad() {
        return hgrad;
    }

    public void setHgrad(String hgrad) {
        this.hgrad = hgrad;
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

    public String getHremarks() {
        return hremarks;
    }

    public void setHremarks(String hremarks) {

        this.hremarks = hremarks;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getHaudit() {
        return haudit;
    }

    public void setHaudit(String haudit) {
        this.haudit = haudit;
    }
}
