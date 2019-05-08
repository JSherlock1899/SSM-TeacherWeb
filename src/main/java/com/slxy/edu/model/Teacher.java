package com.slxy.edu.model;



public class Teacher {

  private Integer tnum;
  private String tsn;
  private String tpsw;
  private String tname;
  private String tsex;
  private String csn;
  private String dsn;
  private String tdegree;
  private String tedubackground;
  private String tresdirection;
  private String tdateofbirth;
  private String jobTitle;
  private String cname;
  private String dname;


  public Teacher(String tsn, String tname, String tsex, String tdegree, String tedubackground, String tresdirection, String tdateofbirth, String jobTitle, String cname, String dname) {
    this.tsn = tsn;
    this.tname = tname;
    this.tsex = tsex;
    this.tdegree = tdegree;
    this.tedubackground = tedubackground;
    this.tresdirection = tresdirection;
    this.tdateofbirth = tdateofbirth;
    this.jobTitle = jobTitle;
    this.cname = cname;
    this.dname = dname;
  }


  public Teacher(String tsn, String tname, String tsex, String tdegree, String tedubackground, String tresdirection, String tdateofbirth, String jobTitle, String csn, String dsn,String dname) {
    this.tsn = tsn;
    this.tname = tname;
    this.tsex = tsex;
    this.tdegree = tdegree;
    this.tedubackground = tedubackground;
    this.tresdirection = tresdirection;
    this.tdateofbirth = tdateofbirth;
    this.jobTitle = jobTitle;
    this.csn = csn;
    this.dsn = dsn;
    this.dname = dname;
  }

  public Teacher(Integer tnum, String tsn, String tpsw, String tname, String tsex, String csn, String dsn, String tdegree, String tedubackground, String tresdirection, String tdateofbirth, String jobTitle) {
    this.tnum = tnum;
    this.tsn = tsn;
    this.tpsw = tpsw;
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

  public Integer getTnum() {
    return tnum;
  }

  public void setTnum(Integer tnum) {
    this.tnum = tnum;
  }

  public String getTsn() {
    return tsn;
  }

  public void setTsn(String tsn) {
    this.tsn = tsn;
  }

  public String getTpsw() {
    return tpsw;
  }

  public void setTpsw(String tpsw) {
    this.tpsw = tpsw;
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
}
