package com.ctgu.springboot_web.dao;

import com.ctgu.springboot_web.entity.ProductCategory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductCategoryDao extends JpaRepository<ProductCategory, Integer> {
}
