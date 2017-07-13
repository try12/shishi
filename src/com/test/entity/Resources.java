package com.test.entity;

import java.io.Serializable;
import java.util.Set;

/**
 * Created by Administrator on 2017/7/12 0012.
 */
public class Resources implements Serializable {

    private int id;
    private String text;
    private int r_id;
    private String url;
    private Set<Resources> children;


    public Set<Resources> getChildren() {
        return children;
    }
    public void setChildren(Set<Resources> children) {
        this.children = children;
    }
    public Resources() {
    }

    public Resources(int id, String text, int r_id, String url) {
        this.id = id;
        this.text = text;
        this.r_id = r_id;
        this.url = url;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public int getR_id() {
        return r_id;
    }

    public void setR_id(int r_id) {
        this.r_id = r_id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
