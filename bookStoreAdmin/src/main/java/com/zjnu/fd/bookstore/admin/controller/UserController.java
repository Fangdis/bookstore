package com.zjnu.fd.bookstore.admin.controller;

import com.zjnu.fd.bookstore.admin.po.User;
import com.zjnu.fd.bookstore.admin.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

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
}
