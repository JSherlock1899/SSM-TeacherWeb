package com.slxy.edu.model.excel;

/**
 * @program: TeacherWeb
 * @description: 导出excel时的实体类
 * @author: Mr.Jiang
 * @create: 2019-04-27 18:48
 **/

public class ExcelProject {

    private String Psn;
    private String Pname;
    private String Tsn;
    private String tname;
    private String Pmember;
    private String Pcondition;
    private String Pgrad;
    private String Pkind;
    private Float Pmoney;
    private String Pstatime;
    private String Pendtime;
    private String contractType;
    private String Cname;
    private String Dnane;
    private String Tedubackground;
    private String JobTitle;
    private String Premarks;
    private String Paudit;

//    导出

    public ExcelProject(String psn, String pname, String tsn, String tname, String pmember, String pcondition, String pgrad, String pkind, Float pmoney, String pstatime, String pendtime, String contractType, String cname, String dnane, String tedubackground, String jobTitle, String premarks) {
        Psn = psn;
        Pname = pname;
        Tsn = tsn;
        this.tname = tname;
        Pmember = pmember;
        Pcondition = pcondition;
        Pgrad = pgrad;
        Pkind = pkind;
        Pmoney = pmoney;
        Pstatime = pstatime;
        Pendtime = pendtime;
        this.contractType = contractType;
        Cname = cname;
        Dnane = dnane;
        Tedubackground = tedubackground;
        JobTitle = jobTitle;
        Premarks = premarks;
    }


//    导入excel

    public ExcelProject(String psn, String pname, String tsn, String pmember, String pcondition, String pgrad, String pkind, Float pmoney, String pstatime, String pendtime, String contractType, String premarks,String paudit) {
        Psn = psn;
        Pname = pname;
        Tsn = tsn;
        Pmember = pmember;
        Pcondition = pcondition;
        Pgrad = pgrad;
        Pkind = pkind;
        Pmoney = pmoney;
        Pstatime = pstatime;
        Pendtime = pendtime;
        this.contractType = contractType;
        Premarks = premarks;
        Paudit = paudit;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getTsn() {
        return Tsn;
    }

    public void setTsn(String tsn) {
        Tsn = tsn;
    }

    public String getPsn() {
        return Psn;
    }

    public void setPsn(String psn) {
        Psn = psn;
    }

    public String getPname() {
        return Pname;
    }

    public void setPname(String pname) {
        Pname = pname;
    }

    public String getPmember() {
        return Pmember;
    }

    public void setPmember(String pmember) {
        Pmember = pmember;
    }

    public String getPcondition() {
        return Pcondition;
    }

    public void setPcondition(String pcondition) {
        Pcondition = pcondition;
    }

    public String getPgrad() {
        return Pgrad;
    }

    public void setPgrad(String pgrad) {
        Pgrad = pgrad;
    }

    public String getPkind() {
        return Pkind;
    }

    public void setPkind(String pkind) {
        Pkind = pkind;
    }

    public Float getPmoney() {
        return Pmoney;
    }

    public void setPmoney(Float pmoney) {
        Pmoney = pmoney;
    }

    public String getPstatime() {
        return Pstatime;
    }

    public void setPstatime(String pstatime) {
        Pstatime = pstatime;
    }

    public String getPendtime() {
        return Pendtime;
    }

    public void setPendtime(String pendtime) {
        Pendtime = pendtime;
    }

    public String getContractType() {
        return contractType;
    }

    public void setContractType(String contractType) {
        this.contractType = contractType;
    }

    public String getCname() {
        return Cname;
    }

    public void setCname(String cname) {
        Cname = cname;
    }

    public String getDnane() {
        return Dnane;
    }

    public void setDnane(String dnane) {
        Dnane = dnane;
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

    public String getPremarks() {
        return Premarks;
    }

    public void setPremarks(String premarks) {
        Premarks = premarks;
    }

    public String getPaudit() {
        return Paudit;
    }

    public void setPaudit(String paudit) {
        Paudit = paudit;
    }
}
