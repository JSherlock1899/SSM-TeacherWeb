package com.slxy.edu.model;


public class Patent {

  private long patnum;
  private String patname;
  private String patsn;
  private java.sql.Date patapdate;
  private java.sql.Date patendate;
  private String patgrad;
  private String patremarks;
  private String tsn;
  private String paccessory;
  private String paudit;
  private String message;


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


  public java.sql.Date getPatapdate() {
    return patapdate;
  }

  public void setPatapdate(java.sql.Date patapdate) {
    this.patapdate = patapdate;
  }


  public java.sql.Date getPatendate() {
    return patendate;
  }

  public void setPatendate(java.sql.Date patendate) {
    this.patendate = patendate;
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

}
