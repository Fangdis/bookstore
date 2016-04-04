package com.zjnu.fd.bookstore.admin.controller;

import com.sun.javafx.sg.prism.NGShape;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by xqYang on 2016/4/3.
 */
@RequestMapping("admin")
@Controller
public class IndexController {
    @RequestMapping("index")
    public ModelAndView index(ModelAndView modelAndView){
        modelAndView.setViewName("index");
        return modelAndView;
    }
}
