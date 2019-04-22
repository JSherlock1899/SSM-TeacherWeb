package com.slxy.edu.model;

import java.util.Date;

/**
 * @program: TeacherWeb
 * @description: 查询的条件类
 * @author: Mr.Jiang
 * @create: 2019-04-21 10:44
 **/

public class Condition {

    private String cname;
    private String dname;
    private Date starttime;
    private Date endtime;
    private String tname;


    public Condition(String cname, String dname, Date starttime, Date endtime, String tname) {
        this.cname = cname;
        this.dname = dname;
        this.starttime = starttime;
        this.endtime = endtime;
        this.tname = tname;
    }

    public Condition() {
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public String gettname() {
        return tname;
    }

    public void settname(String tname) {
        this.tname = tname;
    }
}
