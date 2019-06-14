package com.qf.domain;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class HouseLog {

    private  Integer id;
    private  String IDnumber;
    private  String  password;
    private  String username;
    private  Integer status;
    private HouseList houseList;

    @Override
    public String toString() {
        return "HouseLog{" +
                "id=" + id +
                ", IDnumber='" + IDnumber + '\'' +
                ", password='" + password + '\'' +
                ", username='" + username + '\'' +
                ", status=" + status +
                ", houseList=" + houseList +
                '}';
    }

    public HouseList getHouseList() {
        return houseList;
    }

    public void setHouseList(HouseList houseList) {
        this.houseList = houseList;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIDnumber() {
        return IDnumber;
    }

    public void setIDnumber(String IDnumber) {
        this.IDnumber = IDnumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
