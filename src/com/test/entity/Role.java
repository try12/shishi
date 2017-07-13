package com.test.entity;

import java.io.Serializable;

/**
 * Created by Administrator on 2017/7/12 0012.
 */
public class Role implements Serializable {
    private int rzid;
    private String roles;

    public Role(int rzid, String roles) {
        this.rzid = rzid;
        this.roles = roles;
    }

    public Role() {
    }

    public int getRzid() {
        return rzid;
    }

    public void setRzid(int rzid) {
        this.rzid = rzid;
    }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }
}
