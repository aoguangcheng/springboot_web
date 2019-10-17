package com.ctgu.springboot_web.controller;

import com.ctgu.springboot_web.dao.SellerInfoDao;
import com.ctgu.springboot_web.entity.SellerInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class LoginController {

    @Autowired
    SellerInfoDao sellerInfoDao;


    @RequestMapping({"/login.html", "/", "index.html", "/index", "/login"})
    public  String LoginHandlerInterceptor(){
        return "config/login";
    }

    //@RequestMapping(value = "/user/login", method = RequestMethod.POST)

    @RequestMapping("/tologin")
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        Model model,
                        HttpSession session)
    {
        System.out.println("LoginController Run!!!");

        List<SellerInfo> sellerInfos = sellerInfoDao.findByUsernameAndPassword(username, password);

        if (sellerInfos.size() != 0)
        {
            session.setAttribute("loginUser", username);
            //return "redirect:/homepage.html";
            return "config/homepage";
        }
        else
        {
            model.addAttribute("msg", "用户名或密码错误！");
            return "config/login";

        }

    }


    @RequestMapping("/tologout")
    public String tologout(HttpSession session){
        session.removeAttribute("loginUser");
        return "redirect:/";
    }


}
