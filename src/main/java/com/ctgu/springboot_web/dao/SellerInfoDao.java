package com.ctgu.springboot_web.dao;

import com.ctgu.springboot_web.entity.SellerInfo;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SellerInfoDao extends JpaRepository<SellerInfo, String> {
    public List<SellerInfo> findByUsernameAndPassword(String username, String password);
    //public void

}
