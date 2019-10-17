package com.ctgu.springboot_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonCon {

    @RequestMapping("/tohomepage")
    public  String toHomePage(){
        System.out.println("CommonCon Run!!!");
        return "config/homepage";
    }
}
