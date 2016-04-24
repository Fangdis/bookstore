package com.zjnu.fd.bookstore.controller;

import com.zjnu.fd.bookstore.service.BookService;
import org.springframework.context.annotation.Conditional;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/**
 * Created by xqYang on 2016/3/26.
 */
@RequestMapping("")
@Controller
public class IndexController {
    @Resource
    private BookService bookService;

    @RequestMapping("")
    public ModelAndView index(ModelAndView modelAndView){
        modelAndView.setViewName("index/index");
        modelAndView.addObject("newBook",bookService.getNewBooks());
        modelAndView.addObject("bargainBook",bookService.getBargainPriceBooks());
        modelAndView.addObject("recommendBook",bookService.getRecommendBooks());
        return modelAndView;
    }

}
