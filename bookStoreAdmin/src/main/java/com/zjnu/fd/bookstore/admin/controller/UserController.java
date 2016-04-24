package com.zjnu.fd.bookstore.admin.controller;

import com.zjnu.fd.bookstore.admin.po.User;
import com.zjnu.fd.bookstore.admin.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by xqYang on 2016/4/3.
 */
@RequestMapping("user")
@Controller
public class UserController {
    @Resource
    private UserService userService;

    @RequestMapping("list")
    public ModelAndView list(ModelAndView modelAndView){
        List<User> users = userService.listAll(0, 100);
        modelAndView.setViewName("userManage/userList");
        modelAndView.addObject("users",users);
        return modelAndView;
    }
    @RequestMapping("delete")
    public ModelAndView delete(@RequestParam("id") int id,ModelAndView modelAndView){
        userService.delete(id);
        modelAndView.setViewName("redirect:/user/list.html");
        return modelAndView;
    }
    @RequestMapping("login")
    public ModelAndView login(@RequestParam("phone")String phone, @RequestParam("password") String password, ModelAndView modelAndView, HttpServletRequest request){
        User user=userService.findByPhone(phone);
        HttpSession session = request.getSession();
        Map map=new HashMap();
        if (user!=null&&user.getPassword().equals(password)){
            modelAndView.setViewName("redirect:/product/list.html");
            session.setAttribute("user",user);
        }else{
            modelAndView.setViewName("redirect:/user/loginPage.html");
        }
        return modelAndView;
    }
    @RequestMapping("loginPage")
    public ModelAndView loginPage(ModelAndView modelAndView){
        modelAndView.setViewName("index");
        return modelAndView;
    }
    @RequestMapping("loginOut")
    public ModelAndView loginOut(ModelAndView modelAndView,HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        modelAndView.setViewName("index");
        return modelAndView;
    }
}
