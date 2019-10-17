package com.ctgu.springboot_web.dao;

import com.ctgu.springboot_web.entity.ProductInfo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductInfoDao extends JpaRepository<ProductInfo, String> {
}
