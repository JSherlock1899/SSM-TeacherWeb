package com.slxy.edu.model;


public class Patent {

  private long patnum;
  private String patname;
  private String patsn;
  private String patapdate;
  private String patendate;
  private String patgrad; //类型
  private String patremarks;
  private String tsn;
  private String paccessory;
  private String paudit;
  private String message;
  private String inventor;//发明人
  private String tname;
  private String cname;
  private String dnane;

  public Patent(long patnum, String patname, String patsn, String patapdate, String patendate, String patgrad, String patremarks, String tsn, String paccessory, String paudit, String message, String inventor) {
    this.patnum = patnum;
    this.patname = patname;
    this.patsn = patsn;
    this.patapdate = patapdate;
    this.patendate = patendate;
    this.patgrad = patgrad;
    this.patremarks = patremarks;
    this.tsn = tsn;
    this.paccessory = paccessory;
    this.paudit = paudit;
    this.message = message;
    this.inventor = inventor;
  }

  public Patent(String patname, String patsn, String patapdate, String patendate, String patgrad, String patremarks, String paccessory, String paudit, String message, String inventor, String tname, String cname, String dnane) {
    this.patname = patname;
    this.patsn = patsn;
    this.patapdate = patapdate;
    this.patendate = patendate;
    this.patgrad = patgrad;
    this.patremarks = patremarks;
    this.paccessory = paccessory;
    this.paudit = paudit;
    this.message = message;
    this.inventor = inventor;
    this.tname = tname;
    this.cname = cname;
    this.dnane = dnane;
  }

  public Patent(String patname, String patsn, String patapdate, String patendate, String patgrad, String patremarks, String paccessory, String paudit, String message, String inventor, String tname) {
    this.patname = patname;
    this.patsn = patsn;
    this.patapdate = patapdate;
    this.patendate = patendate;
    this.patgrad = patgrad;
    this.paccessory = paccessory;
    this.patremarks = patremarks;
    this.paudit = paudit;
    this.message = message;
    this.inventor = inventor;
    this.tname = tname;
  }

  public Patent(String patname, String patsn, String patapdate, String patendate, String patgrad, String patremarks, String inventor, String tsn,String paudit) {
    this.patname = patname;
    this.patsn = patsn;
    this.patapdate = patapdate;
    this.patendate = patendate;
    this.patgrad = patgrad;
    this.patremarks = patremarks;
    this.inventor = inventor;
    this.tsn = tsn;
    this.paudit = paudit;
  }

  public long getPatnum() {
    return patnum;
  }

  public void setPatnum(long patnum) {
    this.patnum = patnum;
  }

  public String getPatname() {
    return patname;
  }

  public void setPatname(String patname) {
    this.patname = patname;
  }

  public String getPatsn() {
    return patsn;
  }

  public void setPatsn(String patsn) {
    this.patsn = patsn;
  }

  public String getPatgrad() {
    return patgrad;
  }

  public void setPatgrad(String patgrad) {
    this.patgrad = patgrad;
  }

  public String getPatremarks() {
    return patremarks;
  }

  public void setPatremarks(String patremarks) {
    this.patremarks = patremarks;
  }

  public String getTsn() {
    return tsn;
  }

  public void setTsn(String tsn) {
    this.tsn = tsn;
  }

  public String getPaccessory() {
    return paccessory;
  }

  public void setPaccessory(String paccessory) {
    this.paccessory = paccessory;
  }

  public String getPaudit() {
    return paudit;
  }

  public void setPaudit(String paudit) {
    this.paudit = paudit;
  }

  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public String getInventor() {
    return inventor;
  }

  public void setInventor(String inventor) {
    this.inventor = inventor;
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

  public String getPatapdate() {
    return patapdate;
  }

  public void setPatapdate(String patapdate) {
    this.patapdate = patapdate;
  }

  public String getPatendate() {
    return patendate;
  }

  public void setPatendate(String patendate) {
    this.patendate = patendate;
  }
}
