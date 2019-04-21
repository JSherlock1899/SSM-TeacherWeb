package com.slxy.edu.model;


public class Admin extends User{

  private long anum;
  private String agrad;
  private String csn;
  private String dsn;


  public long getAnum() {
    return anum;
  }

  public void setAnum(long anum) {
    this.anum = anum;
  }

  public String getAgrad() {
    return agrad;
  }

  public void setAgrad(String agrad) {
    this.agrad = agrad;
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

}
