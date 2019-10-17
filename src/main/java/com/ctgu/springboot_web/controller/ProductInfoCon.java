package com.ctgu.springboot_web.controller;

import com.ctgu.springboot_web.dao.ProductInfoDao;
import com.ctgu.springboot_web.entity.ProductInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class ProductInfoCon {

    @Autowired
    ProductInfoDao productInfoDao;

    @RequestMapping("/toproductinfo")
    public  String listproductinfo(Model model)
    {
        System.out.println("ProductInfoCon Run!!!");
        List<ProductInfo> productInfos = productInfoDao.findAll();
        model.addAttribute("productinfo", productInfos);
        return "productinfo/listproductinfo";
    }
}
