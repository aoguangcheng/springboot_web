package com.ctgu.springboot_web.dao;

import com.ctgu.springboot_web.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;

//
public interface OrderDao extends JpaRepository<Order, String> {
}
