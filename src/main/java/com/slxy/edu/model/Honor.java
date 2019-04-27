package com.slxy.edu.model;


public class Honor {

  private long hnum;
  private String hsn;
  private String hname;
  private String hwinner;
  private String hdate;
  private String hcompany;
  private String hgrad;
  private long hreward;
  private String hremarks;
  private String tsn;
  private String haudit;
  private String haccessory;
  private String message;
  private String department; //第一完成单位
  private String tname;
  private String cname;
  private String dnane;

  public Honor(String hsn, String hname, String hwinner, String hdate, String hcompany, String hgrad, String hremarks, String haudit, String haccessory, String message, String department, String tname, String cname, String dnane) {
    this.hsn = hsn;
    this.hname = hname;
    this.hwinner = hwinner;
    this.hdate = hdate;
    this.hcompany = hcompany;
    this.hgrad = hgrad;
    this.hremarks = hremarks;
    this.haudit = haudit;
    this.haccessory = haccessory;
    this.message = message;
    this.department = department;
    this.tname = tname;
    this.cname = cname;
    this.dnane = dnane;
  }

  public long getHnum() {
    return hnum;
  }

  public void setHnum(long hnum) {
    this.hnum = hnum;
  }

  public String getHsn() {
    return hsn;
  }

  public void setHsn(String hsn) {
    this.hsn = hsn;
  }

  public String getHname() {
    return hname;
  }

  public void setHname(String hname) {
    this.hname = hname;
  }

  public String getHwinner() {
    return hwinner;
  }

  public void setHwinner(String hwinner) {
    this.hwinner = hwinner;
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

  public long getHreward() {
    return hreward;
  }

  public void setHreward(long hreward) {
    this.hreward = hreward;
  }

  public String getHremarks() {
    return hremarks;
  }

  public void setHremarks(String hremarks) {
    this.hremarks = hremarks;
  }

  public String getTsn() {
    return tsn;
  }

  public void setTsn(String tsn) {
    this.tsn = tsn;
  }

  public String getHaudit() {
    return haudit;
  }

  public void setHaudit(String haudit) {
    this.haudit = haudit;
  }

  public String getHaccessory() {
    return haccessory;
  }

  public void setHaccessory(String haccessory) {
    this.haccessory = haccessory;
  }

  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public String getDepartment() {
    return department;
  }

  public void setDepartment(String department) {
    this.department = department;
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
