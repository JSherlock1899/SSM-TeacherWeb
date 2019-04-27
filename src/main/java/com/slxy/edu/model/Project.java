package com.slxy.edu.model;


public class Project {

    private Integer pnum;
  private String psn;
  private String pname;
  private String pmember;
  private String pgrad;
  private String pkind;
  private Integer pmoney;
  private String pstatime;
  private String pcondition;
  private String pendtime;
  private String premarks;
  private String tsn;
  private String pleader;
  private String paccessory;
  private String paudit;
  private String message;
  private String contractType;
  private String tname;
  private String cname;
  private String dnane;

  public Project(String psn, String pname, String pmember, String pgrad, String pkind, Integer pmoney, String pstatime, String pcondition, String pendtime, String premarks, String tsn, String pleader, String paccessory, String paudit, String message, String contractType, String tname, String cname, String dnane) {
    this.psn = psn;
    this.pname = pname;
    this.pmember = pmember;
    this.pgrad = pgrad;
    this.pkind = pkind;
    this.pmoney = pmoney;
    this.pstatime = pstatime;
    this.pcondition = pcondition;
    this.pendtime = pendtime;
    this.premarks = premarks;
    this.tsn = tsn;
    this.pleader = pleader;
    this.paccessory = paccessory;
    this.paudit = paudit;
    this.message = message;
    this.contractType = contractType;
    this.tname = tname;
    this.cname = cname;
    this.dnane = dnane;
  }

  public Integer getPnum() {
    return pnum;
  }

  public void setPnum(Integer pnum) {
    this.pnum = pnum;
  }

  public String getPsn() {
    return psn;
  }

  public void setPsn(String psn) {
    this.psn = psn;
  }

  public String getPname() {
    return pname;
  }

  public void setPname(String pname) {
    this.pname = pname;
  }

  public String getPmember() {
    return pmember;
  }

  public void setPmember(String pmember) {
    this.pmember = pmember;
  }

  public String getPgrad() {
    return pgrad;
  }

  public void setPgrad(String pgrad) {
    this.pgrad = pgrad;
  }

  public String getPkind() {
    return pkind;
  }

  public void setPkind(String pkind) {
    this.pkind = pkind;
  }

  public Integer getPmoney() {
    return pmoney;
  }

  public void setPmoney(Integer pmoney) {
    this.pmoney = pmoney;
  }

  public String getPstatime() {
    return pstatime;
  }

  public void setPstatime(String pstatime) {
    this.pstatime = pstatime;
  }

  public String getPcondition() {
    return pcondition;
  }

  public void setPcondition(String pcondition) {
    this.pcondition = pcondition;
  }

  public String getPendtime() {
    return pendtime;
  }

  public void setPendtime(String pendtime) {
    this.pendtime = pendtime;
  }

  public String getPremarks() {
    return premarks;
  }

  public void setPremarks(String premarks) {
    this.premarks = premarks;
  }

  public String getTsn() {
    return tsn;
  }

  public void setTsn(String tsn) {
    this.tsn = tsn;
  }

  public String getPleader() {
    return pleader;
  }

  public void setPleader(String pleader) {
    this.pleader = pleader;
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

  public String getContractType() {
    return contractType;
  }

  public void setContractType(String contractType) {
    this.contractType = contractType;
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
