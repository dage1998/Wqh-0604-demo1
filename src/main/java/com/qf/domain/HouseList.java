package com.qf.domain;

import java.util.Date;

public class HouseList {

    private  Integer id;
    private  String name;
    private  Integer log_list;
    private  String house_type;
    private  Integer area;
    private  Date create_time;

    @Override
    public String toString() {
        return "HouseList{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", house_type='" + house_type + '\'' +
                ", area=" + area +
                ", create_time=" + create_time +
                '}';
    }

    public Integer getLog_list() {
        return log_list;
    }

    public void setLog_list(Integer log_list) {
        this.log_list = log_list;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHouse_type() {
        return house_type;
    }

    public void setHouse_type(String house_type) {
        this.house_type = house_type;
    }

    public Integer getArea() {
        return area;
    }

    public void setArea(Integer area) {
        this.area = area;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }
}
