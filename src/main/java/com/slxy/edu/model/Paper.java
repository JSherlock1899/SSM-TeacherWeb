package com.slxy.edu.model;


public class Paper {

  private long panum;
  private String pasearchnum;
  private String paname;
  private String pawriter;
  private String papublish;
  private String padate;
  private String pagrad;
  private String tsn;
  private String paremarks;
  private String paudit;
  private String pdisvol; //期卷页
  private String paccessory;
  private String message;
  private String dependence;  //依赖项目
  private String tname;
  private String cname;
  private String dnane;

  public Paper(String pasearchnum, String paname, String pawriter, String papublish, String padate, String pagrad, String paremarks, String paudit, String pdisvol, String paccessory, String message, String dependence, String tname, String cname, String dnane,String tsn) {
    this.pasearchnum = pasearchnum;
    this.paname = paname;
    this.pawriter = pawriter;
    this.papublish = papublish;
    this.padate = padate;
    this.pagrad = pagrad;
    this.paremarks = paremarks;
    this.paudit = paudit;
    this.pdisvol = pdisvol;
    this.paccessory = paccessory;
    this.message = message;
    this.dependence = dependence;
    this.tname = tname;
    this.cname = cname;
    this.dnane = dnane;
    this.tsn = tsn;
  }

  public Paper(String pasearchnum, String paname, String pawriter, String papublish, String padate, String pagrad, String paremarks, String pdisvol, String paccessory, String dependence, String tname) {
    this.pasearchnum = pasearchnum;
    this.paname = paname;
    this.pawriter = pawriter;
    this.papublish = papublish;
    this.padate = padate;
    this.pagrad = pagrad;
    this.paremarks = paremarks;
    this.pdisvol = pdisvol;
    this.paccessory = paccessory;
    this.dependence = dependence;
    this.tname = tname;
  }

  public Paper(String pasearchnum, String paname, String pawriter, String papublish, String padate, String pagrad, String tsn, String paremarks, String paudit, String pdisvol, String paccessory, String message, String dependence,String tname) {
    this.pasearchnum = pasearchnum;
    this.paname = paname;
    this.pawriter = pawriter;
    this.papublish = papublish;
    this.padate = padate;
    this.pagrad = pagrad;
    this.tsn = tsn;
    this.paremarks = paremarks;
    this.paudit = paudit;
    this.pdisvol = pdisvol;
    this.paccessory = paccessory;
    this.message = message;
    this.dependence = dependence;
    this.tname = tname;
  }

  public Paper(String pasearchnum, String paname, String pawriter, String papublish, String padate, String pagrad, String tsn, String paremarks, String paudit, String pdisvol, String message, String dependence) {
    this.pasearchnum = pasearchnum;
    this.paname = paname;
    this.pawriter = pawriter;
    this.papublish = papublish;
    this.padate = padate;
    this.pagrad = pagrad;
    this.tsn = tsn;
    this.paremarks = paremarks;
    this.paudit = paudit;
    this.pdisvol = pdisvol;
    this.message = message;
    this.dependence = dependence;
  }

  public long getPanum() {
    return panum;
  }

  public void setPanum(long panum) {
    this.panum = panum;
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

  public String getTsn() {
    return tsn;
  }

  public void setTsn(String tsn) {
    this.tsn = tsn;
  }

  public String getParemarks() {
    return paremarks;
  }

  public void setParemarks(String paremarks) {
    this.paremarks = paremarks;
  }

  public String getPaudit() {
    return paudit;
  }

  public void setPaudit(String paudit) {
    this.paudit = paudit;
  }

  public String getPdisvol() {
    return pdisvol;
  }

  public void setPdisvol(String pdisvol) {
    this.pdisvol = pdisvol;
  }

  public String getPaccessory() {
    return paccessory;
  }

  public void setPaccessory(String paccessory) {
    this.paccessory = paccessory;
  }

  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public String getDependence() {
    return dependence;
  }

  public void setDependence(String dependence) {
    this.dependence = dependence;
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
}
