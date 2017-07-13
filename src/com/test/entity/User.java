package com.test.entity;

import java.io.Serializable;

/**
 * Created by Administrator on 2017/7/12 0012.
 */
public class User implements Serializable{

    private int uzid;
    private String users;
    private String pwd;
    private int uid;

    public User() {
    }

    public User(int uzid, String users, String pwd, int uid) {
        this.uzid = uzid;
        this.users = users;
        this.pwd = pwd;
        this.uid = uid;
    }

    public int getUzid() {

        return uzid;
    }

    public void setUzid(int uzid) {
        this.uzid = uzid;
    }

    public String getUsers() {
        return users;
    }

    public void setUsers(String users) {
        this.users = users;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }
}
