package com.ctgu.springboot_web.dao;

import com.ctgu.springboot_web.entity.Detail;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DetailDao extends JpaRepository<Detail, String> {
}
