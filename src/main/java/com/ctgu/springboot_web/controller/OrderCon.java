package com.ctgu.springboot_web.controller;

import com.ctgu.springboot_web.dao.OrderDao;
import com.ctgu.springboot_web.entity.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class OrderCon {

    @Autowired
    OrderDao orderDao;

    @RequestMapping("/toorder")
    public String listorder(Model model)
    {
        System.out.println("OrderCon Run!!!");
        List<Order> orders = orderDao.findAll();
        model.addAttribute("orders", orders);
        return "order/listorder";
    }
}
