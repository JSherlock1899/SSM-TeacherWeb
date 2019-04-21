package com.slxy.edu.model;

/**
 * @program: TeacherWeb
 * @description: Admin和Teacher的基类
 * @author: Mr.Jiang
 * @create: 2019-04-16 20:16
 **/

public class User {

    String username;
    String password;

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
