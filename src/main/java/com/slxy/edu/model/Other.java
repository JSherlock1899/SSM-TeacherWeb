package com.slxy.edu.model;


public class Other {

  private String other_name;
  private String tsn;
  private String other_date;
  private String publisher;
  private String accessory;
  private String audit;
  private String message;
  private String other_type;
  private String other_describe;
  private String tname;
  private String cname;
  private String dnane;

  public Other(String other_name, String other_date, String publisher, String accessory, String audit, String message, String other_type, String other_describe, String tname, String cname, String dnane) {
    this.other_name = other_name;
    this.other_date = other_date;
    this.publisher = publisher;
    this.accessory = accessory;
    this.audit = audit;
    this.message = message;
    this.other_type = other_type;
    this.other_describe = other_describe;
    this.tname = tname;
    this.cname = cname;
    this.dnane = dnane;
  }

    public Other(String other_name, String tsn, String other_date, String publisher, String accessory, String audit, String message, String other_type, String other_describe, String tname, String cname, String dnane) {
        this.other_name = other_name;
        this.tsn = tsn;
        this.other_date = other_date;
        this.publisher = publisher;
        this.accessory = accessory;
        this.audit = audit;
        this.message = message;
        this.other_type = other_type;
        this.other_describe = other_describe;
        this.tname = tname;
        this.cname = cname;
        this.dnane = dnane;
    }



    public Other(String other_name, String tsn, String other_date, String publisher, String accessory, String audit, String message, String other_type, String other_describe,String tname) {
    this.other_name = other_name;
    this.tsn = tsn;
    this.other_date = other_date;
    this.publisher = publisher;
    this.accessory = accessory;
    this.audit = audit;
    this.message = message;
    this.other_type = other_type;
    this.other_describe = other_describe;
    this.tname = tname;
  }


    public Other(String other_name, String other_date, String other_type, String publisher, String other_describe, String tsn, String audit,String message) {
        this.other_name = other_name;
        this.tsn = tsn;
        this.other_date = other_date;
        this.publisher = publisher;
        this.audit = audit;
        this.other_type = other_type;
        this.other_describe = other_describe;
    }

//    update

  public Other(String other_name, String other_date, String publisher, String audit, String other_type, String other_describe) {
    this.other_name = other_name;
    this.other_date = other_date;
    this.publisher = publisher;
    this.audit = audit;
    this.other_type = other_type;
    this.other_describe = other_describe;
  }

  public Other(String other_name, String tsn, String other_date, String publisher, String accessory, String other_type, String other_describe) {
    this.other_name = other_name;
    this.tsn = tsn;
    this.other_date = other_date;
    this.publisher = publisher;
    this.accessory = accessory;
    this.other_type = other_type;
    this.other_describe = other_describe;
  }

  public String getOther_name() {
    return other_name;
  }

  public void setOther_name(String other_name) {
    this.other_name = other_name;
  }

  public String getTsn() {
    return tsn;
  }

  public void setTsn(String tsn) {
    this.tsn = tsn;
  }

  public String getOther_date() {
    return other_date;
  }

  public void setOther_date(String other_date) {
    this.other_date = other_date;
  }

  public String getPublisher() {
    return publisher;
  }

  public void setPublisher(String publisher) {
    this.publisher = publisher;
  }

  public String getAccessory() {
    return accessory;
  }

  public void setAccessory(String accessory) {
    this.accessory = accessory;
  }

  public String getAudit() {
    return audit;
  }

  public void setAudit(String audit) {
    this.audit = audit;
  }

  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public String getother_type() {
    return other_type;
  }

  public void setother_type(String other_type) {
    this.other_type = other_type;
  }

  public String getother_describe() {
    return other_describe;
  }

  public void setother_describe(String other_describe) {
    this.other_describe = other_describe;
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
