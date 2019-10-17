package com.ctgu.springboot_web.controller;

import com.ctgu.springboot_web.dao.DetailDao;
import com.ctgu.springboot_web.entity.Detail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class DetailCon {

    @Autowired
    DetailDao detailDao;

    @RequestMapping("/todetail")
    public String listdetail(Model model)
    {
        System.out.println("DetailCon Run!!!");
        List<Detail> details = detailDao.findAll();
        model.addAttribute("detail",details);
        return "detail/listdetail";
    }
}
