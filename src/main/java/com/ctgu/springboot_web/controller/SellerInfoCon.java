package com.ctgu.springboot_web.controller;

import com.ctgu.springboot_web.dao.SellerInfoDao;
import com.ctgu.springboot_web.entity.SellerInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;

@Controller
public class SellerInfoCon {

    @Autowired
    SellerInfoDao sellerInfoDao;

    @RequestMapping("/toseller")
    public String listseller(Model model) {
        System.out.println("SellerInfoCon Run!!!");
        List<SellerInfo> sellerInfos = sellerInfoDao.findAll();
        System.out.println("list sellerinfo success!!!");
        model.addAttribute("sellerinfo", sellerInfos);
        return "seller/listsellerinfo";
    }

    @GetMapping("/toaddsellerinfo")
    public String toaddsellerinfo() {
        return "seller/addsellerinfo";
    }

    @RequestMapping("/addsellerinfo")
    public String addsellerinfo(SellerInfo sellerInfo) {

        Date date = new Date();
        sellerInfo.setUpdateTime(date);
        sellerInfo.setCreateTime(date);
        //sellerInfo.setSellerId(date.toString().substring(0,15));
        //sellerInfo.setSellerId("0");
        System.out.println(sellerInfo);
        sellerInfoDao.save(sellerInfo);

        //System.out.println(sellerInfo);
        // sellerInfoDao.save(sellerInfo);
        //sellerInfoDao.save(sellerInfo);
        System.out.println("Insert SellerinfoSuccess!!!");

        return "redirect:/toseller";
    }

    @GetMapping("/toeditsellerinfo/{id}")
    public String toeditsellerinfo(@PathVariable("id") String id, Model model)
    {
        SellerInfo sellerInfo = sellerInfoDao.getOne(id);
        model.addAttribute("sellerinfo", sellerInfo);
        return "seller/updatesellerinfo";
    }

    @RequestMapping("/updatesellerinfo")
    public String updatesellerinfo(SellerInfo sellerInfo){
        sellerInfo.setUpdateTime(new Date());
        sellerInfoDao.save(sellerInfo);
        System.out.println("update SellerInfo Success!!!");
        return "redirect:/toseller";
    }

    @RequestMapping("/todeletesellerinfo/{id}")
    public String toeditsellerinfo(@PathVariable("id") String id)
    {
        sellerInfoDao.deleteById(id);
        System.out.println("delete Sellerinfo Success!!!");
        return "redirect:/toseller";
    }
}
