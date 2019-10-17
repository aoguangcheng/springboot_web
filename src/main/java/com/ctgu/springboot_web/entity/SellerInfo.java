package com.ctgu.springboot_web.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "seller_info")
public class SellerInfo {
    @Id
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "seller_id")
    private String sellerId;

    @Column(name = "username")
    private String username;

    @Column(name = "password")
    private String password;

    @Column(name = "openid")
    private String openid;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "update_time")
    private Date updateTime;

    public SellerInfo(String username, String password, String openid, Date createTime, Date updateTime) {
        this.username = username;
        this.password = password;
        this.openid = openid;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public SellerInfo() {
    }

    public String getSellerId() {
        return sellerId;
    }

    public void setSellerId(String sellerId) {
        this.sellerId = sellerId;
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

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return "SellerInfo{" +
                "sellerId='" + sellerId + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", openid='" + openid + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                '}';
    }
}
