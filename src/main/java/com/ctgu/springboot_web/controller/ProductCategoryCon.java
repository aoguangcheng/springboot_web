package com.ctgu.springboot_web.controller;

import com.ctgu.springboot_web.dao.ProductCategoryDao;
import com.ctgu.springboot_web.entity.ProductCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;

@Controller
public class ProductCategoryCon {

    @Autowired
    ProductCategoryDao productCategoryDao;


    @RequestMapping("/toproductcategory")
    public String listproductcategory(Model model)
    {
        System.out.println("ProductCategoryCon Run!!!");
        List<ProductCategory> productCategories = productCategoryDao.findAll();
        model.addAttribute("productcategory", productCategories);
        return "productcategory/listproductcategory";
    }

    @RequestMapping("/toaddproductcategory")
    public String toaddproductcategory(){

        return "productcategory/addproductcategory";
    }

    @RequestMapping("/addproductcategory")
    public String toaddproductcategory(ProductCategory productCategory) throws Exception
    {
        productCategory.setCreateTime(new Date());
        productCategory.setUpdateTime(new Date());
        System.out.println(productCategory);
        productCategoryDao.save(productCategory);
        System.out.println("Insert ProductCategory Success!!!");
        return "redirect:/toproductcategory";
    }

    @RequestMapping("/toupdateproductcategory/{id}")
    public String toaddproductcategory(@PathVariable("id") Integer id, Model model){
        //ProductCategory productCategory = productCategoryDao.findById(id);
        model.addAttribute("productcategory",productCategoryDao.getOne(id));
        System.out.println(productCategoryDao.getOne(id));
        return "productcategory/updateproductcategory";
    }

    @RequestMapping("/updateproductcategory")
    public String updateproductcategory(ProductCategory productCategory)
    {
        productCategory.setUpdateTime(new Date());
        System.out.println("Staet to update productcategory");
        productCategoryDao.save(productCategory);

        System.out.println("inset update productcategory Success!!!");
        return "redirect:/toproductcategory";
    }

    @RequestMapping("/deleteproductcategory/{id}")
    public  String deleteproductcategory(@PathVariable("id") Integer id)
    {
        productCategoryDao.deleteById(id);
        System.out.println("delete productcategory Success!!!");
        return "redirect:/toproductcategory";
    }
}
